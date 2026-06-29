# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname="powershell-editor-services"
pkgver=4.7.0
pkgrel=4
pkgdesc='A common platform for PowerShell development support in any editor or application'
url="https://github.com/PowerShell/PowerShellEditorServices"
arch=('any')
license=('MIT')
_dotnetsdkver='10.0'
depends=('powershell' 'dotnet-runtime-'"$_dotnetsdkver")
makedepends=(
  'dotnet-sdk-'"$_dotnetsdkver"
  'git'
)
source=("git+$url.git#tag=v$pkgver")
options=('!debug')
sha512sums=('c9408c3462334a6fd6f78ae793b8483dd550ad3918cac969bf78a6e1d753820ece6d57536770eb929ce029c8dc644d770b3ec84c417af8f04da212b366a948ac')
b2sums=('94bbeb6af2cef3feed161759ff732370ef34929235220c5b827263493dfe405de1afe56032738367aeb0160defa8fa3012d77d7fd676d14576b2699f38e2b5fd')

prepare() {
  cd "$srcdir"/PowerShellEditorServices
  export NUGET_PACKAGES="$PWD/nuget"

  mkdir -p "$srcdir"/build-modules

  # Identify required modules for the build and download them
  mapfile _required_modules < <(grep "#Requires -Modules @{ModuleName = " PowerShellEditorServices.build.ps1)
  for _curmodule in "${_required_modules[@]}"; do
    # shellcheck disable=SC2001
    module_name="$(echo "$_curmodule" | sed 's/.*ModuleName = "\([^"]*\).*/\1/')"
    # shellcheck disable=SC2001
    module_version="$(echo "$_curmodule" | sed 's/.*ModuleVersion = "\([^"]*\).*/\1/')"
    pwsh -noprofile -command \
      "Save-PSResource -Name ${module_name} -Version ${module_version} -Repository PSGallery -TrustRepository -Path ${srcdir}/build-modules"
  done

  # Update global.json to match with the current SDK
  rm global.json
  _sdkver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  DOTNET_NOLOGO=1 dotnet new globaljson --sdk-version "$_sdkver"

  # Replace the Azure repository with nuget.org
  sed -i -e 's|<add key="PowerShellCore.*$|<add key="nuget.org" value="https://api.nuget.org/v3/index.json" />|g' nuget.config

  # Define the runtime to use and add R2R generation
  sed -i -e 's/dotnet publish/dotnet publish -r linux-x64 -p:PublishReadyToRun=true/g' PowerShellEditorServices.build.ps1

  # Adjust the output paths
  sed -i -e 's|/publish"|/linux-x64/publish"|g' PowerShellEditorServices.build.ps1

  # Change style warnings to silent as we build with a much newer .NET than upstream
  # There would be tons of new style warnings that would cause the build to fail
  sed -i -e 's/error/silent/g' .editorconfig

  # Upgrade the various places where NET 8.0 is used
  sed -i -E 's/net(8\.0|standard2\.0)/net'"$_dotnetsdkver"'/g' PowerShellEditorServices.build.ps1
  find . -type f -name "*.csproj" \
    -exec sed -i -E -e "s|(TargetFrameworks?>)[^<]*|\1net${_dotnetsdkver}|" -e "s|net8\.0|net${_dotnetsdkver}|g" {} \;

  # Remove PSReadLine module as this is included with current PowerShell versions
  sed -i '/Test-Path "module\/PSReadLine"/,+3d' PowerShellEditorServices.build.ps1
  sed -i -e 's/Path\.Combine(bundledModulePath, \("PSReadLine"\))/\1/' src/PowerShellEditorServices/Services/PowerShell/Console/PSReadLineProxy.cs

  # netstandard 2.1 moved System.Range in the core, which clashes with a class from OmniSharp
  # We identify where this class is used and inject a using Range = ... statement to resolve the ambiguity
  mapfile _files_to_patch < <(grep -R -w "Range" --include="*.cs" -l)
  for _currentfile in "${_files_to_patch[@]}"; do
    sed -i '/Licensed under the MIT License/ausing Range = OmniSharp.Extensions.LanguageServer.Protocol.Models.Range;' "$(echo "$_currentfile" | xargs)"
  done

  # There's a bug since 4.4.0 that causes an error on startup of Start-EditorServices.ps1 if LogLevel was not defined
  # I created an upstream PR for this: https://github.com/PowerShell/PowerShellEditorServices/pull/2333
  sed -i '/Translate legacy PSES log levels to MEL levels/,+7d' module/PowerShellEditorServices/Start-EditorServices.ps1

  # We need to trim unneeded libraries to prevent compiler warnings
  _references_to_purge=(
    "Microsoft.CSharp"
    "System.IO.Pipes.AccessControl"
    "System.Runtime.InteropServices.RuntimeInformation"
    "System.Security.Principal"
    "System.Security.Principal.Windows"
  )
  for _assembly in "${_references_to_purge[@]}"; do
    sed -i "/${_assembly}/d" src/PowerShellEditorServices/PowerShellEditorServices.csproj
    sed -i "/${_assembly}/d" src/PowerShellEditorServices.Hosting/PowerShellEditorServices.Hosting.csproj
    sed -i "/${_assembly}/d" test/PowerShellEditorServices.Test/PowerShellEditorServices.Test.csproj
  done

  # The IsPS74 logic is such because that's what upstream test with.
  # This however breaks a test on shells newer than 7.4
  # We simply make IsPS74 return true for those as well
  _line_to_fix=$(grep -n "IsPS74" src/PowerShellEditorServices/Utility/VersionUtils.cs | cut -f1 -d:)
  sed -i -E "${_line_to_fix}s/Minor == 4/Minor >= 4/" src/PowerShellEditorServices/Utility/VersionUtils.cs

  dotnet new tool-manifest
  dotnet tool install dotnet-outdated-tool
  dotnet outdated --upgrade
}

build() {
  cd "$srcdir"/PowerShellEditorServices
  export NUGET_PACKAGES="$PWD/nuget"

  # Set the environment variables such that it will produce a release rather than a CI build
  export TF_BUILD=1
  export BUILD_REASON="Manual"

  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Get-ChildItem '"$srcdir"'/build-modules/ | foreach { Import-Module $_ }
    Invoke-Build -Task Build -Configuration Release
  '

  # Cleanup empty folders in the module
  find "$srcdir"/PowerShellEditorServices/module -empty -type d -delete
}

check() {
  cd "$srcdir"/PowerShellEditorServices
  export NUGET_PACKAGES="$PWD/nuget"

  # One test breaks due to the description of Expand-Archive having changed in current PowerShell
  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    $csharpfile = $(Get-Item test/PowerShellEditorServices.Test/Language/SymbolsServiceTests.cs)
    $newtext = $((Get-Help Expand-Archive).synopsis)
    $oldtext = [Regex]::escape("Extracts files from a specified archive (zipped) file.")
    (Get-Content -Raw $csharpfile) -replace $oldtext,$newtext | Set-Content -NoNewLine $csharpfile
  '

  # Only run the TestPS74 subset.
  # Full tests, i.e. -Task Test or TestFull include very long running CI tests.
  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Get-ChildItem '"$srcdir"'/build-modules/ | foreach { Import-Module $_ }
    Invoke-Build -Task TestPS74 -Configuration Release
  '
}

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/share/powershell/Modules"
  for module in PSScriptAnalyzer PowerShellEditorServices; do
    cp -a "$srcdir/PowerShellEditorServices/module/$module" "$pkgdir/usr/share/powershell/Modules"
  done

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  for docfile in NOTICE.txt README.md SECURITY.md; do
    cp -a "$srcdir/PowerShellEditorServices/$docfile" "$pkgdir/usr/share/doc/$pkgname"
  done
  cp -a "$srcdir/PowerShellEditorServices/module/docs/." "$pkgdir/usr/share/doc/$pkgname"

  install -Dm644 "$srcdir/PowerShellEditorServices/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
