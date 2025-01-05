# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=thor-flash-utility
pkgver=1.0.4
pkgrel=6
pkgdesc="Utility for flashing firmware on Samsung devices, based on dotnet 7.0"
arch=('x86_64' 'aarch64')
url="https://github.com/Samsung-Loki/Thor"
license=('MPL-2.0')
depends=('dotnet-runtime-7.0' 'gcc-libs' 'glibc')
makedepends=('dotnet-sdk-7.0')
optdepends=('android-udev: Adds udev rules for non-root users (Group adbusers)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samsung-Loki/Thor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7c6a5482a2a6a0af2711849441f8a8227bca240e38ab56ba9a50ed6eb13ed78e')

prepare() {
  # Set up environment variables for dotnet CLI
  export DOTNET_CLI_HOME="${srcdir}"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  cd "${srcdir}/Thor-${pkgver}"

  # Patch project files to add RuntimeIdentifiers for both x86_64 and aarch64
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj"
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj"

  # Restore dotnet packages
  dotnet restore "TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj" \
    --packages "${srcdir}/nuget_packages"
  dotnet restore "TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj" \
    --packages "${srcdir}/nuget_packages"
}

build() {
  # Set up environment variables for dotnet CLI
  export DOTNET_CLI_HOME="${srcdir}"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  cd "${srcdir}/Thor-${pkgver}"

  # Determine the runtime based on the architecture
  if [ "$CARCH" = "x86_64" ]; then
    runtime="linux-x64"
  elif [ "$CARCH" = "aarch64" ]; then
    runtime="linux-arm64"
  else
    echo "Unsupported architecture: $CARCH"
    exit 1
  fi

  # Publish the Thor Library project
  cd "${srcdir}/Thor-${pkgver}/TheAirBlow.Thor.Library"
  dotnet publish \
    --configuration Release \
    --output "${srcdir}/publish" \
    --runtime "$runtime" \
    --no-self-contained \
    --nologo

  # Publish the Thor Shell project
  cd "${srcdir}/Thor-${pkgver}/TheAirBlow.Thor.Shell"
  dotnet publish \
    --configuration Release \
    --output "${srcdir}/publish" \
    --runtime "$runtime" \
    --no-self-contained \
    --nologo
}

package() {
  cd "${srcdir}/publish"

  # Install the binaries and other necessary files
  install -Dm644 *.{dll,json} -t "${pkgdir}/opt/${pkgname}"
  install -Dm755 TheAirBlow.Thor.Shell -t "${pkgdir}/opt/${pkgname}"

  # Create a symlink in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/TheAirBlow.Thor.Shell" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: set ts=2 sw=2 et:
