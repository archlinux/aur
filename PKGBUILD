pkgname=openssh-gui-git
_pkgname=OpenSSH-GUI
pkgver=3.1.4.20260611.8afddd6
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Sourcepackage)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')

depends=('dotnet-runtime-10.0')
makedepends=('git' 'dotnet-sdk-10.0')

provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-bin' 'openssh-gui-nightly')

source=("git+${url}.git#branch=development")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local base count hash
  base=$(grep -oP '(?<=<BaseVersion>)[^<]+' Directory.Build.props)
  count=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)

  printf "%s.r%s.g%s\n" "$base" "$count" "$hash"
}

build() {
  cd "${srcdir}/${_pkgname}"

  dotnet publish OpenSSH_GUI/OpenSSH_GUI.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --output publish \
    -p:PublishSingleFile=true \
    -p:PublishReadyToRun=true \
    -p:IncludeNativeLibrariesForSelfExtract=true \
    -p:SelfContained=false
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "publish/OpenSSH_GUI" \
    "${pkgdir}/usr/bin/openssh-gui"

  install -Dm644 "OpenSSH_GUI/Assets/appicon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"

  install -Dm644 "openssh-gui.desktop" \
    "${pkgdir}/usr/share/applications/openssh-gui.desktop"

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}