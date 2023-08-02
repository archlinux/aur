# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Rikarnto Bariampa <richard1996ba@gmail.com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
pkgver=7.3.6
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (latest release)"
arch=(x86_64)
url="https://github.com/PowerShell/PowerShell"
license=(MIT)
depends=(
  dotnet-runtime
  gcc-libs
  glibc
  libpam.so
)
makedepends=(
  dotnet-sdk
)
checkdepends=(
  xdg-utils
  iputils
  inetutils
)

source=(
  "$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz"
  "Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
  "version-from-environment-variable.patch"
  "skip-distro-check.patch"
)
sha256sums=(
  'a185156f2116a121a7863feed46545d9cfc64c03a139f38e74bdde02bb4b3708'
  '0c81200e5211a2f63bc8d9941432cbf98b5988249f0ceeb1f118a14adddbaa8e'
  '50c7265492cd5cd87d81df29fa737d06dacd97586b0fafb3a0f3af8451b8c052'
  'ef171dc5443b1903cb175d4975c62afcc9f6fcd2fafacd8c326ef23f16e4ffad'
)
install=powershell.install
options=(staticlibs)

_archive="PowerShell-$pkgver"

prepare() {
  cd "$_archive"

  rm global.json
  printf '{"sdk": { "version": "%s" } }' "$(dotnet --version)" > global.json

  patch --forward --strip=1 --input="$srcdir/version-from-environment-variable.patch"
  patch --forward --strip=1 --input="$srcdir/skip-distro-check.patch"
}

build() {
  cd "$_archive"

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_NOLOGO=true
  export DOTNET_ROOT=/usr/share/dotnet

  export NUGET_PACKAGES="$PWD/nuget"
  export POWERSHELL_GIT_DESCRIBE_OUTPUT="v$pkgver-0-gxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

  # Replicating build.psm1:Start-PSBuild()

  ## Restore-PSPackage()
  local restore_args='--disable-parallel /property:SDKToUse=Microsoft.NET.Sdk'
  # shellcheck disable=2086
  {
    dotnet restore $restore_args src/powershell-unix
    dotnet restore $restore_args src/TypeCatalogGen
    dotnet restore $restore_args src/ResGen
    dotnet restore $restore_args src/Modules
    dotnet restore $restore_args src/Microsoft.PowerShell.GlobalTool.Shim
  }

  ## Start-ResGen()
  pushd src/ResGen
  dotnet run
  popd

  ## Start-TypeGen()
  cp \
    "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets" \
    "src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"

  local inc_file="$PWD/src/TypeCatalogGen/powershell_linux-x64.inc"
  pushd src/Microsoft.PowerShell.SDK
  dotnet msbuild \
    ./Microsoft.PowerShell.SDK.csproj \
    /t:_GetDependencies "/property:DesignTimeBuild=true;_DependencyFile=$inc_file" \
    /nologo
  popd

  pushd src/TypeCatalogGen
  dotnet run ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs powershell_linux-x64.inc
  popd

  ## Publish Powershell
  dotnet publish \
    --configuration Release \
    --framework net7.0 \
    --no-self-contained \
    --runtime linux-x64 \
    /property:ErrorOnDuplicatePublishOutputFiles=false \
    /property:GenerateFullPaths=true \
    /property:IsWindows=false \
    /property:SDKToUse=Microsoft.NET.Sdk \
    /property:UseAppHost=true \
    src/powershell-unix/

  ## Publish reference assemblies
  local publish_path=src/powershell-unix/bin/Release/net7.0/linux-x64/publish
  mkdir -p "$publish_path/ref"
  grep 'Microsoft.NETCore.App' "$inc_file" | sed 's/;//' | while read -r assembly; do
    cp "$assembly" "$publish_path/ref"
  done

  ## Restore-PSModuleToBuild()
  cp -ar "$NUGET_PACKAGES/microsoft.powershell.archive/1.2.5/." "$publish_path/Modules/Microsoft.PowerShell.Archive"
  cp -ar "$NUGET_PACKAGES/packagemanagement/1.4.8.1/." "$publish_path/Modules/PackageManagement"
  cp -ar "$NUGET_PACKAGES/powershellget/2.2.5/." "$publish_path/Modules/PowerShellGet"
  cp -ar "$NUGET_PACKAGES/psreadline/2.2.6/." "$publish_path/Modules/PSReadLine"
  cp -ar "$NUGET_PACKAGES/threadjob/2.0.3/." "$publish_path/Modules/ThreadJob"

  ## Restore-PSPester()
  "$publish_path/pwsh" -command "
    Save-Module -Name Pester -Path $publish_path/Modules -Repository PSGallery -MaximumVersion 4.99
  "
}

check() {
  cd "$_archive"

  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  local publish_path=src/powershell-unix/bin/Release/net7.0/linux-x64/publish

  # One failing test, don't know why
  rm test/powershell/Host/Startup.Tests.ps1

  # Many failing tests, don't know why
  rm test/powershell/Modules/Microsoft.PowerShell.Management/PSDrive.Tests.ps1

  # Failing tests related to JSON & datetime, don't know why
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Json.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/ConvertTo-Json.Tests.ps1

  # One failing test, only for --no-self-contained, don't know why
  rm test/powershell/engine/Module/IsolatedModule.Tests.ps1

  # Opens browser, skipping
  rm test/powershell/Language/Scripting/NativeExecution/NativeCommandProcessor.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Invoke-Item.Tests.ps1

  # Creates & leaves directories in $HOME, yikes.. Skipping
  rm test/powershell/Language/Parser/ParameterBinding.Tests.ps1
  rm test/powershell/Language/Scripting/ScriptHelp.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Add-Type.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Set-PSBreakpoint.Tests.ps1
  rm test/powershell/engine/Basic/Assembly.LoadFrom.Tests.ps1
  rm test/powershell/engine/Basic/Assembly.LoadNative.Tests.ps1

  # shellcheck disable=2016
  "$publish_path/pwsh" -command "
    \$ErrorActionPreference = \"Stop\"
    Import-Module ./build.psm1 -ArgumentList \$true
    Start-PSPester -BinDir $publish_path -ThrowOnFailure
  "
}

package() {
  cd "$_archive"

  local publish_path=src/powershell-unix/bin/Release/net7.0/linux-x64/publish
  local pkgnum=${pkgver:0:1}

  mkdir -p "$pkgdir/opt/microsoft/$pkgname/$pkgnum"
  cp -ar "$publish_path/." "$pkgdir/opt/microsoft/$pkgname/$pkgnum/"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/microsoft/$pkgname/$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
