# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=thor-flash-utility
pkgver=1.1.0
pkgrel=1
pkgdesc="Utility for flashing firmware on Samsung devices, based on .NET 9 Native AOT"
arch=('x86_64' 'aarch64')
url="https://github.com/Samsung-Loki/Thor"
license=('MPL-2.0')
depends=('glibc')
makedepends=('dotnet-sdk-9.0' 'ca-certificates')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samsung-Loki/Thor/archive/refs/tags/${pkgver}.tar.gz"
        "NuGet.Config")
sha256sums=('af1b55c9143b6001f07e537a58a2761911746419e4312d4fab239efee0200579'
            'b8ff5486232770da7b6bced4a4b829b7c9dc184961bad1c2b8c965f46f584b90')
options=('!strip')

prepare() {
  cd "${srcdir}/Thor-${pkgver}"

  # Dotnet environment for reproducibility
  export DOTNET_CLI_HOME="${srcdir}/.dotnetcli"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export NUGET_PACKAGES="${srcdir}/nuget_packages"
  export HOME="${srcdir}/.dotnethome"

  # Restore dependencies with local NuGet.Config
  dotnet restore TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj \
    --configfile "${srcdir}/NuGet.Config" --verbosity minimal
  dotnet restore TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj \
    --configfile "${srcdir}/NuGet.Config" --verbosity minimal
}

build() {
  cd "${srcdir}/Thor-${pkgver}"

  export DOTNET_CLI_HOME="${srcdir}/.dotnetcli"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export NUGET_PACKAGES="${srcdir}/nuget_packages"
  export HOME="${srcdir}/.dotnethome"

  if [[ "$CARCH" == "x86_64" ]]; then
    runtime="linux-x64"
  elif [[ "$CARCH" == "aarch64" ]]; then
    runtime="linux-arm64"
  else
    echo "Unsupported architecture: $CARCH"
    exit 1
  fi

  dotnet publish TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj \
    --configuration Release \
    --output "${srcdir}/publish" \
    --runtime "$runtime" \
    --self-contained true \
    --nologo
}

package() {
  install -Dm755 "${srcdir}/publish/TheAirBlow.Thor.Shell" \
    "${pkgdir}/usr/bin/thor-flash-utility"
}

# vim: set ts=2 sw=2 et:
