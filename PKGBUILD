# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname="powershell-editor-services"
pkgver=4.7.0
pkgrel=5
pkgdesc='A common platform for PowerShell development support in any editor or application'
url="https://github.com/PowerShell/PowerShellEditorServices"
# The assemblies are compiled to ReadyToRun images for the architecture
arch=('x86_64' 'aarch64')
license=('MIT')
_dotnetsdkver='10.0'
depends=('powershell' 'dotnet-runtime-'"$_dotnetsdkver")
makedepends=(
  'dotnet-mediatr-12'
  'dotnet-nerdbank-streams'
  'dotnet-newtonsoft-json'
  'dotnet-omnisharp-extensions'
  'dotnet-pluralize-net'
  'dotnet-sdk-'"$_dotnetsdkver"
  'dotnet-system-reactive'
  'dotnet-vs-threading'
  'dotnet-vs-validation'
  'git'
)
makedepends_x86_64=('dotnet-source-built-artifacts-'"$_dotnetsdkver")
# PSScriptAnalyzer, which the editor services bundle (RestorePsesModules in
# PowerShellEditorServices.build.ps1). PSReadLine isn't bundled, PowerShell already has it.
_pssaver=1.25.0
# platyPS and YamlDotNet, which only build the help of the modules (BuildCmdletHelp in
# PowerShellEditorServices.build.ps1)
_platypsver=0.14.2
_yamldotnetver=5.0.0
source=("git+$url.git#tag=v$pkgver"
  "git+https://github.com/PowerShell/PSScriptAnalyzer.git#tag=$_pssaver"
  "git+https://github.com/PowerShell/platyPS.git#tag=$_platypsver"
  "git+https://github.com/aaubry/YamlDotNet.git#tag=v$_yamldotnetver"
  "pssa-cim-windows-only.patch"
  "pses-mediatr-12.patch"
  "build-help.ps1"
  "crossgen2-pack.targets")
options=('!debug')
sha512sums=('c9408c3462334a6fd6f78ae793b8483dd550ad3918cac969bf78a6e1d753820ece6d57536770eb929ce029c8dc644d770b3ec84c417af8f04da212b366a948ac'
            '5815b257a2169f99cf346d783ffb38656e128a27dc57ba9606a98b8ad480b1e797fabbdb50545dfc141928da556bb52122938b5a84e3bad27a1552ca175b1139'
            'db7d147644d74081c49d8ea2700138e56f5deecf390f7ad704ce6decf0dc4f1719fce2c3325c778d32c6f9d80f46c0dce3ee49942cf6ff9e72a2d30715eb149f'
            'd93763f7840a6f9fa4d20fc38a08d8f39c71d3a8603019ec4733c2b42b085829a4e3a82b6c9ab7ca09c615737f632057749884fa2884c2adcba0799c15e6dc9f'
            '133f038fd06dd264b231ffd8eb173e9ac45bf3121777df6c2d90a27a51b382de11d160b9dac1b538ed524e36887a203f5af02fed8780658bec675532c06464a1'
            'd51cfddaf4242e53a37c78391e821c87c8c844099a5186d394385b44fbe1230bbac482bf8e4995b8a880df93311496693f6429a0f0adefa071e338660366e95f'
            'f9ff895f834a45ba83181de172114b9db5e0ee23d41a0685f975381a575aca3ef85e06f65fee2f212d499fa8cb890b2defa4321c22e32e76da318b9f5670017c'
            '340bfd8bcb4548a6b70954d1d17b5c402c47285979c3f2eae27ff8d3fd0547b54ddf934f41e4a777825a8cc9fc674589760b2f701db11a10c7e17f0af2cf3981')
b2sums=('94bbeb6af2cef3feed161759ff732370ef34929235220c5b827263493dfe405de1afe56032738367aeb0160defa8fa3012d77d7fd676d14576b2699f38e2b5fd'
        '39b8c4f12570cda16d38f7083939665c3a176dbab86a83c399b8f0d35b8b1c855bf787a3e581790466cd761a74ffe37992ed4fa88f3fbe0d717f18642c28a749'
        '561dfa14710bcea1e4326d79d30f1a78a71550bd03a573e915b3d8d931a51ca74b5ad5bb4cb65fac1f4e9d1965330515a4a322f4459a6464e12c500a1479215f'
        'a06533f981bb46bf2627833a0263be3ec6dc33380a1da573fb44c1a62304f4ea4791221f1c8cc99d0e91d2c3a9f2b55826ebcbe675c5008af3757d6826ed5568'
        '8a1781bc94cb602b54d490725035e86abe4309b272fbccd3db4ba4fbcb90415910bb73821b07b0502f77bbbbb6e09b77c8b2c8fa27e6000eded061c649d250a2'
        'ecc233f3555243a9f5e1d2acd6e309441dba1f86b02252af0dc7c52baca32bb16780940f12fa693a6fe76da81e4557c5fd74a2f51c7d13a79fd4c3bf9b84293e'
        '216c25e61acacc59927c5745ce68eb97018c8b4f879c9c23c8c539335ddcaee2ac8f60fd049cf8f25aeee7523b3309adccc740ab91f3dbb468289134b57608f0'
        '3493eecfb50819af971399abe1e62782ccf28500559d222822bddb91ddac6bf191d7e20abf01dfbcb99f7c51df9356061c8f1687a10700228e7d1f77308e873b')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  # Keep the .NET CLI state out of the builder's home
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # RID of the .NET SDK: arch-x64 for the source-built .NET of Arch, linux-arm64 for Microsoft's build
  _rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")

  # Framework-dependent ReadyToRun images, see crossgen2-pack.targets. Code style isn't checked, the
  # newer .NET SDK has rules upstream's doesn't follow. The packages from the source-built artifacts
  # and the system feed are newer than the versions referenced (NU1603).
  _publish_arguments=(
    --configuration Release
    --framework "net$_dotnetsdkver"
    --runtime "$_rid"
    --no-self-contained
    -p:PublishReadyToRun=true
    "-p:CustomAfterMicrosoftCommonTargets=$srcdir/crossgen2-pack.targets"
    -p:EnforceCodeStyleInBuild=false
    -p:TreatWarningsAsErrors=false
  )
}

# Prints the ID and version of a NuGet package ($1)
_nupkg_info() {
  local _nuspec
  _nuspec="$(bsdtar -xOf "$1" '*.nuspec')"
  printf '%s %s\n' \
    "$(sed -n -E 's|.*<id>([^<]+)</id>.*|\1|p' <<<"$_nuspec" | head -1)" \
    "$(sed -n -E 's|.*<version>([^<]+)</version>.*|\1|p' <<<"$_nuspec" | head -1)"
}

# Writes the nuget.config of the repository in the current folder, like powershell's PKGBUILD does.
# Packages are taken from:
# - dotnet-source-built-artifacts, the packages of the source-built .NET, so they exactly match the .NET
#   we're building and running with ($1 is its runtime version). This includes the runtime and crossgen
#   packs. Arch Linux ARM has no source-built .NET.
# - /usr/share/dotnet/nuget-packages, libraries built from source by their own packages (dotnet-*).
#   References to them (also central package versions) are set to the installed version with the same
#   major version, or the newest installed one if there's none.
# - nuget.org for everything else
# With "tests" as $2, the runtime packages come from nuget.org instead, as the PowerShell SDK the
# tests run on (from nuget.org) may need newer ones.
_nuget_feeds() {
  local _systemfeed=/usr/share/dotnet/nuget-packages
  local _systempackages=() _localpackages=() _nupkg _id _version _artifacts _file _reference
  local -A _systemversions=()
  for _nupkg in "$_systemfeed"/*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    read -r _id _version < <(_nupkg_info "$_nupkg")
    [[ "${2-}" == tests && "$_version" == "$_dotnetsdkver".* ]] && continue
    [[ -v "_systemversions[$_id]" ]] || _systempackages+=("$_id")
    _systemversions[$_id]+="$_version"$'\n'
  done
  for _id in "${_systempackages[@]}"; do
    while IFS=: read -r _file _reference; do
      _reference="${_reference##*Version=\"}"
      _reference="${_reference%\"}"
      _version=$(grep -E "^${_reference%%.*}\." <<<"${_systemversions[$_id]}" | sort -V | tail -1 || true)
      [[ -n "$_version" ]] || _version=$(grep . <<<"${_systemversions[$_id]}" | sort -V | tail -1)
      sed -i -E 's#(<Package(Reference|Version) Include="'"${_id//./\\.}"'" Version=")[^"]*"#\1'"$_version"'"#' "$_file"
    done < <(grep -rHoE '<Package(Reference|Version) Include="'"${_id//./\\.}"'" Version="[^"]+"' \
      --include='*.csproj' --include='*.props' .)
  done

  if [[ ! -d "$srcdir/nuget-local" ]]; then
    mkdir -p "$srcdir/nuget-local"
    for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
      [[ -f "$_artifacts" ]] || continue
      bsdtar -xf "$_artifacts" -C "$srcdir/nuget-local" '*.nupkg'
    done
  fi
  for _nupkg in "$srcdir"/nuget-local/*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    read -r _id _version < <(_nupkg_info "$_nupkg")
    [[ " ${_systempackages[*]} " == *" $_id "* || "${2-}" == tests ]] && continue
    [[ "$_version" == "$1" ]] && _localpackages+=("$_id")
  done

  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="dotnet-packages" value="$_systemfeed" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
  <packageSourceMapping>
    <clear />
EOF
    if ((${#_localpackages[@]})); then
      echo '    <packageSource key="dotnet-source-built">'
      printf '      <package pattern="%s" />\n' "${_localpackages[@]}"
      echo '    </packageSource>'
    fi
    if ((${#_systempackages[@]})); then
      echo '    <packageSource key="dotnet-packages">'
      printf '      <package pattern="%s" />\n' "${_systempackages[@]}"
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >nuget.config
}

prepare() {
  _dotnet_env

  ## platyPS, built for the installed .NET against YamlDotNet from source
  cd "$srcdir"/YamlDotNet || exit
  # The code for .NET Standard 1.3 is the one for current .NET. HashCode clashes with System.HashCode.
  sed -i -e "s|<TargetFrameworks>[^<]*</TargetFrameworks>|<TargetFrameworks>net$_dotnetsdkver</TargetFrameworks>\n    <DefineConstants>\$(DefineConstants);NETSTANDARD1_3</DefineConstants>|" \
    -e "s|'netstandard1.3'|'net$_dotnetsdkver'|g" \
    -e '/<PackageReference Include="System.Runtime.Serialization.Formatters">/,/<\/PackageReference>/d' \
    -e '/<PackageReference Include="System.ComponentModel.TypeConverter">/,/<\/PackageReference>/d' \
    YamlDotNet/YamlDotNet.csproj
  sed -i 's/\bHashCode\.CombineHashCodes/YamlDotNet.Core.HashCode.CombineHashCodes/' \
    YamlDotNet/Serialization/YamlAttributeOverrides.cs
  cd "$srcdir"/platyPS || exit
  sed -i -e "s|<TargetFrameworks>[^<]*</TargetFrameworks>|<TargetFrameworks>net$_dotnetsdkver</TargetFrameworks>|" \
    -e '/System.Collections.NonGeneric/d' \
    -e "s|<PackageReference Include=\"YamlDotNet\" Version=\"[^\"]*\" />|<ProjectReference Include=\"$srcdir/YamlDotNet/YamlDotNet/YamlDotNet.csproj\" />|" \
    src/Markdown.MAML/Markdown.MAML.csproj

  ## PSScriptAnalyzer
  cd "$srcdir"/PSScriptAnalyzer || exit
  # CIM (Microsoft.Management.Infrastructure) is only supported on Windows, and powershell doesn't
  # ship it elsewhere. Without this, the module fails to load, see powershell's PKGBUILD.
  patch -Np1 -i "$srcdir/pssa-cim-windows-only.patch"
  # Only the build for PowerShell 7, for the installed .NET. It's compiled against the PowerShell it
  # runs on instead of the System.Management.Automation package of PowerShell 7.4.
  sed -i -e "s|<TargetFrameworks>net8;net462</TargetFrameworks>|<TargetFrameworks>net$_dotnetsdkver</TargetFrameworks>|" \
    -e "s|'net8'|'net$_dotnetsdkver'|g" \
    Engine/Engine.csproj Rules/Rules.csproj
  local _smareference='<Reference Include="System.Management.Automation" HintPath="/usr/lib/powershell-7/System.Management.Automation.dll" Private="false" />'
  sed -i "s|<PackageReference Include=\"System.Management.Automation\" />|$_smareference|" Engine/Engine.csproj
  # The package reference flowed to Rules, which needs it as well
  sed -i "s|\( *\)<ProjectReference Include=\"..\\\\Engine\\\\Engine.csproj\" />|&\n\1$_smareference|" Rules/Rules.csproj
  # CrossCompatibility is compiled against PowerShellStandard.Library, which would flow to Rules and
  # win over the version of PowerShell referenced there
  sed -i -e 's|<TargetFrameworks>netstandard2.0;net462</TargetFrameworks>|<TargetFrameworks>netstandard2.0</TargetFrameworks>|' \
    -e 's|<PackageReference Include="PowerShellStandard.Library" />|<PackageReference Include="PowerShellStandard.Library" PrivateAssets="all" />|' \
    PSCompatibilityCollector/Microsoft.PowerShell.CrossCompatibility/Microsoft.PowerShell.CrossCompatibility.csproj
  rm global.json
  _nuget_feeds "$_runtimever"

  ## PowerShellEditorServices
  cd "$srcdir"/PowerShellEditorServices || exit
  # OmniSharp 0.19.11 is built with MediatR 12, where IRequest isn't IRequest<Unit> anymore
  patch -Np1 -i "$srcdir/pses-mediatr-12.patch"
  rm global.json
  # Build for the installed .NET only, upstream builds for .NET Standard, .NET 8 and .NET Framework
  find src test -type f -name "*.csproj" -exec sed -i -E \
    -e "s|(TargetFrameworks?>)[^<]*|\1net$_dotnetsdkver|" -e "s|net8\.0|net$_dotnetsdkver|g" {} +
  # Runtime packages in the version of the installed .NET, like powershell's PKGBUILD does. OmniSharp
  # 0.19.11 needs newer ones than upstream references.
  sed -i -E "s|(<PackageVersion Include=\"[^\"]+\" Version=\")${_dotnetsdkver//./\\.}\.[0-9]+\"|\1$_runtimever\"|" \
    Directory.Packages.props
  # Packages for .NET Standard and .NET Framework, which current .NET has built in
  local _assembly _project
  for _assembly in Microsoft.CSharp System.IO.Pipes.AccessControl System.Runtime.InteropServices.RuntimeInformation \
    System.Security.Principal System.Security.Principal.Windows; do
    for _project in src/PowerShellEditorServices/PowerShellEditorServices.csproj \
      src/PowerShellEditorServices.Hosting/PowerShellEditorServices.Hosting.csproj \
      test/PowerShellEditorServices.Test/PowerShellEditorServices.Test.csproj; do
      sed -i "/\"${_assembly}\"/d" "$_project"
    done
  done
  # Current .NET has System.Range, which clashes with the Range of OmniSharp
  local _file
  grep -R -w -l --include='*.cs' 'Range' . | while read -r _file; do
    sed -i '/Licensed under the MIT License/ausing Range = OmniSharp.Extensions.LanguageServer.Protocol.Models.Range;' "$_file"
  done
  # Start-EditorServices.ps1 fails without a LogLevel, see
  # https://github.com/PowerShell/PowerShellEditorServices/pull/2333
  sed -i '/Translate legacy PSES log levels to MEL levels/,+7d' module/PowerShellEditorServices/Start-EditorServices.ps1
  # PSReadLine isn't bundled, load the one of PowerShell
  sed -i 's/Path\.Combine(bundledModulePath, \("PSReadLine"\))/\1/' \
    src/PowerShellEditorServices/Services/PowerShell/Console/PSReadLineProxy.cs
  # The build info, see the CreateBuildInfo task of PowerShellEditorServices.build.ps1
  cat >src/PowerShellEditorServices.Hosting/BuildInfo.cs <<EOF
// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

using System.Globalization;

namespace Microsoft.PowerShell.EditorServices.Hosting
{
    public static class BuildInfo
    {
        public static readonly string BuildVersion = "$pkgver";
        public static readonly string BuildOrigin = "Release";
        public static readonly string BuildCommit = "$(git rev-parse HEAD)";
        public static readonly System.DateTime? BuildTime = System.DateTime.Parse("$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT00:00:00)", CultureInfo.InvariantCulture.DateTimeFormat);
    }
}
EOF
  _nuget_feeds "$_runtimever"
}

build() {
  _dotnet_env

  ## platyPS, assembled like its build.ps1 does
  cd "$srcdir"/platyPS || exit
  dotnet publish src/Markdown.MAML --configuration Release --framework "net$_dotnetsdkver" \
    -p:TreatWarningsAsErrors=false --output "$srcdir/platyPS-publish"
  local _platyps="$srcdir/platyPS-module/platyPS"
  rm -rf "$_platyps"
  mkdir -p "$_platyps"
  cp -r src/platyPS/. platyPS.schema.md "$srcdir"/platyPS-publish/{Markdown.MAML,YamlDotNet}.dll "$_platyps"/
  cp -r templates "$_platyps"/

  ## PSScriptAnalyzer, assembled like Start-ScriptAnalyzerBuild in its build.psm1 does
  cd "$srcdir"/PSScriptAnalyzer || exit
  dotnet publish Rules/Rules.csproj "${_publish_arguments[@]}" -p:ModuleVersion="$_pssaver" \
    --output "$srcdir/pssa-publish"
  # Into the module folder of the editor services, where its build saves it and the tests look for it
  local _pssa="$srcdir/PowerShellEditorServices/module/PSScriptAnalyzer/$_pssaver"
  rm -rf "${_pssa%/*}"
  mkdir -p "$_pssa"/{PSv7,Settings,compatibility_profiles,en-US}
  sed "s/{{ModuleVersion}}/$_pssaver/" Engine/PSScriptAnalyzer.psd1 >"$_pssa/PSScriptAnalyzer.psd1"
  cp LICENSE README.md SECURITY.md ThirdPartyNotices.txt Engine/PSScriptAnalyzer.psm1 \
    Engine/ScriptAnalyzer.{format,types}.ps1xml "$_pssa"/
  cp "$srcdir"/pssa-publish/{Microsoft.Windows.PowerShell.ScriptAnalyzer,Microsoft.Windows.PowerShell.ScriptAnalyzer.BuiltinRules,Microsoft.PowerShell.CrossCompatibility,Pluralize.NET}.dll \
    "$_pssa/PSv7/"
  cp Engine/Settings/* "$_pssa/Settings/"
  cp PSCompatibilityCollector/profiles/* "$_pssa/compatibility_profiles/"
  pwsh -NoProfile -NonInteractive -File "$srcdir/build-help.ps1" -PlatyPSPath "$_platyps" \
    -DocsPath docs/Cmdlets -OutputPath "$_pssa/en-US"

  ## PowerShellEditorServices, assembled like the AssembleModule task of
  ## PowerShellEditorServices.build.ps1 does
  cd "$srcdir"/PowerShellEditorServices || exit
  dotnet publish src/PowerShellEditorServices/PowerShellEditorServices.csproj "${_publish_arguments[@]}" \
    --output "$srcdir/pses-publish"
  dotnet publish src/PowerShellEditorServices.Hosting/PowerShellEditorServices.Hosting.csproj \
    "${_publish_arguments[@]}" --output "$srcdir/pses-hosting-publish"
  local _pses=module/PowerShellEditorServices
  rm -rf module/PowerShellEditorServices/bin
  mkdir -p "$_pses"/bin/{Common,Core}
  # bin/Common has the editor services, bin/Core what the host needs besides them. PowerShell provides
  # System.Management.Automation.
  local _file
  for _file in "$srcdir"/pses-publish/*.*; do
    [[ "${_file##*/}" == System.Management.Automation.dll ]] && continue
    cp "$_file" "$_pses/bin/Common/"
  done
  for _file in "$srcdir"/pses-hosting-publish/*.*; do
    [[ -e "$_pses/bin/Common/${_file##*/}" || "${_file##*/}" == System.Management.Automation.dll ]] && continue
    cp "$_file" "$_pses/bin/Core/"
  done
  pwsh -NoProfile -NonInteractive -File "$srcdir/build-help.ps1" -PlatyPSPath "$_platyps" \
    -DocsPath module/docs -OutputPath "$_pses/Commands/en-US"
}

check() {
  _dotnet_env
  cd "$srcdir"/PowerShellEditorServices || exit
  # The tests install help for Microsoft.PowerShell.Archive for the current user, see the
  # SetupHelpForTests task of PowerShellEditorServices.build.ps1
  export HOME="$srcdir/home"
  mkdir -p "$HOME"
  # shellcheck disable=SC2016
  pwsh -NoProfile -NonInteractive -Command '
    Update-Help -Module Microsoft.PowerShell.Archive -SourcePath test/PowerShellEditorServices.Test.Shared/PSHelp/7 `
      -UICulture en-US -Scope CurrentUser -Force
  '
  # The synopsis of Expand-Archive has changed since the help the tests expect
  # shellcheck disable=SC2016
  pwsh -NoProfile -NonInteractive -Command '
    $file = Get-Item test/PowerShellEditorServices.Test/Language/SymbolsServiceTests.cs
    $old = [Regex]::Escape("Extracts files from a specified archive (zipped) file.")
    (Get-Content -Raw $file) -replace $old, (Get-Help Expand-Archive).Synopsis | Set-Content -NoNewline $file
  '
  # Upstream tests with PowerShell 7.4, which the tests check for with IsPS74. The tests run on the
  # PowerShell SDK of the installed version.
  sed -i -E 's/(IsPS74 \{ get; \} = PSVersion.Major == 7 && PSVersion.Minor )== 4/\1>= 4/' \
    src/PowerShellEditorServices/Utility/VersionUtils.cs
  local _psver
  # shellcheck disable=SC2016
  _psver=$(pwsh -NoProfile -NonInteractive -Command '$PSVersionTable.PSVersion.ToString()')
  sed -i -E "s|(<PackageVersion Include=\"Microsoft.PowerShell.SDK\" Version=\")[^\"]*\"|\1$_psver\"|" \
    Directory.Packages.props
  _nuget_feeds "$_runtimever" tests
  # The PowerShell the tests host finds PSReadLine and Microsoft.PowerShell.Archive in PowerShell's
  # modules, like when upstream runs the tests from pwsh (Invoke-Build)
  # shellcheck disable=SC2016
  PSModulePath=$(pwsh -NoProfile -NonInteractive -Command '$env:PSModulePath')
  export PSModulePath
  # NuGet doesn't notice the changed package source mapping
  dotnet restore test/PowerShellEditorServices.Test/PowerShellEditorServices.Test.csproj --force
  dotnet test test/PowerShellEditorServices.Test/PowerShellEditorServices.Test.csproj --no-restore \
    --configuration Release -p:EnforceCodeStyleInBuild=false -p:TreatWarningsAsErrors=false
}

package() {
  install -dm755 "$pkgdir/usr/share/powershell/Modules"
  cp -r "$srcdir"/PowerShellEditorServices/module/{PSScriptAnalyzer,PowerShellEditorServices} \
    "$pkgdir/usr/share/powershell/Modules/"

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a "$srcdir"/PowerShellEditorServices/{NOTICE.txt,README.md,SECURITY.md} "$pkgdir/usr/share/doc/$pkgname/"
  cp -a "$srcdir/PowerShellEditorServices/module/docs/." "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "$srcdir/PowerShellEditorServices/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/PSScriptAnalyzer/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/PSScriptAnalyzer-LICENSE"
}
