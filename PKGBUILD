# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=syndical
pkgver=1.1.0
pkgrel=5
pkgdesc="A cleaner, more understandable, and faster firmware downloader and decrypter for Samsung devices"
arch=('x86_64' 'aarch64')
url="https://github.com/Samsung-Loki/Syndical"
license=('MPL-2.0')
depends=('dotnet-runtime-7.0' 'gcc-libs' 'glibc' 'openssl-1.1')
makedepends=('dotnet-sdk-7.0' 'patch')
optdepends=('android-udev: Adds udev rules for non-root users (Group adbusers)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Samsung-Loki/Syndical/archive/refs/tags/v$pkgver.tar.gz"
        "imei-fix.patch")
sha256sums=('7d8b4156a3fe9b0bb28b358d2fdc61912ab04daae20177fac7aa8430bcd845a0'
            '5434c1d2f8f055fa1c438af8e0ad226f17a572b3fa123a148aafddf36f99bfb8')

prepare() {
  export DOTNET_CLI_HOME="${srcdir}"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  cd "${srcdir}/Syndical-${pkgver}"

  # Apply the IMEI fix patch
  patch -p1 <"${srcdir}/imei-fix.patch"

  # Patch project files to add RuntimeIdentifiers for both x86_64 and aarch64
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Syndical.Application/TheAirBlow.Syndical.Application.csproj"
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Syndical.Library/TheAirBlow.Syndical.Library.csproj"

  # Restore dependencies
  dotnet restore TheAirBlow.Syndical.Application/TheAirBlow.Syndical.Application.csproj \
    --packages "${srcdir}/nuget_packages"
  dotnet restore TheAirBlow.Syndical.Library/TheAirBlow.Syndical.Library.csproj \
    --packages "${srcdir}/nuget_packages"
}

build() {
  export DOTNET_CLI_HOME="${srcdir}"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  cd "${srcdir}/Syndical-${pkgver}"

  # Determine the runtime based on the architecture
  if [ "$CARCH" = "x86_64" ]; then
    runtime="linux-x64"
  elif [ "$CARCH" = "aarch64" ]; then
    runtime="linux-arm64"
  else
    echo "Unsupported architecture: $CARCH"
    exit 1
  fi

  # Publish projects
  dotnet publish TheAirBlow.Syndical.Application/TheAirBlow.Syndical.Application.csproj \
    --configuration Release \
    --output "${srcdir}/build" \
    --runtime "$runtime" \
    --no-self-contained \
    --nologo

  dotnet publish TheAirBlow.Syndical.Library/TheAirBlow.Syndical.Library.csproj \
    --configuration Release \
    --output "${srcdir}/build" \
    --runtime "$runtime" \
    --no-self-contained \
    --nologo
}

package() {
  # Install the application and its dependencies
  install -Dm644 ${srcdir}/build/*.{dll,json} -t "${pkgdir}/opt/${pkgname}"
  install -Dm755 ${srcdir}/build/TheAirBlow.Syndical.Application -t "${pkgdir}/opt/${pkgname}"

  # Create a symlink in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/TheAirBlow.Syndical.Application "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
