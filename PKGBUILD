# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Rikarnto Bariampa <richard1996ba@gmail.com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
_binaryname=pwsh
pkgver=7.3.4
_pkgnum=${pkgver:0:1}
pkgrel=3
pkgdesc='A cross-platform automation and configuration tool/framework (latest release)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('cmake' 'dotnet-sdk' 'patchelf')
depends=('lttng-ust' 'dotnet-runtime' 'openssl-1.1')

_googletest_commit_hash=4e4df226fc197c0dda6e37f5c8c3845ca1e73a49
_powershell_native_version=7.3.2
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz"
        "powershell-native-$_powershell_native_version::https://github.com/PowerShell/PowerShell-Native/archive/refs/tags/v$_powershell_native_version.tar.gz"
        'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets'
        "googletest-$_googletest_commit_hash.tar.gz::https://github.com/google/googletest/archive/$_googletest_commit_hash.tar.gz"
        'version-from-environment-variable.patch')
sha256sums=('9503c21c767b49634aefbe5b48ec3dcde5b56a0703a2196f7d967d091c745d55'
            '1fcf21213a47f9554297f5cf3fc9adc866e037bde9a8d71c1c5889a2f5d79918'
            '8d10afb45883813f805bdf74ec445ae3f2fdbd4d30ab2ce7ce3a55df80693696'
            'eebf7507efcfe7a4dff5d69dcbe52ee090e99548c1407714fe10821ba359bf32'
            '50c7265492cd5cd87d81df29fa737d06dacd97586b0fafb3a0f3af8451b8c052')
install=powershell.install
options=(staticlibs)

_powershell_native_archive="PowerShell-Native-$_powershell_native_version"
_powershell_archive="PowerShell-$pkgver"
_googletest_archive="googletest-$_googletest_commit_hash"

prepare() {
  cd "$srcdir/$_powershell_archive"
  rm global.json
  patch --forward --strip=1 --input="${srcdir}/version-from-environment-variable.patch"

  cp -r "$srcdir/$_googletest_archive/." "$srcdir/$_powershell_native_archive/src/libpsl-native/test/googletest/"
}

build() {
  cd "$srcdir/$_powershell_archive"

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  export NUGET_PACKAGES="$srcdir/$_powershell_archive/nuget"

  # Mock git describe output that the build expects
  export POWERSHELL_GIT_DESCRIBE_OUTPUT="v$pkgver-0-gxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

  ## Restore
  dotnet restore src/powershell-unix
  dotnet restore src/ResGen
  dotnet restore src/TypeCatalogGen
  dotnet restore src/Modules

  ## Setup the build target to gather dependency information
  cp "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets" "src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
  dotnet msbuild src/Microsoft.PowerShell.SDK/Microsoft.PowerShell.SDK.csproj /t:_GetDependencies "/property:DesignTimeBuild=true;_DependencyFile=$(pwd)/src/TypeCatalogGen/powershell.inc" /nologo

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
  pushd "$srcdir/$_powershell_native_archive/src/libpsl-native"
  cmake -DCMAKE_BUILD_TYPE=Debug .
  make -j
  popd

  ## Build powershell core
  dotnet publish --no-self-contained --configuration Linux "src/powershell-unix/" --output bin --runtime "linux-x64"

  file=src/powershell-unix/bin/Linux/net7.0/linux-x64/libmi.so
  patchelf --replace-needed libcrypto.so.1.0.0  libcrypto.so.1.1 "$file"
  patchelf --replace-needed libssl.so.1.0.0  libssl.so.1.1 "$file"
}

check() {
  cd "$srcdir/$_powershell_native_archive/src/libpsl-native"
  make test

  cd "$srcdir/$_powershell_archive/test/xUnit"
  dotnet test
}

package() {
  mkdir -p "$pkgdir/opt/microsoft/$pkgname/$_pkgnum"
  cp -ar "$srcdir/$_powershell_archive/src/powershell-unix/bin/Linux/net7.0/linux-x64/." "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/"

  install -Dm644 "$srcdir/$_powershell_archive/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -ar "$srcdir/$_powershell_archive/nuget/psreadline/2.2.6/." "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/Modules/PSReadLine"
  cp -ar "$srcdir/$_powershell_archive/nuget/packagemanagement/1.4.8.1/." "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/Modules/PackageManagement"
  cp -ar "$srcdir/$_powershell_archive/nuget/powershellget/2.2.5/." "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/Modules/PowerShellGet"
  cp -ar "$srcdir/$_powershell_archive/nuget/threadjob/2.0.3/." "$pkgdir/opt/microsoft/$pkgname/$_pkgnum/Modules/ThreadJob"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/microsoft/$pkgname/$_pkgnum/$_binaryname" "$pkgdir/usr/bin/$_binaryname"
}
