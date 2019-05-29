# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
binaryname=pwsh
_pkgver=6.2.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (latest release)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk>=2.0')
depends=('icu' 'openssl-1.0')
source=($pkgname::"git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver"
        'powershell-native::git+https://github.com/PowerShell/PowerShell-Native.git'
        'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets')
md5sums=('SKIP'
         'SKIP'
         '56f02557575a6022b60be609951eee78')
install=powershell.install

prepare() {
  cd $srcdir/powershell-native
  git submodule init
  git submodule update

  cd $srcdir/$pkgname
  rm global.json
}

build() {
  cd $pkgname
  DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

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

check() {
  cd $srcdir/powershell-native/src/libpsl-native
  make test

  cd $srcdir/powershell/test/xUnit
  dotnet test
}

package() {
  cd "$pkgname/src/powershell-unix"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -a "bin/Linux/netcoreapp2.1/linux-x64" "$pkgdir/usr/lib/$pkgname"
  chmod 755 "$pkgdir/usr/lib/$pkgname/linux-x64/$binaryname"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "../../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/linux-x64/$binaryname" "$pkgdir/usr/bin/$binaryname"

  chmod 644 \
    "$pkgdir/usr/lib/powershell/linux-x64/libhostfxr.so" \
    "$pkgdir/usr/lib/powershell/linux-x64/libhostpolicy.so" \
    "$pkgdir/usr/lib/powershell/linux-x64/en-US/default.help.txt" \
    "$pkgdir/usr/lib/powershell/linux-x64/Modules/PSDesiredStateConfiguration/PSDesiredStateConfiguration.psm1"
}
