# Maintainer:

## options
: ${_build_avx:=false}
: ${_build_git:=false}

: ${_commit:=3a08ad18406efc1ddc4927a59bea715961bb63fa} # 0.1.7294
: ${_scripts:=scripts/deps}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="duckstation"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=0.1.7294
pkgrel=2
pkgdesc="Playstation emulator"
url="https://github.com/stenzek/duckstation"
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
  ## duckstation
  'libwebp'
  'libxrandr'
  'qt6-base'
  'sdl2'
)
makedepends=(
  ## compiler
  'clang'
  'lld'
  'llvm'

  ## build
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'

  ## duckstation
  'qt6-tools'
  'qt6-wayland'

  ## fixups
  'patchelf'
  'patchutils' # filterdiff
)

_source_duckstation() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --tag | sed -E 's/^[^0-9]*//;s/-/./g'
  }
}

_source_duckstation_git() {
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    local _tag=$(git tag | sed -E '/^.*[A-Za-z]{2}.*$/d' | sort -rV | head -1)
    local _pkgver=$(sed -E 's/^[^0-9]*//;s/-/./g' <<< "$_tag")
    local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
    local _commit=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.g%s" "${_pkgver:?}" "${_revision:?}" "${_commit:?}"
  }
}

_source_backtrace() {
  source+=(
    "ianlancetaylor.libbacktrace"::"git+https://github.com/ianlancetaylor/libbacktrace.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_cpuinfo() {
  _pkgsrc_cpuinfo="stenzek.cpuinfo"
  source+=(
    "$_pkgsrc_cpuinfo"::"git+https://github.com/stenzek/cpuinfo.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_discord_rpc() {
  _pkgsrc_discord_rpc="stenzek.discord-rpc"
  source+=(
    "$_pkgsrc_discord_rpc"::"git+https://github.com/stenzek/discord-rpc.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_lunasvg() {
  _pkgsrc_lunasvg="stenzek.lunasvg"
  source+=(
    "$_pkgsrc_lunasvg"::"git+https://github.com/stenzek/lunasvg.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_shaderc() {
  depends+=(
    'glslang'
    'spirv-tools'
  )
  makedepends+=(
    'spirv-headers'
  )

  _pkgsrc_shaderc="stenzek.shaderc"
  source+=(
    "$_pkgsrc_shaderc"::"git+https://github.com/stenzek/shaderc.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_soundtouch() {
  _pkgsrc_soundtouch="stenzek.soundtouch"
  source+=(
    "$_pkgsrc_soundtouch"::"git+https://github.com/stenzek/soundtouch.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_source_spirv_cross() {
  source+=(
    "khronosgroup.spirv-cross"::"git+https://github.com/KhronosGroup/SPIRV-Cross.git"
  )
  sha256sums+=(
    'SKIP'
  )
}

_prepare_backtrace() (
  local _version_backtrace=$(grep -E -m1 'LIBBACKTRACE=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*LIBBACKTRACE=(\S+)$&\1&')
  echo "backtrace = $_version_backtrace"
  git -c advice.detachedHead=false -C "$srcdir/ianlancetaylor.libbacktrace" checkout -f "$_version_backtrace"
)

_prepare_cpuinfo() (
  local _version_cpuinfo=$(grep -E -m1 'CPUINFO=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*CPUINFO=(\S+)$&\1&')
  echo "cpuinfo = $_version_cpuinfo"
  git -c advice.detachedHead=false -C "$srcdir/$_pkgsrc_cpuinfo" checkout -f "$_version_cpuinfo"
)

_prepare_discord_rpc() (
  local _version_discord_rpc=$(grep -E -m1 'DISCORD_RPC=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*DISCORD_RPC=(\S+)$&\1&')
  echo "discord-rpc = $_version_discord_rpc"
  git -c advice.detachedHead=false -C "$srcdir/$_pkgsrc_discord_rpc" checkout -f "$_version_discord_rpc"
)

_prepare_lunasvg() (
  local _version_lunasvg=$(grep -E -m1 'LUNASVG=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*LUNASVG=(\S+)$&\1&')
  echo "lunasvg = $_version_lunasvg"
  git -c advice.detachedHead=false -C "$srcdir/$_pkgsrc_lunasvg" checkout -f "$_version_lunasvg"
)

_prepare_shaderc() (
  local _version_shaderc=$(grep -E -m1 'SHADERC=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SHADERC=(\S+)$&\1&')
  echo "shaderc = $_version_shaderc"

  git -c advice.detachedHead=false -C "$srcdir/$_pkgsrc_shaderc" checkout -f "$_version_shaderc"

  cd "$srcdir/$_pkgsrc_shaderc"
  sed -E -e '/\(glslc\)/d;/examples/d;/third_party/d' \
    -i CMakeLists.txt
)

_prepare_soundtouch() (
  local _version_soundtouch=$(grep -E -m1 'SOUNDTOUCH=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SOUNDTOUCH=(\S+)$&\1&')
  echo "soundtouch = $_version_soundtouch"

  git -c advice.detachedHead=false -C "$srcdir/$_pkgsrc_soundtouch" checkout -f "$_version_soundtouch"
)

_prepare_spirv_cross() (
  local _version_spirv_cross=$(grep -E -m1 'SPIRV_CROSS=' "$_pkgsrc/$_scripts/build-dependencies-linux.sh" | sed -E -e 's&^\s*SPIRV_CROSS=(\S+)$&\1&')
  echo "spirv-cross = $_version_spirv_cross"

  git -c advice.detachedHead=false -C "$srcdir/khronosgroup.spirv-cross" checkout -f "$_version_spirv_cross"

  if [ -e "$srcdir/$_pkgsrc/$_scripts/spirv-cross-changes.patch" ]; then
    filterdiff "$srcdir/$_pkgsrc/$_scripts/spirv-cross-changes.patch" \
      > spirv-cross-changes.patch

    cd "khronosgroup.spirv-cross"
    git apply "$srcdir/spirv-cross-changes.patch"
  fi
)

_prepare_duckstation() {
  sed -E -e 's@#define AUTO_UPDATER_SUPPORTED@@' \
    -e 's@#if !__has_include\("scmversion/tag.h"\) && !defined\(_DEBUG\)@#if 0@' \
    -i "$_pkgsrc/src/duckstation-qt/autoupdaterdialog.cpp"

  sed -E -e 's& \| <a href="https://discord\.gg/\S+">.*?</a>&&' \
    -i "$_pkgsrc/src/duckstation-qt/aboutdialog.cpp"

  cat > "0000-help-menu.patch" << 'END'
--- a/src/duckstation-qt/mainwindow.ui
+++ b/src/duckstation-qt/mainwindow.ui
@@ -146,10 +146,6 @@
      <string>&amp;Help</string>
     </property>
     <addaction name="actionGitHubRepository"/>
-    <addaction name="actionIssueTracker"/>
-    <addaction name="actionDiscordServer"/>
-    <addaction name="separator"/>
-    <addaction name="actionCheckForUpdates"/>
     <addaction name="separator"/>
     <addaction name="actionViewThirdPartyNotices"/>
     <addaction name="actionAboutQt"/>
END

  patch -Np1 -F100 -d "$_pkgsrc" -i "../0000-help-menu.patch"

  cat >> "$_pkgsrc/src/scmversion/tag.h" << EOF
#pragma once
#define SCM_RELEASE_ASSET "$pkgname"
#define SCM_RELEASE_TAGS {"latest", "preview"}
#define SCM_RELEASE_TAG "latest"
EOF

  local _pkgver=$(pkgver)
  install -Dm755 /dev/stdin "$_pkgsrc/src/scmversion/gen_scmversion.sh" << END
#!/bin/sh
HASH="$(git -C "$_pkgsrc" rev-parse HEAD)"
BRANCH="AUR"
TAG="$_pkgver"
DATE=$(git -C "$_pkgsrc" log -1 --date=iso8601-strict --format=%cd)

cat > "scmversion.cpp" << EOF
const char* g_scm_hash_str = "\${HASH}";
const char* g_scm_branch_str = "\${BRANCH}";
const char* g_scm_tag_str = "\${TAG}";
const char* g_scm_date_str = "\${DATE}";

EOF
END
}

_build_backtrace() (
  echo "Building libbacktrace..."
  cd "ianlancetaylor.libbacktrace"

  autoreconf -fi
  ./configure
  make

  install -Dm644 .libs/libbacktrace.a -t "$srcdir/deps/"
  install -Dm644 *.h -t "$srcdir/deps/include/"
)

_build_cpuinfo() {
  echo "Building cpuinfo..."
  local _cmake_cpuinfo=(
    -B build_cpuinfo
    -S "$_pkgsrc_cpuinfo"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCPUINFO_LIBRARY_TYPE=shared
    -DCPUINFO_RUNTIME_TYPE=shared
    -DCPUINFO_LOG_LEVEL=error
    -DCPUINFO_LOG_TO_STDIO=ON
    -DCPUINFO_BUILD_TOOLS=OFF
    -DCPUINFO_BUILD_UNIT_TESTS=OFF
    -DCPUINFO_BUILD_MOCK_TESTS=OFF
    -DCPUINFO_BUILD_BENCHMARKS=OFF
    -DUSE_SYSTEM_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_cpuinfo[@]}"
  cmake --build build_cpuinfo
  DESTDIR="$srcdir/deps" cmake --install build_cpuinfo
}

_build_discord_rpc() {
  echo "Building discord-rpc..."
  local _cmake_discord_rpc=(
    -B build_discord_rpc
    -S "$_pkgsrc_discord_rpc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_discord_rpc[@]}"
  cmake --build build_discord_rpc
  DESTDIR="$srcdir/deps" cmake --install build_discord_rpc
}

_build_lunasvg() {
  echo "Building lunasvg..."
  local _cmake_lunasvg=(
    -B build_lunasvg
    -S "$_pkgsrc_lunasvg"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_lunasvg[@]}"
  cmake --build build_lunasvg
  DESTDIR="$srcdir/deps" cmake --install build_lunasvg
}

_build_shaderc() {
  echo "Building shaderc..."
  local _cmake_shaderc=(
    -B build_shaderc
    -S "$_pkgsrc_shaderc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSHADERC_SKIP_TESTS=ON
    -DSHADERC_SKIP_EXAMPLES=ON
    -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
    -Dglslang_SOURCE_DIR=/usr/include/glslang
    -Wno-dev
  )

  cmake "${_cmake_shaderc[@]}"
  cmake --build build_shaderc
  DESTDIR="$srcdir/deps" cmake --install build_shaderc
}

_build_soundtouch() {
  echo "Building soundtouch..."

  local _cmake_soundtouch=(
    -B build_soundtouch
    -S "$_pkgsrc_soundtouch"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_soundtouch[@]}"
  cmake --build build_soundtouch
  DESTDIR="$srcdir/deps" cmake --install build_soundtouch
}

_build_spirv_cross() {
  echo "Building spirv-cross..."

  local _cmake_spirv_cross=(
    -B build_spirv_cross
    -S "khronosgroup.spirv-cross"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSPIRV_CROSS_SHARED=ON
    -DSPIRV_CROSS_STATIC=OFF
    -DSPIRV_CROSS_CLI=OFF
    -DSPIRV_CROSS_ENABLE_TESTS=OFF
    -DSPIRV_CROSS_ENABLE_GLSL=ON
    -DSPIRV_CROSS_ENABLE_HLSL=OFF
    -DSPIRV_CROSS_ENABLE_MSL=OFF
    -DSPIRV_CROSS_ENABLE_CPP=OFF
    -DSPIRV_CROSS_ENABLE_REFLECT=OFF
    -DSPIRV_CROSS_ENABLE_C_API=ON
    -DSPIRV_CROSS_ENABLE_UTIL=ON
    -Wno-dev
  )

  cmake "${_cmake_spirv_cross[@]}"
  cmake --build build_spirv_cross
  DESTDIR="$srcdir/deps" cmake --install build_spirv_cross
}

_build_duckstation() {
  echo "Building duckstation..."

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_NOGUI_FRONTEND=OFF
    -DBUILD_QT_FRONTEND=ON
    -DDiscordRPC_DIR="$srcdir/deps/usr/lib/cmake/DiscordRPC"
    -DLIBBACKTRACE_INCLUDE_DIR="$srcdir/deps/include"
    -DLIBBACKTRACE_LIBRARY="$srcdir/deps/libbacktrace.a"
    -DSHADERC_INCLUDE_DIR="$srcdir/deps/usr/include"
    -DSHADERC_LIBRARY="$srcdir/deps/usr/lib/libshaderc_shared.so"
    -DShaderc_DIR="$srcdir/deps/usr/lib/cmake/Shaderc" # git
    -DSoundTouch_DIR="$srcdir/deps/usr/lib/cmake/SoundTouch"
    -Dcpuinfo_DIR="$srcdir/deps/usr/share/cpuinfo"
    -Dspirv_cross_c_shared_DIR="$srcdir/deps/usr/share/spirv_cross_c_shared/cmake"
    -Wno-dev
  )

  if [[ "${_build_git::1}" == "t" ]]; then
    _cmake_options+=(-Dlunasvg_DIR="$srcdir/deps/usr/lib/cmake/lunasvg")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

_build_env() {
  export AR CC CXX CFLAGS CXXFLAGS LDFLAGS
  AR="llvm-ar"
  CC="clang"
  CXX="clang++"
  LDFLAGS+=" -fuse-ld=lld"

  if [[ "${_build_avx::1}" == "t" ]]; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi
}

prepare() {
  _prepare_backtrace
  _prepare_cpuinfo
  _prepare_discord_rpc
  _prepare_shaderc
  _prepare_soundtouch
  _prepare_spirv_cross

  if [[ "${_build_git::1}" == "t" ]]; then
    _prepare_lunasvg
  fi

  _prepare_duckstation
}

build() {
  _build_env

  _build_backtrace
  _build_cpuinfo
  _build_discord_rpc
  _build_shaderc
  _build_soundtouch
  _build_spirv_cross

  if [[ "${_build_git::1}" == "t" ]]; then
    _build_lunasvg
  fi

  _build_duckstation
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp --reflink=auto -r build/bin/{resources,translations,duckstation-qt} "$pkgdir/opt/$_pkgname/"

  # rpath
  patchelf --force-rpath --set-rpath "/opt/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname-qt"

  # libraries
  install -Dm644 "$srcdir/deps/usr/lib"/*.so* -t "$pkgdir/opt/$_pkgname/"

  # icon
  install -Dm644 "$pkgdir/opt/$_pkgname/resources/images/duck.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec /opt/$_pkgname/$_pkgname-qt "\$@"
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=DuckStation
GenericName=PlayStation Emulator
Comment=PlayStation emulator
Icon=$_pkgname
TryExec=$_pkgname
Exec=$_pkgname %f
Terminal=false
StartupNotify=true
Categories=Game;Emulator;Qt;
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

if [[ "${_build_git::1}" == "t" ]]; then
  _source_duckstation_git
  _source_lunasvg
else
  _source_duckstation
fi

_source_backtrace
_source_cpuinfo
_source_discord_rpc
_source_shaderc
_source_soundtouch
_source_spirv_cross
