# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Rikarnto Bariampa <richard1996ba@gmail.com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

#######################################################################
# WARNING ABOUT check()
#
# The tests that come with PowerShell are being run by upstream in
# their CI and aren't really for testing a built PowerShell by users.
# Their CI agents have no persistent homes, so they can pollute their
# environment freely and their environment is also consistent.
#
# A significant number of tests don't use -NoProfile when calling pwsh,
# which can cause tests to fail if any form of profile is being loaded.
# Other tests have side effects or try to install test modules to the
# CurrentUser scope.
#
# While they can work in a normal build, I would strongly recommend to
# build PowerShell in a clean chroot (e.g. with pkgctl build) to prevent
# such issues and keep the home of the user building the package clean.
#######################################################################

pkgname=powershell
pkgver=7.6.5
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=('x86_64')
url='https://microsoft.com/PowerShell'
license=('MIT')
options=('!debug')
_dotnetsdkver="10.0"
depends=(
  dotnet-runtime-"$_dotnetsdkver"
  libgcc
  # xdg-utils are indirectly needed for System.Diagnostics.Process() with
  # ProcessStartInfo.UseShellExecute (see src/System/Diagnostics/Process.Linux.cs of the dotnet runtime)
  # PowerShell relies on this for its invoke logic, c.f. src/System.Management.Automation/namespaces/FileSystemProvider.cs
  xdg-utils
)
backup=('etc/powershell.config.json')
optdepends=('openssh: PowerShell Remoting over ssh'
  'xclip: Clipboard functionality'
  'powershell-dsc: PowerShell Desired State Configuration v3 support'
  'powershell-editor-services: Language server and debug adapter for PowerShell editor support')
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
  rsync
  ruby-ronn
)
checkdepends=(
  # ASP.NET is needed for test/tools/WebListener
  aspnet-targeting-pack-"$_dotnetsdkver"
  aspnet-runtime-"$_dotnetsdkver"
  bash          # Needed for various tests, e.g. test/powershell/Language/Scripting/NativeExecution/NativeLinuxCommands.Tests.ps1
  expect        # Needed for test/powershell/Host/Read-Host.Tests.ps1
  glibc-locales # Ensures generated en-US locale is present. Tests need to be run in that locale and we can't call locale-gen from a PKGBUILD.
  grep          # Used widely in tests
  inetutils     # Needed for test/powershell/Modules/Microsoft.Powershell.Host/Start-Transcript.Tests.ps1
  iputils       # Needed for ping, which is used in a lot of places
  lttng-ust2.12 # Used for CoreCLR tracing, adds to reproducibility here
  openssh       # Needed for test/powershell/engine/Remoting/SSHRemotingCmdlets.Tests.ps1
  procps-ng     # Needed for test/powershell/Language/Scripting/NativeExecution/NativeCommandProcessor.Tests.ps1
  xclip         # Needed for test/powershell/Modules/Microsoft.PowerShell.Management/Clipboard.Tests.ps1
)
install=powershell.install

source=("git+https://github.com/PowerShell/PowerShell.git#tag=v$pkgver")
sha512sums=('015912c995c20158ac16557a4b9e8a7acfac26f8a256076f108e1dec8f5226eef0a642dd97b7f5d31cb398aaab5f83e58015e81bfeb23743878ab8858514573a')
b2sums=('e74fbead4c4af08182aa808f166ce9edffca064be15676dad88af7d99714fc8cbfb359d38f44073cb442e10dae102475563ad753a1adbd0939bb11105ae8487d')

prepare() {
  cd PowerShell
  local _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"

  # We first determine the exact SDK and runtime versions for later usage
  _sdkver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")
  _runtimepath="/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever"

  # Update global.json to match with the current SDK
  rm global.json
  _sdkver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  DOTNET_NOLOGO=1 dotnet new globaljson --sdk-version "$_sdkver"

  ## Switch-PSNugetConfig()
  # We're switching to the public nuget.org feed
  sed -i -e 's|<add key="powershell".*$|<add key="nuget.org" value="https://api.nuget.org/v3/index.json" />|g' nuget.config
  sed -i -e 's|<add key="powershell".*$|<add key="psgallery" value="https://www.powershellgallery.com/api/v2/" />|g' \
    src/Modules/nuget.config \
    test/tools/Modules/nuget.config

  # There's no point to run analyzers in a PKGBUILD
  sed -i -e '/PackageReference/d' Analyzers.props

  # Remove Telemetry entirely from the code
  # The sed hack deletes any line calling ApplicationInsightsTelemetry call, as well as any using statements
  # for Microsoft.PowerShell.Telemetry. The calls have no side effects, so can simply be removed from the code.
  # Doing so allows us to purge Telemetry.cs and Microsoft.ApplicationInsights from the build entirely
  find src -type f -name "*.cs" -exec sed -i -E \
    -e '/ApplicationInsightsTelemetry\.\w+\([^)]*$/,/\)/d' \
    -e '/ApplicationInsightsTelemetry/d' \
    -e '/Microsoft.PowerShell.Telemetry/d' {} \;
  rm src/System.Management.Automation/utils/Telemetry.cs
  sed -i -e '/Microsoft.ApplicationInsights/d' src/System.Management.Automation/System.Management.Automation.csproj

  # Next we convert quite a bit to framework refs
  # This doesn't change anything really about the binaries that are generated
  # but saves over a gigabyte of unnecessary NuGet downloads.
  while read -r _csproj; do
    sed -i -E -e 's/netstandard2\.0/net'"$_dotnetsdkver"'/' \
      -e 's|(RuntimeIdentifiers>)[^<]*|\1linux-x64|' "$_csproj"
    if [[ "$_csproj" =~ .*PSVersionInfoGenerator.csproj ]]; then
      sed -i -e '/<PackageReference Include="System/d' "$_csproj"
    fi

    while read -r _packref; do
      # shellcheck disable=SC2001
      _packname=$(echo "$_packref" | sed -E -e 's/.*Include="([^"]+).*/\1/' -)

      if [[ -f "${_runtimepath}/${_packname}.dll" ]]; then
        sed -i -E 's|.*"'"$_packname"'".*|<FrameworkReference Include="'"$_packname"'"/>|' "$_csproj"
      elif [[ "$_packname" =~ runtime\..* ]] && [[ ! "$_packname" == *"linux-x64"* ]]; then
        sed -i "/\"${_packname}\"/d" "$_csproj"
      fi
    done < <(grep PackageReference "$_csproj")
  done < <(find . -type f -name "*.csproj")

  export NUGET_PACKAGES="$PWD/nuget"
  dotnet new tool-manifest
  dotnet tool install dotnet-outdated-tool
  dotnet outdated --upgrade --exclude "JsonSchema.Net"
  dotnet outdated --upgrade --version-lock major --include "JsonSchema.Net"

  # Replicating build.psm1:Start-PSBuild()
  ## Restore-PSPackage()
  dotnet restore "src/TypeCatalogGen" --runtime linux-x64 -p:SDKToUse=Microsoft.NET.Sdk
  dotnet restore "src/ResGen" --runtime linux-x64 -p:SDKToUse=Microsoft.NET.Sdk

  # Restore the PowerShell modules for later
  dotnet restore src/Modules
}

_copymodules() {
  mkdir -p "$2"
  mapfile _reference_packages < <(grep "PackageReference" "$1")
  for _curpackage in "${_reference_packages[@]}"; do
    # shellcheck disable=SC2001
    _package_name="$(echo "$_curpackage" | sed -E 's/.*Include="([^"]+).*/\1/')"
    # shellcheck disable=SC2001
    _package_version="$(echo "$_curpackage" | sed -E 's/.*Version="([^"]*).*/\1/')"

    rsync -aqP \
      -f '- *.nupkg' \
      -f '- *.nupkg.metadata' \
      -f '- *.nupkg.sha512' \
      -f '- *.nuspec' \
      -f '- System.Runtime.InteropServices.RuntimeInformation.dll' \
      -f '- fullclr' \
      "$NUGET_PACKAGES/${_package_name,,}/${_package_version}/." "$2/${_package_name}/"
  done
}

build() {
  cd PowerShell
  local _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"
  export NUGET_PACKAGES="$PWD/nuget"

  ## Start-ResGen()
  # ResGen runs much faster if built with optimisations
  cd "$srcdir"/PowerShell/src/ResGen
  dotnet run \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r linux-x64

  ## Start-TypeGen()
  local _inc_file="$PWD/src/TypeCatalogGen/powershell_linux-x64.inc"
  cd "$srcdir"/PowerShell/src/Microsoft.PowerShell.SDK
  dotnet build \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r linux-x64 \
    ./Microsoft.PowerShell.SDK.csproj \
    -t:_GetDependencies \
    -p:DesignTimeBuild=true \
    -p:_DependencyFile="$_inc_file"

  cd "$srcdir"/PowerShell/src/TypeCatalogGen
  dotnet run \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r linux-x64 \
    ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs \
    "$_inc_file"

  _build_arguments=(
    "--configuration" "Release"
    "--framework" "net""$_dotnetsdkver"
    "--runtime" "linux-x64"
    "--no-self-contained"
    "-p:ReleaseTag=""$pkgver"
    "-p:AppDeployment=FxDependentDeployment"
    "-p:SDKToUse=Microsoft.NET.Sdk"
    "-p:IsWindows=false"
    "-p:GenerateFullPaths=true"
    "-p:ErrorOnDuplicatePublishOutputFiles=false"
    "-p:UseAppHost=true"
    "-p:RunAnalyzersDuringBuild=false"
  )

  cd "$srcdir"/PowerShell/src/powershell-unix
  dotnet publish "${_build_arguments[@]}" \
    --output "$_publish_path"

  # Publish Reference Assemblies
  mkdir -p "$_publish_path/ref"
  grep 'Microsoft.NETCore.App' "$_inc_file" | sed 's/;//' | while read -r _assembly; do
    cp "$_assembly" "$_publish_path"/ref
  done

  ## Restore-PSModuleToBuild()
  _copymodules "$srcdir/PowerShell/src/Modules/PSGalleryModules.csproj" "$_publish_path/Modules"

  ## Build manpage
  # We have to build this, since the pregenerated file (that is also included in their official RPMs)
  # is outdated and especially missing all body content of the man page.
  # See https://github.com/PowerShell/PowerShell/issues/21086
  # The tags in the markdown don't have their < > escaped either, which causes breakage.
  cd "$srcdir"/PowerShell/assets/manpage
  sed -i -e 's/>/\\>/g' -e 's/</\\</g' pwsh.1.ronn
  ronn -r "pwsh.1.ronn"

  # Update Help
  # As help is installed in the module location, the core help pages would become orphaned files
  # otherwise, and every user on a machine would always need to download the help.
  # Including them in the package also ensures they will have proper permissions.
  #
  # Help is only available as en-US UICulutre, see about_Updatable_Help.help.txt
  #
  # We also generate the powershell.config.json which will be installed later
  # The config adds /usr/share/powershell/Modules as a working module folder in addition
  # to the regular XDG-compliant /usr/local/share/powershell/Modules.
  # Arch Packages are not allowed to use /usr/local, so this adds a convenient location
  # to which PowerShell modules could be packaged and installed to.
  cd "$_publish_path"
  # shellcheck disable=SC2016
  ./pwsh -noprofile -command '
    foreach($mod in (Get-ChildItem ./Modules)) {
      Update-Help -Module $mod -UICulture en-US -Scope AllUsers
    }

    $modulepaths = @(
      "/usr/local/share/powershell/Modules"
      "/usr/share/powershell/Modules"
      "/usr/lib/powershell-'"${pkgver:0:1}"'/Modules"
    )
    $psconfig = @{
      PSModulePath = ([String]::Join([System.IO.Path]::PathSeparator, $modulepaths))
    }
    ConvertTo-Json $psconfig | Out-File '"$srcdir"'/powershell.config.json
  '
}

check() {
  cd PowerShell
  local _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"
  export NUGET_PACKAGES="$PWD/nuget"

  cd test/powershell
  # In Pester 4.x, deleting tests is unfortunately the only fine grained option
  # to disable tests.

  # There's a bunch of tests that use $env:HOME to create or work with files
  # there as a temporary directory. We edit the tests to use the Pester TestDrive instead.
  # Start-Transcript.Tests.ps1 is excluded, since it looks for the result of
  # the Start-Transcript cmdlet at its default locations and needs $env:HOME for that.
  # shellcheck disable=SC2016
  _testsneedpatching="$(grep -R -l --include="*.Tests.ps1" --exclude="Start-Transcript.Tests.ps1" '$env:HOME' .)"
  # shellcheck disable=SC2016
  echo "$_testsneedpatching" | while read -r _curtest; do
    sed -i 's/$env:HOME/$TestDrive/g' "$_curtest"
  done

  # These tests use Pesters TestDrive in a way that it doesn't work on Linux
  # shellcheck disable=SC2016
  sed -i 's/TestDrive:/$TestDrive/g' Modules/Microsoft.PowerShell.Management/FileSystemProviderExtended.Tests.ps1
  # shellcheck disable=SC2016
  sed -i '/Push-Location $rootDir/iNew-Item -ItemType "Directory" -Path $TestDrive -Name TestDir -Force' \
    Modules/Microsoft.PowerShell.Management/FileSystemProviderExtended.Tests.ps1

  # Test contains a logic error
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27503
  rm Host/PSVersionTable.Tests.ps1

  # Test is broken on systems with UTC+2 or greater
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27500
  rm Modules/Microsoft.PowerShell.Utility/ConvertTo-Json.Tests.ps1

  # Test is broken due to a logic error not considering timezone aliases
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27502
  rm Modules/Microsoft.PowerShell.Management/TimeZone.Tests.ps1

  # Test requires DSCv3 being available
  # DSCv3 is not part of the PowerShell Core anymore and needs to be installed
  # See https://github.com/PowerShell/DSC
  rm dsc/dsc.profileresource.Tests.ps1

  # Test is extremely build dependent
  # For an fxdependent Release build, it has the wrong list of files
  # and it will be inconsistent. This only makes sense in the context of their CI.
  rm Host/Startup.Tests.ps1

  # This test relies on a dependency being loaded that wouldn't be on optimised Unix builds
  rm engine/Basic/TypeResolution.Tests.ps1

  # These tests ensure that no experimental features are enabled in a stable build.
  # Problem: They can be enabled via powershell.config.json or by invoking
  # Enable-ExperimentalFeature, which in turn will create that config.
  # If a user did so, these tests will break. Config files are by design not bypassable.
  rm engine/ExperimentalFeature/ExperimentalFeature.Basic.Tests.ps1
  rm engine/ExperimentalFeature/Get-ExperimentalFeature.Tests.ps1

  # Test is dependent on the locale of the system
  # Breaks if culture is Invariant Language (Invariant Country)
  # this happens if LANG=C.UTF-8, which is the default in chroot builds
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27532
  rm engine/Help/HelpSystem.Tests.ps1

  # Creates a new ~/.profile, and while it should normally move it back, there were reports of
  # this being broken. It's also a pretty questionable idea to do this in general outside of CI.
  rm Host/ConsoleHost.Tests.ps1

  # We disable telemetry by default, which the telemetry tests don't expect.
  rm engine/Basic/Telemetry.Tests.ps1

  cd ../..

  ## Restore-PSPester()
  dotnet publish \
    --configuration Release \
    --no-self-contained \
    --runtime linux-x64 \
    --framework "net$_dotnetsdkver" \
    test/tools/TestAlc

  for project in TestExe UnixSocket WebListener; do
    dotnet publish \
      --configuration Release \
      --no-self-contained \
      --runtime linux-x64 \
      --framework "net$_dotnetsdkver" \
      -p:AllowMissingPrunePackageData=true \
      --output "$PWD/bin" \
      test/tools/"$project"
  done

  # Fix a NU1510 warning that would otherwise pop
  sed -i '/Microsoft.CSharp/d' test/tools/NamedPipeConnection/src/code/Microsoft.PowerShell.NamedPipeConnection.csproj
  dotnet publish \
    --configuration Release \
    --no-self-contained \
    --runtime linux-x64 \
    --framework "net$_dotnetsdkver" \
    --output test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection \
    test/tools/NamedPipeConnection/src/code
  cp test/tools/NamedPipeConnection/src/Microsoft.PowerShell.NamedPipeConnection.psd1 \
    test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection

  # Add the test tools and pwsh to path
  export PATH="$_publish_path:$PWD/bin${PATH:+:${PATH}}"

  # Restore the required modules for the tests
  dotnet restore test/tools/Modules/PSGalleryTestModules.csproj
  _copymodules "test/tools/Modules/PSGalleryTestModules.csproj" "$PWD/test/tools/Modules"

  # Some tests are locale dependent, so we need to ensure
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    $build_mods = New-Item -Type Directory -Name build-modules 
    $pester_save_cmd = (Get-Content ./build.psm1) -match "Save-Module -Name Pester"
    $pester_args = @{
      Name = "Pester"
      Path = $build_mods
      Repository = "PSGallery"
    }
    foreach($sm_opt in ("MaximumVersion", "MinimumVersion")) {
      $regexmatch = [Regex]::Match($pester_save_cmd, ("-{0}\s+(?<{0}>[\d\.]+)" -f $sm_opt))
      if($regexmatch.Success) {
        $pester_args += @{ $sm_opt = $regexmatch.Groups[$sm_opt].Value }
      }
    }
    Save-Module @pester_args

    $modulepaths = @(
      $build_mods
      (Join-Path $(Get-Location) "/test/tools/Modules")
      $env:PSModulePath
    )
    $env:PSModulePath = [String]::Join([System.IO.Path]::PathSeparator, $modulepaths)

    Import-Module Pester
    Invoke-Pester -Show Header,Failed,Summary -EnableExit `
      -OutputFormat NUnitXml -OutputFile pester-tests.xml `
      -ExcludeTag @("Slow", "RequireSudoOnUnix") `
      -Tag @("CI", "Feature") `
      "test/powershell"
  '

  ## Start-PSxUnit
  dotnet test -tl:on -c Release -f "net$_dotnetsdkver" -r linux-x64 --test-adapter-path:.
}

package() {
  cd PowerShell

  local _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"
  local _pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$_pkgnum"
  rsync -aqP \
    -f '- *.r2rmap' \
    -f '- *.pdb' \
    "$_publish_path/." "$pkgdir/usr/lib/$pkgname-$_pkgnum/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$_pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  # Install the man page
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$srcdir/PowerShell/assets/manpage/pwsh.1"

  # Install the config symlink
  install -Dm644 -t "$pkgdir/etc" "$srcdir/powershell.config.json"
  ln -s "/etc/powershell.config.json" "$pkgdir/usr/lib/$pkgname-$_pkgnum/powershell.config.json"

  install -dm755 "$pkgdir/usr/share/powershell/Modules"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
