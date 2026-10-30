# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-nerdbank-streams
_nugetid=Nerdbank.Streams
pkgver=2.14.411
pkgrel=1
pkgdesc="Streams for full duplex in-proc communication, wrap a WebSocket, split a stream into multiple channels, Nerdbank.Streams (NuGet package)"
arch=('any')
url='https://github.com/dotnet/Nerdbank.Streams'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-vs-threading
  dotnet-vs-validation
  jq
)
# The commit the package was published from (tag v2.14.411), and the commit of the MessagePack
# submodule it uses some sources of
_commit="bdd943456d04a2c68b87d6b559de7f3ab1186bc1"
_messagepackcommit="a718919a6b01ca8bb883f579b3cc78f8cc219a81"
source=("Nerdbank.Streams-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "MessagePack-CSharp-$_messagepackcommit.tar.gz::https://github.com/AArnott/MessagePack-CSharp/archive/$_messagepackcommit.tar.gz")
sha512sums=('fff5fdff9affeb9172611082a857effbe234158a0e64ca97d5fcf99a31ca742fa76a53d8e400a0539e581a841f2373ec66bcf70ef8d994cb3390d91cc48dc832'
  '94707a0f85e6fdb7c14be2d73e150ecd499846a795a316ca2534ee793877c3cc903f983790a7985668e5905700099f26692ba99b45ebb3d3556d18b7215701db')
b2sums=('40555daef5ebad0070a1dbb62a172509ce2cf6274853368638cf03bc00dd4a4f8e6eb2edca4b839a8d526a2e298e6feaceb3c8419330b0515c704a0fb1bc234e'
  '7f2cda90be668caed1410eaa5c7df29ca3eea644fac278f6740b47ec0116f10e6bd3478f391ced4ad9671897d27196fa49c8a7cf910b464b712292c9fc629fd5')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # Versions as in the official build, which Nerdbank.GitVersioning computes from git. The patch
  # version is the git height, and the file version ends in the first two bytes of the commit. The
  # repository information usually comes from git, which would find the repository this PKGBUILD is
  # in instead. The packages from the source-built artifacts and the system feed are newer than the
  # versions referenced (NU1603).
  _build_arguments=(
    --configuration Release
    -p:Version="$pkgver"
    -p:AssemblyVersion="${pkgver%.*}.0.0"
    -p:FileVersion="$pkgver.$((16#${_commit:0:4}))"
    -p:InformationalVersion="$pkgver+${_commit:0:10}"
    -p:IncludeSourceRevisionInInformationalVersion=false
    -p:EnableSourceControlManagerQueries=false
    -p:RepositoryType=git
    -p:RepositoryBranch="refs/heads/v${pkgver%.*}"
    -p:RepositoryCommit="$_commit"
    -p:RepositoryUrl="$url"
    -p:WarningsNotAsErrors=NU1603
  )
}

# .NET runtime packages the library is built against
_runtimepackages=(
  Microsoft.Bcl.AsyncInterfaces
  System.IO.Pipelines
)

# Packages built from source by other packages (makedepends), in the system feed
_systempackages=(
  Microsoft.VisualStudio.Threading.Only
  Microsoft.VisualStudio.Validation
)

# Writes nuget.config with the feed $1 (as key=url) for everything but the packages of the system
# feed and the runtime packages, which are taken from the source-built artifacts if prepare() found
# them there
_nuget_config() {
  local _package
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-system" value="/usr/share/dotnet/nuget-packages" />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="${1%%=*}" value="${1#*=}" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-system">
EOF
    for _package in "${_systempackages[@]}"; do
      echo "      <package pattern=\"$_package\" />"
    done
    echo '    </packageSource>'
    if [[ -f "$srcdir/runtime-packages" ]]; then
      echo '    <packageSource key="dotnet-source-built">'
      for _package in "${_runtimepackages[@]}"; do
        echo "      <package pattern=\"$_package\" />"
      done
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="${1%%=*}">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >nuget.config
}

prepare() {
  # The runtime packages are part of the source-built .NET of Arch Linux
  # (dotnet-source-built-artifacts), which Arch Linux ARM doesn't have. It can't be a makedepends of
  # an arch=any package, so it's used when it's installed, and they come from nuget.org otherwise.
  mkdir -p nuget-local
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_runtimepackages[@]/%/.*.nupkg}"
    touch runtime-packages
  done

  cd "Nerdbank.Streams-$_commit" || exit
  rmdir ext/MessagePack
  ln -s "$srcdir/MessagePack-CSharp-$_messagepackcommit" ext/MessagePack
  # Upstream pins a newer feature band of the .NET SDK, which isn't needed
  jq 'del(.sdk)' global.json >global.json.new
  mv global.json.new global.json
  # Nerdbank.GitVersioning needs git, see _dotnet_env for the versions
  sed -i '/GlobalPackageReference Include="Nerdbank.GitVersioning"/d' Directory.Packages.props
  sed -i 's/ DependsOnTargets="GetBuildVersion"//' Directory.Build.props
  _nuget_config "nuget.org=https://api.nuget.org/v3/index.json"
}

build() {
  _dotnet_env
  cd "Nerdbank.Streams-$_commit" || exit
  # The assemblies are signed with the key in the repository, giving them the same strong names as
  # upstream's
  dotnet pack "src/$_nugetid/$_nugetid.csproj" "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  cd "Nerdbank.Streams-$_commit" || exit
  # The test runner targets .NET 8. global.json selects Microsoft.Testing.Platform for dotnet test.
  # OfferNullErrorCompletedPipe expects the message .NET 8 gives NullReferenceException(null), newer
  # .NET gives it the default message.
  DOTNET_ROLL_FORWARD=Major dotnet test --project "test/$_nugetid.Tests/$_nugetid.Tests.csproj" "${_build_arguments[@]}" \
    --filter-not-method '*.OfferNullErrorCompletedPipe'
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 "Nerdbank.Streams-$_commit/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
