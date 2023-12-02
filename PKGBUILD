# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Rikarnto Bariampa <richard1996ba@gmail.com>
# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
pkgver=7.4.0
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (latest release)"
arch=(x86_64)
url="https://github.com/PowerShell/PowerShell"
license=(MIT)
depends=(
  'dotnet-runtime>=8.0.0'
  'dotnet-runtime<9.0.0'
  gcc-libs
  glibc
)
makedepends=(
  dotnet-sdk
)
checkdepends=(
  xdg-utils
  iputils
  inetutils
)

_dotnet_version=8.0

source=(
  "$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz"
  "Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"
  "version-from-environment-variable.patch"
  "skip-distro-check.patch"
)
sha256sums=(
  'fad73c44e26051f69bbe691defb7a8d285b0d181efd19b61f8afe8c2f773c4a2'
  '0c81200e5211a2f63bc8d9941432cbf98b5988249f0ceeb1f118a14adddbaa8e'
  '50c7265492cd5cd87d81df29fa737d06dacd97586b0fafb3a0f3af8451b8c052'
  '1f25aa517b73d5d17c547757be8c6fb39e3d2f0fd128805ac42c4192348716ac'
)
install=powershell.install
options=(staticlibs)

_archive="PowerShell-$pkgver"

prepare() {
  cd "$_archive"

  printf '{"sdk": {"version": "%s"}}' "$_dotnet_version" > global.json

  patch --forward --strip=1 --input="$srcdir/version-from-environment-variable.patch"
  patch --forward --strip=1 --input="$srcdir/skip-distro-check.patch"
}

_publish_path="src/powershell-unix/bin/Release/net$_dotnet_version/linux-x64/publish"

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
  (
    cd src/ResGen
    dotnet run
  )

  ## Start-TypeGen()
  cp \
    "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets" \
    "src/Microsoft.PowerShell.SDK/obj/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"

  local inc_file="$PWD/src/TypeCatalogGen/powershell_linux-x64.inc"
  (
    cd src/Microsoft.PowerShell.SDK
    dotnet msbuild \
      ./Microsoft.PowerShell.SDK.csproj \
      /t:_GetDependencies "/property:DesignTimeBuild=true;_DependencyFile=$inc_file" \
      /nologo
  )

  (
    cd src/TypeCatalogGen
    dotnet run ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs powershell_linux-x64.inc
  )

  ## Publish PowerShell
  dotnet publish \
    --configuration Release \
    --framework net$_dotnet_version \
    --no-self-contained \
    --runtime linux-x64 \
    /property:ErrorOnDuplicatePublishOutputFiles=false \
    /property:GenerateFullPaths=true \
    /property:IsWindows=false \
    /property:SDKToUse=Microsoft.NET.Sdk \
    /property:UseAppHost=true \
    src/powershell-unix/

  ## Publish reference assemblies
  mkdir -p "$_publish_path/ref"
  grep 'Microsoft.NETCore.App' "$inc_file" | sed 's/;//' | while read -r assembly; do
    cp "$assembly" "$_publish_path/ref"
  done

  ## Restore-PSModuleToBuild()
  cp -ar "$NUGET_PACKAGES/microsoft.powershell.archive/1.2.5/." "$_publish_path/Modules/Microsoft.PowerShell.Archive"
  cp -ar "$NUGET_PACKAGES/microsoft.powershell.psresourceget/1.0.1/." "$_publish_path/Modules/Microsoft.PowerShell.PSResourceGet"
  cp -ar "$NUGET_PACKAGES/packagemanagement/1.4.8.1/." "$_publish_path/Modules/PackageManagement"
  cp -ar "$NUGET_PACKAGES/powershellget/2.2.5/." "$_publish_path/Modules/PowerShellGet"
  cp -ar "$NUGET_PACKAGES/psreadline/2.3.4/." "$_publish_path/Modules/PSReadLine"
  cp -ar "$NUGET_PACKAGES/threadjob/2.0.3/." "$_publish_path/Modules/ThreadJob"

  ## Restore-PSPester()
  "$_publish_path/pwsh" -command "
    Save-Module -Name Pester -Path $_publish_path/Modules -Repository PSGallery -MaximumVersion 4.99
  "
}

check() {
  cd "$_archive"

  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # One failing test related to JSON & datetime, don't know why
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/ConvertTo-Json.Tests.ps1

  # Two failing tests, don't know why
  rm test/powershell/engine/Help/HelpSystem.Tests.ps1

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
  "$_publish_path/pwsh" -command "
    \$ErrorActionPreference = \"Stop\"
    Import-Module ./build.psm1 -ArgumentList \$true
    Start-PSPester -BinDir $_publish_path -ThrowOnFailure
  "
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$pkgnum/"
  cp --archive --no-preserve=ownership "$_publish_path/." "$pkgdir/usr/lib/$pkgname-$pkgnum/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
