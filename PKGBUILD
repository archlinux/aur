# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=thor-flash-utility
pkgver=1.0.4
pkgrel=5
_pkgname="Thor-${pkgver}"
_exe="TheAirBlow.Thor.Shell"
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
  cd "${srcdir}/${_pkgname}"

  # Patch project files to add RuntimeIdentifiers for both x86_64 and aarch64
  # This ensures the build process knows which runtimes to target
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj"
  sed -i "/<TargetFramework>net7.0<\/TargetFramework>/a <RuntimeIdentifiers>linux-x64;linux-arm64<\/RuntimeIdentifiers>" \
    "TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj"

  # Initialize non-nullable fields to avoid build warnings
  sed -i "/public string Project { get; set; }/a public PitData() { Project = string.Empty; }" \
    "TheAirBlow.Thor.Library/PIT/PitData.cs"
  sed -i "/public Protocol Protocol { get; set; }/a public State() { Protocol = new Protocol(); }" \
    "TheAirBlow.Thor.Shell/State.cs"
  sed -i "/private string _description;/a public FailInfo() { _description = string.Empty; }" \
    "TheAirBlow.Thor.Shell/FailInfo.cs"

  dotnet restore "TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj" --packages "${srcdir}/nuget_packages"
  dotnet restore "TheAirBlow.Thor.Shell/TheAirBlow.Thor.Shell.csproj" --packages "${srcdir}/nuget_packages"
}

build() {
  cd "${srcdir}/${_pkgname}"
  if [ "$CARCH" = "x86_64" ]; then
    runtime="linux-x64"
  elif [ "$CARCH" = "aarch64" ]; then
    runtime="linux-arm64"
  else
    echo "Unsupported architecture: $CARCH"
    exit 1
  fi

  dotnet publish "Thor.sln" --configuration Release --output "${srcdir}/publish" \
    --runtime "$runtime" --no-self-contained
}

package() {
  cd "${srcdir}/publish"
  install -Dm644 *.dll *.json -t "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${_exe}" -t "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_exe}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
