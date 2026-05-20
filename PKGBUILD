# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>

_name='powershell'
pkgname="$_name-git"
pkgver=7.7.0.preview.1.r11450.90d3b7f
_major=${pkgver:0:1}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (git version)'
arch=('x86_64')
url="https://github.com/$_name/$_name"
license=('MIT')
makedepends=(
  'cmake'
  'git'
  'jq'
  'dotnet-install' # AUR
)
depends=(
  'krb5'
  'gcc-libs'
  'glibc'
  'lttng-ust'
  'zlib'
  'icu'
  'openssl-1.0' # AUR
)
provides=("$_name")
conflicts=("$_name")
source=(
  "git+$url"
  "git+https://github.com/$_name/$_name-native"
  "git+https://github.com/google/googletest#commit=4e4df226fc197c0dda6e37f5c8c3845ca1e73a49"
  'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets'
  'nuget.config'
  'nuget.modules.config'
)
b2sums=(
  'SKIP'
  'SKIP'
  '2a652b5a8c0ffe9b3e5d8b225b9c2268d0770d0d8457cd78083c5adfc6cb85231adf318d81da104c5788d19a1c9b8cfba86e466cc73dd66cd3a21ee03177a6ba'
  '8f8dfbd0db3e04e4e1c743c54ab94f76ea276f9b2061c3ed421baa84c8e1a3a96387a477850439caa41fa6fb69a0f4ec26968cbbcff6036f9e6b3b64669a97f2'
  'd22f641a07c9fd1eb561a739a5e627c1f57575f64f14ea31cc36d266976a120ed748fe35ae5072e363bf2604b462a4db50ecac8817a84593674b2a62cf4d98f2'
  'd5d55a46d97a4fa827139a78b79f519299250f11cdd6625f7e593708614a20e2c2e70527d6d5d342584c969895c70e279a4bb27550c67d7b0735b11931016d30'
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
  
  ## Use public package sources
  cp "$srcdir/nuget.config" nuget.config
  cp "$srcdir/nuget.modules.config" src/Modules/nuget.config
  cp "$srcdir/nuget.modules.config" test/tools/Modules/nuget.config

  ## Install specified version of dotnet and restore
  dotnet-install --jsonfile global.json
  dotnet restore -r linux-x64 -p:SDKToUse=Microsoft.NET.Sdk
  dotnet restore -r linux-x64 -p:SDKToUse=Microsoft.NET.Sdk src/Modules
  
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
  cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_POLICY_VERSION_MINIMUM=3.5 -W no-dev .
  make
  popd

  ## Build powershell core
  dotnet publish src/powershell-unix \
    -p:GenerateFullPaths=true \
    -p:ErrorOnDuplicatePublishOutputFiles=false \
    -p:IsWindows=false \
    -p:AppDeployment=SelfContained \
    -p:SDKToUse=Microsoft.NET.Sdk \
    --sc \
    -c Linux \
    -r linux-x64
}

check() {
  ctest --test-dir "$_name-native/src/libpsl-native" --output-on-failure

  cd "$_name"
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_HOME="$srcdir/dotnet"
  export NUGET_PACKAGES="$srcdir/.nuget"
  export PATH="$PATH:$DOTNET_HOME"
  dotnet test -c Linux
}

package() {
  export NUGET_PACKAGES="$srcdir/.nuget"
  cd "$_name"
  mkdir -p "$pkgdir/opt/microsoft/$_name/$_major"
  _dn="$(jq -r .sdk.version global.json | awk -F. '{print $1 ".0"}')"
  mkdir -p "src/$_name-unix/bin/Linux/net$_dn/linux-x64/publish/ref"

  # Reference assemblies
  for file in $(cat src/TypeCatalogGen/$_name.inc); do
    _asm="${file:0:-1}"
    if [[ -z "$_asm" ]]; then
      continue
    fi
    cp "$_asm" "src/$_name-unix/bin/Linux/net$_dn/linux-x64/publish/ref"
  done

  # Modules
  for dep in "$(grep PackageReference src/Modules/PSGalleryModules.csproj)"; do
    _modname="$(echo $dep | awk -F\" '{print $2}')"
    _modname="${_modname,,}"
    _modver="$(echo $dep | awk -F\" '{print $4}' | awk -F. '{print $1 "." $2 "." $3}')"
    cp -r "$NUGET_PACKAGES/$_modname/$_modver/" "src/$_name-unix/bin/Linux/net$_dn/linux-x64/publish/Modules"
  done

  find "src/$_name-unix/bin/Linux/net$_dn/linux-x64/publish/Modules" \( \
    -name "*.nupkg" \
    -o -name "*.nupkg.sha512" \
    -o -name "*.nupkg.metadata" \
    -o -name "*.nuspec" \
    -o -name "System.Runtime.InteropServices.RuntimeInformation.dll" \
    -o -name "fullclr" \
  \) -delete

  cp -ar "src/$_name-unix/bin/Linux/net$_dn/linux-x64/publish/"* "$pkgdir/opt/microsoft/$_name/$_major"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/microsoft/$_name/$_major/pwsh" "$pkgdir/usr/bin/pwsh"
}

# vim: ts=2 sw=2 et:
