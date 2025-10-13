# Maintainer: Jannify <Jannify at outlook dot com>

pkgver=1.8.0.0
sha256sums=("2d1382cdb40afdb14ade7a9600fe25a1a088b018ded1633dceabf3edacc67ae9"
            "9c726e2440a7ad241bbf9f846731d28986d94aa0a0ee609ef1842992aa8fceb0")
_dotnet_version=9.0

pkgname=nitrox
pkgdesc="An open-source, multiplayer modification for the game Subnautica."
pkgrel=2
url="https://github.com/SubnauticaNitrox/Nitrox"
license=("GPL-3.0-only")
provides=("nitrox")

arch=("x86_64" "aarch64")
depends=(
  "dotnet-runtime>=${_dotnet_version}"
  "fontconfig" "libx11" "libice" "libsm"  # Avalonia
)
optdepends=('hicolor-icon-theme: freedesktop icon support')
makedepends=("git" "dotnet-sdk>=${_dotnet_version}" "imagemagick")
source=("Nitrox-${pkgver}::git+${url}#tag=${pkgver}" "nitrox.desktop")
options=('!strip' 'staticlibs')

prepare() {
  export NUGET_PACKAGES="${PWD}/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  local nitrox_runtime
  if [[ "$CARCH" == "x86_64" ]] then
    nitrox_runtime="linux-x64"
  elif [[ "$CARCH" == "aarch64" ]] then
    nitrox_runtime="linux-arm64"
  else
    echo "Could not identify architecture $CARCH"
  fi

  cd "${srcdir}/Nitrox-${pkgver}"
  dotnet restore --locked-mode Nitrox.sln --runtime ${nitrox_runtime}
}

build() {
  local nitrox_runtime
  if [[ "$CARCH" == "x86_64" ]] then
    nitrox_runtime="linux-x64"
  elif [[ "$CARCH" == "aarch64" ]] then
    nitrox_runtime="linux-arm64"
  else
    echo "Could not identify architecture $CARCH"
  fi

  cd "${srcdir}/Nitrox-${pkgver}"
  dotnet build Nitrox.Launcher \
    --configuration Release \
    --runtime ${nitrox_runtime} \
    --no-restore \
    --verbosity quiet

  # Icons
  mkdir -p "${srcdir}/icons"
  local nitrox_icon_size
  for nitrox_icon_size in 16 32 48 64 128 256 512; do
    magick "./Nitrox.Launcher/Assets/Images/nitrox-icon.ico" \
      -thumbnail ${nitrox_icon_size}x${nitrox_icon_size} -alpha on -background none -flatten \
      "${srcdir}/icons/nitrox-icon-${nitrox_icon_size}x${nitrox_icon_size}.png"
  done
}

check() {
  cd "${srcdir}/Nitrox-${pkgver}"
  mkdir -p "${HOME}/.config"
  dotnet test Nitrox.Test/Nitrox.Test.csproj \
    --no-restore \
    --verbosity quiet
}

package() {
  local nitrox_runtime
  if [[ "$CARCH" == "x86_64" ]] then
    nitrox_runtime="linux-x64"
  elif [[ "$CARCH" == "aarch64" ]] then
    nitrox_runtime="linux-arm64"
  else
    echo "Could not identify architecture $CARCH"
  fi

  # Ensure the directories exist
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/licenses"
  install -d "${pkgdir}/usr/share/pixmaps"

  # Copy the package files to the appropriate directory
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/Nitrox-${pkgver}/Nitrox.Launcher/bin/Release/net${_dotnet_version}/${nitrox_runtime}/." \
    "${pkgdir}/opt/${pkgname}"
  chmod +x "${pkgdir}/opt/${pkgname}/Nitrox.Launcher"
  chmod +x "${pkgdir}/opt/${pkgname}/NitroxServer-Subnautica"

  # Create the symbolic link
  ln -s "/opt/${pkgname}/Nitrox.Launcher" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/NitroxServer-Subnautica" "${pkgdir}/usr/bin/${pkgname}-server"

  # install .desktop file
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  # Icons
  local icon_size pkg_icon_dir
  for icon_size in 16 32 48 64 128 256 512; do
    icon_size="${icon_size}x${icon_size}"
    pkg_icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}/apps"
    install -d "${pkg_icon_dir}"
    install -m644 "${srcdir}/icons/nitrox-icon-${icon_size}.png" "${pkg_icon_dir}/${pkgname}.png"
  done

  install -m644 "${srcdir}/icons/nitrox-icon-256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -d "${pkgdir}/usr/share/licenses/nitrox"
  install -m644 "${srcdir}/Nitrox-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/nitrox/LICENSE.txt"
}
