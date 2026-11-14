# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-roslyn
pkgver=5.12.0
pkgrel=1
pkgdesc="The .NET Compiler Platform for C#, Microsoft.CodeAnalysis.Common and .CSharp (NuGet packages)"
arch=(any)
url='https://github.com/dotnet/roslyn'
license=(MIT)
_dotnetsdkver="10.0"
makedepends=(
  "dotnet-build-deps-$_dotnetsdkver"
)
# The commit the packages were published from (release/insiders), and the official build of them, see
# the file version 5.900.26.35703 of their assemblies (Arcade encodes the date and build number in it)
_commit="1324e1d34a0490454837a22370e75bbaeecffb87"
_officialbuildid="20260707.3"
# The git history is several gigabytes, the tarball of the commit is enough
source=("roslyn-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('58d53e2044cfe0f04dae4b787b4c5f1464f13b3b600bb706e23ba76bda49dd5acad846ebf665dd62d32446f740eeb0b55e9d215f612462190648dfade2c9ab2f')
b2sums=('ae907f665c45881fe126fb0cbeec9a0de8e8fcb80c33bed6f5fdfb286e5b59c881f9d91127ae5ac6fd2cdd75ee0cd96b701b81941eade5da6a1d18bc68772818')

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
  # Arcade comes from the .NET dotnet-build-deps-10.0 chooses: the source-built artifacts of Arch
  # Linux (dotnet-source-built-artifacts) with dotnet-build-deps-10.0, Microsoft's dotnet-eng feed
  # with dotnet-build-deps-10.0-bin.
  mkdir -p nuget-local
  local _artifacts _arcade _xliff
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local 'Microsoft.DotNet.Arcade.Sdk.*.nupkg' 'Microsoft.DotNet.XliffTasks.*.nupkg'
  done
  for _arcade in nuget-local/Microsoft.DotNet.Arcade.Sdk.*.nupkg; do
    [[ -f "$_arcade" ]] || continue
    _arcade="${_arcade##*/Microsoft.DotNet.Arcade.Sdk.}"
    echo "${_arcade%.nupkg}" >arcade-version
  done
  for _xliff in nuget-local/Microsoft.DotNet.XliffTasks.*.nupkg; do
    [[ -f "$_xliff" ]] || continue
    _xliff="${_xliff##*/Microsoft.DotNet.XliffTasks.}"
    echo "${_xliff%.nupkg}" >xlifftasks-version
  done

  # Upstream pins the SDK it was released with (rollForward: patch), which doesn't accept the installed
  # one of another feature band (e.g. Microsoft's 10.0.4xx with dotnet-build-deps-10.0-bin). dotnet
  # only works outside the repository until its global.json is updated.
  local _sdkver
  _sdkver=$(dotnet --version)

  cd "roslyn-$_commit" || exit
  # Upstream's NuGet.config, which has all of Microsoft's feeds the tests need
  mv NuGet.config NuGet.config.upstream
  sed -i -E -e '/"sdk": \{/,/\}/s|("version": ")[^"]*"|\1'"$_sdkver"'"|' \
    -e 's|("dotnet": ")[^"]*"|\1'"$_sdkver"'"|' global.json
  if [[ -f "$srcdir/arcade-version" ]]; then
    sed -i -E 's|("Microsoft.DotNet.Arcade.Sdk": ")[^"]*"|\1'"$(<"$srcdir/arcade-version")"'"|' global.json
    # Arcade 11 and later register the tasks of the MSBuild version check themselves, the source-built
    # Arcade 10 doesn't: upstream's registration from before it moved to Arcade 12 (dotnet/roslyn#83095).
    # $(…) is MSBuild's property syntax, to be written as it is.
    # shellcheck disable=SC2016
    sed -i '/<Target Name="_CheckRequiredMSBuildVersion"/i\
  <UsingTask TaskName="Microsoft.DotNet.Arcade.Sdk.CompareVersions" AssemblyFile="$(ArcadeSdkBuildTasksAssembly)" />\
  <UsingTask TaskName="Microsoft.DotNet.Arcade.Sdk.SingleError" AssemblyFile="$(ArcadeSdkBuildTasksAssembly)" />' \
      eng/targets/Imports.targets
  fi
  # Arcade's XliffTasks, pinned to the release upstream builds with, which is newer than the source-built
  # one (12.0.0-beta.26475.3 against 10.0.0-dev)
  if [[ -f "$srcdir/xlifftasks-version" ]]; then
    sed -i -E 's|(<MicrosoftDotNetXliffTasksPackageVersion>)[^<]*<|\1'"$(<"$srcdir/xlifftasks-version")"'<|' \
      eng/Version.Details.props
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
  # Microsoft's feeds upstream uses (dotnet-eng is set up by _nuget_config). Only its package sources:
  # the audit source (data.nuget.org) has nothing but vulnerability data, which fails a restore from it.
  local _feeds=()
  mapfile -t _feeds < <(sed -n -E '/<packageSources>/,/<\/packageSources>/s|.*<add key="([^"]+)" value="(https[^"]+)".*|\1=\2|p' \
    NuGet.config.upstream | grep -v '^dotnet-eng=')
  _nuget_config "${_feeds[@]}"
  # The TooDeepObjectInitializer tests expect the parser to run out of stack at a fixed nesting depth,
  # but how much stack there is depends on the thread they run on, so they fail about every other run
  local _test _filter=()
  for _test in TooDeepObjectInitializer TooDeepObjectInitializerAsExpression TooDeepObjectInitializerAsStatement; do
    _filter+=("FullyQualifiedName!=Microsoft.CodeAnalysis.CSharp.UnitTests.ParserErrorMessageTests.$_test")
  done
  # A temp folder of their own: the tests keep their files in /tmp/RoslynTests, which fails when
  # another user's build left it there. It stays in /tmp rather than $srcdir, as MSBuild's named pipes
  # are sockets in it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
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
  rm -rf "${_test_tmp:?}"
}

# Fails if a binary in $pkgdir, also inside the .nupkg files there, is identical to one of the packages
# restored from a remote feed like nuget.org into $1, so no prebuilt binary slips in instead of one built
# from source
_check_prebuilt() {
  local _extracted="$srcdir/check-prebuilt" _metadata _file _hash _found=0
  local _binaries=(-type f '(' -name '*.dll' -o -name '*.exe' -o -name '*.so' -o -name '*.so.*' -o -name '*.dylib' ')')
  local -A _prebuilt=()
  while IFS= read -r -d '' _metadata; do
    grep -qE '"source": *"https?://' "$_metadata" || continue
    while IFS= read -r -d '' _file; do
      _prebuilt[$(sha256sum <"$_file")]="${_file#"$1"/}"
    done < <(find "${_metadata%/*}" "${_binaries[@]}" -print0)
  done < <(find "$1" -name .nupkg.metadata -print0)

  rm -rf "$_extracted"
  mkdir -p "$_extracted"
  while IFS= read -r -d '' _file; do
    mkdir -p "$_extracted/${_file#"$pkgdir"/}"
    bsdtar -xf "$_file" -C "$_extracted/${_file#"$pkgdir"/}"
  done < <(find "$pkgdir" -type f -name '*.nupkg' -print0)
  while IFS= read -r -d '' _file; do
    _hash=$(sha256sum <"$_file")
    if [[ -v "_prebuilt[$_hash]" ]]; then
      echo "Prebuilt binary: ${_file#"$_extracted"/} is ${_prebuilt[$_hash]}" >&2
      _found=1
    fi
  done < <(find "$pkgdir" "$_extracted" "${_binaries[@]}" -print0)
  rm -rf "$_extracted"
  return "$_found"
}

package() {
  install -Dm644 "$srcdir"/nupkg/Microsoft.CodeAnalysis.{Common,CSharp}."$pkgver".nupkg \
    -t "$pkgdir/usr/share/nuget/packages/"
  install -Dm644 "roslyn-$_commit/License.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
