# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-roslyn
pkgver=5.9.0
pkgrel=2
pkgdesc="The .NET Compiler Platform for C#, Microsoft.CodeAnalysis.Common and .CSharp (NuGet packages)"
arch=('any')
url='https://github.com/dotnet/roslyn'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
)
# The commit the packages were published from (release/insiders), and the official build of them, see
# the file version 5.900.26.35703 of their assemblies (Arcade encodes the date and build number in it)
_commit="35d9211b841e7613c1d2f8f5af6d628ace696c4c"
_officialbuildid="20260707.3"
# The git history is several gigabytes, the tarball of the commit is enough
source=("roslyn-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('4fe7d11a37a11f66721d9c1155409ab52e1a594b90999809e0efa37b4136797ad828cb1abcc06ac9885928812693e621f77da956ddcb582c6a16c9555c63bc83')
b2sums=('9871ff6860d0cef76ba1dad7b8d6957f8528f2589bbe320f6e3d438022cb44f425b2cbaf1b17c43313bcce6562d418133383acc290f7b6d9bc558fedf0101349')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, see eng/Versions.props. The repository information usually
  # comes from git, which would find the repository this PKGBUILD is in instead.
  _build_arguments=(
    --configuration Release
    -p:OfficialBuildId="$_officialbuildid"
    -p:DotNetFinalVersionKind=release
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
  )
}

# Writes NuGet.config with the given feeds ($@, as key=url) for everything but Arcade, the build SDK
# of the repository. It's taken from the source-built artifacts if prepare() found it there, otherwise
# from Microsoft's dotnet-eng feed like upstream does.
_nuget_config() {
  local _arcadefeed=dotnet-eng _feed _package
  [[ -f "$srcdir/arcade-version" ]] && _arcadefeed=dotnet-source-built
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
EOF
    for _feed in "dotnet-eng=https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json" "$@"; do
      echo "    <add key=\"${_feed%%=*}\" value=\"${_feed#*=}\" />"
    done
    cat <<EOF
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="$_arcadefeed">
EOF
    for _package in Microsoft.DotNet.Arcade.Sdk Microsoft.DotNet.XliffTasks; do
      echo "      <package pattern=\"$_package\" />"
    done
    echo '    </packageSource>'
    for _feed in "$@"; do
      printf '    <packageSource key="%s">\n      <package pattern="*" />\n    </packageSource>\n' "${_feed%%=*}"
    done
    cat <<EOF
  </packageSourceMapping>
</configuration>
EOF
  } >NuGet.config
}

prepare() {
  # Arcade is part of the source-built .NET of Arch Linux (dotnet-source-built-artifacts), which
  # Arch Linux ARM doesn't have. It can't be a makedepends of an arch=any package, so it's used when
  # it's installed, and Arcade comes from dotnet-eng otherwise.
  mkdir -p nuget-local
  local _artifacts _arcade
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local 'Microsoft.DotNet.Arcade.Sdk.*.nupkg' 'Microsoft.DotNet.XliffTasks.*.nupkg'
  done
  for _arcade in nuget-local/Microsoft.DotNet.Arcade.Sdk.*.nupkg; do
    [[ -f "$_arcade" ]] || continue
    _arcade="${_arcade##*/Microsoft.DotNet.Arcade.Sdk.}"
    echo "${_arcade%.nupkg}" >arcade-version
  done

  cd "roslyn-$_commit" || exit
  # Upstream's NuGet.config, which has all of Microsoft's feeds the tests need
  mv NuGet.config NuGet.config.upstream
  if [[ -f "$srcdir/arcade-version" ]]; then
    sed -i -E 's|("Microsoft.DotNet.Arcade.Sdk": ")[^"]*"|\1'"$(<"$srcdir/arcade-version")"'"|' global.json
  fi
  # The syntax generator, which runs while compiling, is checked by a prebuilt analyzer from Microsoft's
  # feeds, which isn't needed for building
  sed -i '/<PackageReference Include="Microsoft.CodeAnalysis.Analyzers" PrivateAssets="all" \/>/d' \
    src/Tools/CompilerGeneratorTools/Source/CSharpSyntaxGenerator/CSharpSyntaxGenerator.csproj
}

build() {
  _dotnet_env
  cd "roslyn-$_commit" || exit
  # The source-only mode .NET's source-build uses, which leaves out Roslyn's own analyzers (prebuilt
  # packages from Microsoft's feeds) and the tests. The assemblies are public signed with Microsoft's key
  # like in source-build, giving them the same strong name as upstream's.
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
  local _project
  for _project in src/Compilers/Core/Portable/Microsoft.CodeAnalysis.csproj \
    src/Compilers/CSharp/Portable/Microsoft.CodeAnalysis.CSharp.csproj; do
    dotnet pack "$_project" "${_build_arguments[@]}" -p:DotNetBuildSourceOnly=true --output "$srcdir/nupkg"
  done
}

check() {
  _dotnet_env
  cd "roslyn-$_commit" || exit
  # The tests are only built outside the source-only mode. They need test packages from all of
  # Microsoft's feeds upstream uses (dotnet-eng is set up by _nuget_config).
  local _feeds=()
  mapfile -t _feeds < <(sed -n -E 's|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' NuGet.config.upstream |
    grep -v '^dotnet-eng=')
  _nuget_config "${_feeds[@]}"
  # The TooDeepObjectInitializer tests expect the parser to run out of stack at a fixed nesting depth,
  # but how much stack there is depends on the thread they run on, so they fail about every other run
  local _test _filter=()
  for _test in TooDeepObjectInitializer TooDeepObjectInitializerAsExpression TooDeepObjectInitializerAsStatement; do
    _filter+=("FullyQualifiedName!=Microsoft.CodeAnalysis.CSharp.UnitTests.ParserErrorMessageTests.$_test")
  done
  local _project
  for _project in src/Compilers/Core/CodeAnalysisTest/Microsoft.CodeAnalysis.UnitTests.csproj \
    src/Compilers/CSharp/Test/Syntax/Microsoft.CodeAnalysis.CSharp.Syntax.UnitTests.csproj \
    src/Compilers/CSharp/Test/Semantic/Microsoft.CodeAnalysis.CSharp.Semantic.UnitTests.csproj \
    src/Compilers/CSharp/Test/Symbol/Microsoft.CodeAnalysis.CSharp.Symbol.UnitTests.csproj; do
    # Without the official versions, some tests expect the version of development builds (42.42.42.42)
    dotnet test "$_project" --configuration Release -p:RepositoryCommit="$_commit" -p:RepositoryUrl="$url" \
      --framework "net$_dotnetsdkver" --filter "$(
        IFS='&'
        echo "${_filter[*]}"
      )"
  done
}

package() {
  install -Dm644 "$srcdir"/nupkg/Microsoft.CodeAnalysis.{Common,CSharp}."$pkgver".nupkg \
    -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "roslyn-$_commit/License.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
