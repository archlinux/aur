# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# For the current .NET of Arch Linux (dotnet-sdk) and, with the same contents, for its version
# (dotnet-sdk-10.0), like Arch Linux's dotnet-core: dotnet-build-deps and dotnet-build-deps-10.0 depend
# on one each. The unversioned package moves on with the next .NET, the versioned one then gets a
# PKGBUILD of its own. Both have the same library, so one debug package serves them.
_dotnetsdkver="10.0"
pkgbase=dotnet-system-io-ports-native
pkgname=("$pkgbase" "$pkgbase-$_dotnetsdkver" "$pkgbase-debug")
pkgver=10.0.14
pkgrel=4
pkgdesc="Native library of System.IO.Ports for .NET on Linux, runtime.linux-*.runtime.native.System.IO.Ports (NuGet package)"
arch=(x86_64 aarch64)
url='https://github.com/dotnet/runtime'
license=(MIT)
makedepends=(
  "dotnet-sdk-$_dotnetsdkver"
  clang
  cmake
  lld
)
checkdepends=(python)
# The library only ends up in $pkgdir inside the NuGet package, where makepkg can't strip it or split off its
# debug information, so its debug package would be empty. The runtime's build does both itself, and
# dotnet-system-io-ports-native-debug ships the debug information (see package_*-debug()).
options=(!debug)
# The runtime commit of the .NET release, from src/source-manifest.json of the dotnet/dotnet commit the
# 10.0.14 packages were published from (0427b9abbead3fa64c6655eb4290c537397131fa); the same commit as
# 10.0.13, 10.0.14 brought no runtime changes. The library isn't part of the source-built .NET of Arch
# Linux, so it's built for its version here.
_commit="6aa72daa24f66c01c3d7b6a32519e9d21396deec"
# Where ./aur-packages commits reads it from on upgrade, the native pack carries no repository commit on NuGet
_commit_lookup() {
  curl -fsSL "https://raw.githubusercontent.com/dotnet/dotnet/v$pkgver/src/source-manifest.json" |
    jq -r '.repositories[] | select(.path == "runtime") | .commitSha'
}
# The tarball of the commit, only the native sources are used
source=("runtime-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "check-serial.py")
sha512sums=('58c92aaa08d3f8ff4af9eb2c75b0d1559d62c23b6043d534e8bcb5cfb371446e5ceb0dd49dc9d11bfb3a8adfc4e66d78bd79c7af84661cffa2d51909fdda5e82'
  '52fccbac017ec1eb19d7b970aa3f28606986182eef0fdb84436d139399a4e7cc2ce77d74e03f738db1ab2c7bc7334e0a15811a938a7dd4860889bad4bc9b94e9')
b2sums=('993176a52c72dd0ba44d76c08ee72ff926e688c8bb9b9121c4fbbbbfe92286ae51516ec6d4ac37ebc4f09670fb7d027719012c6b513251c1166434c260cee914'
  '91c610080cc18e001e4559b7bda582d7fd9b31186d932a183a4f3805490b88ffab0345967c18b6d181e235b9603da6769c0d0773dde77b2693a471d179c0522b')

# The runtime's name of the architecture, and the portable RID the NuGet package is for
_arch() {
  case "$CARCH" in
    x86_64) echo x64 ;;
    aarch64) echo arm64 ;;
  esac
}

# The configuration of the runtime's native build, and the build folder of the library in it (relative to
# $srcdir)
_outconfig() {
  echo "net$_dotnetsdkver-linux-Release-$(_arch)"
}
_objdir() {
  echo "runtime-$_commit/artifacts/obj/native/$(_outconfig)/System.IO.Ports.Native"
}

# Where the debug package has the sources, as in makepkg's debug packages
_dbgsrcdir() {
  echo "${DBGSRCDIR:-/usr/src/debug}/$pkgbase"
}

prepare() {
  local _nugetid
  _nugetid="runtime.linux-$(_arch).runtime.native.System.IO.Ports"
  mkdir -p nupkg-src
  cat >nupkg-src/pack.csproj <<EOF
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net$_dotnetsdkver</TargetFramework>
    <IncludeBuildOutput>false</IncludeBuildOutput>
    <NuspecFile>$_nugetid.nuspec</NuspecFile>
  </PropertyGroup>
</Project>
EOF
  # Like upstream's package, minus the empty placeholders for the other platforms
  cat >"nupkg-src/$_nugetid.nuspec" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://schemas.microsoft.com/packaging/2013/05/nuspec.xsd">
  <metadata>
    <id>$_nugetid</id>
    <version>$pkgver</version>
    <authors>Microsoft</authors>
    <license type="expression">MIT</license>
    <projectUrl>https://dot.net/</projectUrl>
    <description>Internal implementation package not meant for direct consumption. Please do not reference directly.</description>
    <repository type="git" url="$url" commit="$_commit" />
  </metadata>
  <files>
    <file src="libSystem.IO.Ports.Native.so" target="runtimes/linux-$(_arch)/native" />
  </files>
</package>
EOF
}

build() {
  cd "runtime-$_commit" || exit
  # Configure the runtime's native libraries like upstream, but only build this one. After linking, the
  # build splits the debug information off into libSystem.IO.Ports.Native.so.dbg and strips the library
  # (with llvm-objcopy, from llvm, a dependency of clang).
  local _crossargs=()
  # A cross build ($CARCH differs from the build host) compiles with clang against the C library and GCC of
  # a root file system for $CARCH with base-devel, e.g. the Arch Linux ARM one of the native aarch64 build,
  # which the runtime's cross toolchain (eng/common/cross/toolchain.cmake) takes from ROOTFS_DIR. Its
  # default GNU triple is Debian's (aarch64-linux-gnu), TOOLCHAIN overrides it. The build takes CFLAGS, so
  # makepkg needs a configuration for $CARCH (e.g. makepkg --config), as for setting $CARCH.
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    if [[ ! -d "${ROOTFS_DIR:-}" ]]; then
      echo "dotnet-system-io-ports-native: a cross build needs ROOTFS_DIR set to a $CARCH root file system" >&2
      exit 1
    fi
    if [[ -z "${TOOLCHAIN:-}" && -d "$ROOTFS_DIR/usr/lib/gcc/$CARCH-unknown-linux-gnu" ]]; then
      export TOOLCHAIN="$CARCH-unknown-linux-gnu"
    fi
    _crossargs=(-cross)
  fi
  # The debug information refers to the sources where the debug package has them, like makepkg does with
  # its debug option, which also keeps the build directory out of the library (and its build ID)
  CFLAGS+=" -ffile-prefix-map=$srcdir=$(_dbgsrcdir)"
  ./src/native/libs/build-native.sh -release -arch "$(_arch)" -outconfig "$(_outconfig)" -configureonly "${_crossargs[@]}"
  cmake --build "artifacts/obj/native/$(_outconfig)" --target System.IO.Ports.Native
  install -Dm755 "$srcdir/$(_objdir)/libSystem.IO.Ports.Native.so" -t "$srcdir/nupkg-src/"

  cd "$srcdir/nupkg-src" || exit
  DOTNET_CLI_HOME="$srcdir/dotnet-home" DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1 NUGET_PACKAGES="$srcdir/nuget" \
    dotnet pack pack.csproj --output "$srcdir/nupkg"
}

check() {
  # The test loads the library, which on a cross build is for another architecture and can't run here.
  # Run it natively on the target instead.
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    echo 'dotnet-system-io-ports-native: skipping the test on a cross build; run it natively on the target' >&2
    return 0
  fi
  # The tests of System.IO.Ports need serial ports, drive a pseudo-terminal with the library instead
  python -I check-serial.py "$srcdir/nupkg-src/libSystem.IO.Ports.Native.so"
}

# Installs the files of the package $1
_package() {
  # With the packages of the .NET build it belongs to, apart from libraries built from other sources
  install -Dm644 "$srcdir/nupkg/runtime.linux-$(_arch).runtime.native.System.IO.Ports.$pkgver.nupkg" \
    -t "$pkgdir/usr/share/nuget/dotnet-$_dotnetsdkver/packages/"
  install -Dm644 "runtime-$_commit/LICENSE.TXT" -t "$pkgdir/usr/share/licenses/$1/"
}

# The current .NET's, which stands in for the versioned package while it has the same version
package_dotnet-system-io-ports-native() {
  provides=("$pkgbase-$_dotnetsdkver=$pkgver")
  conflicts=("$pkgbase-$_dotnetsdkver")
  _package "${FUNCNAME[0]#package_}"
}

package_dotnet-system-io-ports-native-10.0() {
  pkgdesc+=" (.NET $_dotnetsdkver)"
  _package "${FUNCNAME[0]#package_}"
}

# The debug information of the library, under its build ID, where debuggers find it for every copy of the
# library: the one in the NuGet package, and the ones applications ship, e.g. in $PSHOME of powershell
package_dotnet-system-io-ports-native-debug() {
  pkgdesc="Detached debugging symbols for dotnet-system-io-ports-native and dotnet-system-io-ports-native-$_dotnetsdkver"
  # makepkg would strip the debug information itself
  options=(!strip)
  local _dbg _buildid _file
  _dbg="$(_objdir)/libSystem.IO.Ports.Native.so.dbg"
  _buildid=$(LANG=C readelf -n "$_dbg" | sed -n '/Build ID/ { s/.*: //p; q; }')
  install -Dm644 "$_dbg" "$pkgdir/usr/lib/debug/.build-id/${_buildid:0:2}/${_buildid:2}.debug"
  # The sources it refers to, which build() mapped to $(_dbgsrcdir); the list is relative to that
  while IFS= read -r -d '' _file; do
    if [[ -f "$srcdir/$_file" ]]; then
      install -Dm644 "$srcdir/$_file" "$pkgdir$(_dbgsrcdir)/$_file"
    fi
  done < <(LANG=C debugedit --no-recompute-build-id --base-dir "$(_dbgsrcdir)" --list-file /dev/stdout "$_dbg" | sort -zu)
  install -Dm644 "runtime-$_commit/LICENSE.TXT" -t "$pkgdir/usr/share/licenses/$pkgbase-debug/"
}
