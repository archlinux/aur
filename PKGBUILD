# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-gherkin-5
_nugetid=Gherkin
pkgver=5.1.0
pkgrel=1
pkgdesc="Parser for the Gherkin language of Cucumber, Gherkin (NuGet package, version 5)"
arch=('any')
url='https://github.com/cucumber/gherkin-dotnet'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-newtonsoft-json
  dotnet-sdk-"$_dotnetsdkver"
)
checkdepends=(
  jq
)
# Gherkin 6 merged ScenarioOutline into Scenario, which Pester 4 (powershell-pester-4) relies on.
# The commit 5.1.0 was released from ("gherkin: Release v5.1.0"), upstream only tagged it in the
# monorepo it was developed in then (cucumber/cucumber).
_commit="55ab34d45dcd8249349704335c2aa2f90839fae3"
source=("gherkin-dotnet-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('923d3c712104941ed3b8d79c7d728df472611fc34a7877d405c50660519bf7a06de0f44782680f50c3f9b4ed231a590b63745808e78498481fc9c04398decd62')
b2sums=('09724099044d2430fd257dfa7c196cc112a0b18c75538a48ae1bb7a1428abcb9d3b2c64968c26f98d2a48a7828f1355e4e4c4c31ea47b1f32326fec93f297180')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The repository information usually comes from git, which would find the repository this PKGBUILD
  # is in instead. Newtonsoft.Json from the system feed is newer than the version referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
    -p:IncludeSourceRevisionInInformationalVersion=false
    -p:RepositoryType=git
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:WarningsNotAsErrors=NU1603
  )
}

prepare() {
  cd "gherkin-dotnet-$_commit" || exit
  # Newtonsoft.Json is built from source by dotnet-newtonsoft-json
  cat >NuGet.Config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-system" value="/usr/share/dotnet/nuget-packages" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-system">
      <package pattern="Newtonsoft.Json" />
    </packageSource>
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  # Upstream builds with the .NET SDK 2.1, the installed one works as well
  rm global.json
  # Newtonsoft.Json from dotnet-newtonsoft-json only targets .NET Standard 2.0 and .NET 6, so Gherkin
  # targets .NET Standard 2.0 instead of 1.5 and .NET Framework 4.5 (which can use the .NET Standard 2.0
  # build since 4.6.2). netfx.props only points .NET Framework builds at Mono's reference assemblies.
  sed -i '/netfx.props/d' ./*/*.csproj
  sed -i "s|<TargetFrameworks>netstandard1.5;net45</TargetFrameworks>|<TargetFramework>netstandard2.0</TargetFramework>|" \
    Gherkin/Gherkin.csproj Gherkin.TokensGeneratorLib/Gherkin.TokensGeneratorLib.csproj
  sed -i 's/#if (NETSTANDARD1_5 ||/#if (NETSTANDARD1_5_OR_GREATER ||/' Gherkin/GherkinDialectProvider.cs Gherkin/GherkinLine.cs
  # The tools and tests target .NET Core 2.0 and its test packages, use the .NET runtime that's
  # installed and current ones
  sed -i -E "s|<TargetFrameworks>netcoreapp2.0;net45[0-9]?</TargetFrameworks>|<TargetFramework>net$_dotnetsdkver</TargetFramework>|" \
    Gherkin.CLI/Gherkin.CLI.csproj Gherkin.TokensGenerator/Gherkin.TokensGenerator.csproj \
    Gherkin.Specs/Gherkin.Specs.csproj
  sed -i -E \
    -e '/Microsoft.TestPlatform.TestHost|DotNetCliToolReference/d' \
    -e 's|(Include="Microsoft.NET.Test.Sdk" Version=)"[^"]*"|\1"18.11.0"|' \
    -e 's|(Include="xunit" Version=)"[^"]*"|\1"2.9.3"|' \
    -e 's|(Include="xunit.runner.visualstudio" Version=)"[^"]*"|\1"3.1.5"|' \
    Gherkin.Specs/Gherkin.Specs.csproj
}

build() {
  _dotnet_env
  cd "gherkin-dotnet-$_commit" || exit
  # Strong named with the key in the repository, like the official package
  dotnet pack "$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "gherkin-dotnet-$_commit" || exit
  dotnet test Gherkin.Specs/Gherkin.Specs.csproj "${_build_arguments[@]}"

  # The acceptance tests of the Makefile, without the .NET Framework builds that need Mono: the
  # tokens, AST, pickles and errors of the test features have to match the expected ones
  dotnet build Gherkin.CLI/Gherkin.CLI.csproj "${_build_arguments[@]}"
  dotnet build Gherkin.TokensGenerator/Gherkin.TokensGenerator.csproj "${_build_arguments[@]}"
  local _cli="Gherkin.CLI/bin/Release/net$_dotnetsdkver/Gherkin.CLI.dll"
  local _tokens="Gherkin.TokensGenerator/bin/Release/net$_dotnetsdkver/Gherkin.TokensGenerator.dll"
  local _feature
  for _feature in testdata/good/*.feature; do
    diff --unified "$_feature.tokens" <(dotnet "$_tokens" "$_feature")
    diff --unified <(jq --sort-keys . "$_feature.source.ndjson") \
      <(dotnet "$_cli" --no-ast --no-pickles "$_feature" | jq --sort-keys .)
    diff --unified <(jq --sort-keys . "$_feature.ast.ndjson") \
      <(dotnet "$_cli" --no-source --no-pickles "$_feature" | jq --sort-keys .)
    diff --unified <(jq --sort-keys . "$_feature.pickles.ndjson") \
      <(dotnet "$_cli" --no-source --no-ast "$_feature" | jq --sort-keys .)
  done
  for _feature in testdata/bad/*.feature; do
    diff --unified <(jq --sort-keys . "$_feature.errors.ndjson") \
      <(dotnet "$_cli" --no-pickles "$_feature" | jq --sort-keys .)
  done
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "gherkin-dotnet-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
