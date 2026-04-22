# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# vim: ts=2 sw=2 et:

_name='powershell'
pkgname="$_name-git"
_binaryname='pwsh'
pkgver=7.6.1.r11423.1799667
_major=${pkgver:0:1}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (git version)'
arch=('x86_64')
url="https://github.com/$_name/$_name"
license=('MIT')
makedepends=(
  'git'
  'cmake'
  'jq'
)
depends=(
  'krb5'
  'gcc-libs'
  'glibc'
  'lttng-ust'
  'zlib'
  'icu'
  # AUR
  'dotnet-install'
  'openssl-1.0'
)
provides=("$_name")
conflicts=("$_name")
source=(
  "git+$url"
  "git+https://github.com/$_name/$_name-native"
  "git+https://github.com/google/googletest#commit=4e4df226fc197c0dda6e37f5c8c3845ca1e73a49"
  'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '129bbf3ed96922525dc3e3d54115ec0932091025d60403addb75c35dd8cf3252'
  '8d10afb45883813f805bdf74ec445ae3f2fdbd4d30ab2ce7ce3a55df80693696'
)
install=powershell.install
options=(staticlibs !strip)

pkgver() {
  cd "$_name"
  _tag="$(git tag -l 'v*' | tail -1 | sed 's/^v//;s/-/./g')"
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_HOME="$srcdir/.dotnet"
  export NUGET_PACKAGES="$srcdir/.nuget"
  export DOTNET_INSTALL_DIR="$DOTNET_HOME"
  export PATH="$PATH:$DOTNET_HOME"
  cd "$_name"

  ## Install specified version of dotnet and restore
  dotnet-install --jsonfile global.json
  dotnet restore
  
  ## Setup the build target to gather dependency information
  cp "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets" "src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
  dotnet msbuild src/Microsoft.PowerShell.SDK/Microsoft.PowerShell.SDK.csproj /t:_GetDependencies "/p:DesignTimeBuild=true;_DependencyFile=$(pwd)/src/TypeCatalogGen/$_name.inc"
  
  ## create the telemetry flag file
  touch DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY
  
  cd "../$_name-native"
  git submodule init
  git config submodule.src/libpsl-native/test/googletest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_name"
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_HOME="$srcdir/.dotnet"
  export NUGET_PACKAGES="$srcdir/.nuget"
  export PATH="$PATH:$DOTNET_HOME"

  ## Generate 'powershell.version'
  git describe --dirty --abbrev=60 > "$_name.version"

  ## Generate resource binding C# files
  pushd src/ResGen
  dotnet run
  popd

  ## Generate 'CorePsTypeCatalog.cs'
  pushd src/TypeCatalogGen
  dotnet run ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs "$_name.inc"
  popd

  ## Build native component
  pushd "$srcdir/$_name-native/src/libpsl-native"
  sed -i 's/-D_FORTIFY_SOURCE=2/-fPIC/' CMakeLists.txt # -Werror...
  cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_POLICY_VERSION_MINIMUM=3.5 .
  make
  popd

  ## Build powershell core
  dotnet publish -c Linux "src/$_name-unix/" -o bin -r linux-x64 --sc
}

check() {
  cd "$_name-native/src/libpsl-native"
  make test

  cd "$srcdir/$_name"
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_HOME="$srcdir/dotnet"
  export NUGET_PACKAGES="$srcdir/.nuget"
  export PATH="$PATH:$DOTNET_HOME"
  dotnet test
}

package() {
  cd "$_name"
  mkdir -pv "$pkgdir/opt/microsoft/$_name/$_major"
  _dn="$(jq -r .sdk.version global.json | awk -F. '{print $1 "." $2}')"
  cp -ar "src/$_name-unix/bin/Linux/net$_dn/linux-x64/"* "$pkgdir/opt/microsoft/$_name/$_major"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/microsoft/$_name/$_major/pwsh" "$pkgdir/usr/bin/pwsh"
}
