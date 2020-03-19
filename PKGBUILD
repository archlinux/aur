# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
_binaryname=pwsh
_pkgver=7.0.0
_pkgnum=${_pkgver:0:1}
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (latest release)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk')
depends=('krb5' 'gcc-libs' 'glibc' 'lttng-ust' 'zlib' 'openssl-1.0' 'icu')
source=($pkgname::"git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver"
        'powershell-native::git+https://github.com/PowerShell/PowerShell-Native.git'
        'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets')
md5sums=('SKIP'
         'SKIP'
         '56f02557575a6022b60be609951eee78')
install=powershell.install
options=(staticlibs !strip)

prepare() {
  cd "$srcdir/powershell-native"
  git submodule init
  git submodule update
}

build() {
  cd $pkgname
  DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  DOTNET_CLI_TELEMETRY_OPTOUT=true

  ## Restore
  dotnet restore src/powershell-unix
  dotnet restore src/ResGen
  dotnet restore src/TypeCatalogGen

  ## Setup the build target to gather dependency information
  cp "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets" "src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
  dotnet msbuild src/Microsoft.PowerShell.SDK/Microsoft.PowerShell.SDK.csproj /t:_GetDependencies "/property:DesignTimeBuild=true;_DependencyFile=$(pwd)/src/TypeCatalogGen/powershell.inc" /nologo

  ## Generate 'powershell.version'
  git --git-dir="$(pwd)/.git" describe --dirty --abbrev=60 > "$(pwd)/powershell.version"

  ## create the telemetry flag file
  touch "$(pwd)/DELETE_ME_TO_DISABLE_CONSOLEHOST_TELEMETRY"

  ## Generate resource binding C# files
  pushd src/ResGen
  dotnet run
  popd

  ## Generate 'CorePsTypeCatalog.cs'
  pushd src/TypeCatalogGen
  dotnet run ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs powershell.inc
  popd

  ## Build native component
  pushd $srcdir/powershell-native/src/libpsl-native
  cmake -DCMAKE_BUILD_TYPE=Debug .
  make -j
  popd

  ## Build powershell core
  dotnet publish --configuration Linux "src/powershell-unix/" --output bin --runtime "linux-x64"
}

package() {
  mkdir -pv "$pkgdir/opt/microsoft/$pkgname/$_pkgnum"
  cd "$srcdir/$pkgname/src/powershell-unix/bin/Linux/netcoreapp3.1/linux-x64/"

  cp -ar ./ "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/microsoft/$pkgname/$_pkgnum/$_binaryname" "$pkgdir/usr/bin/$_binaryname"
}
