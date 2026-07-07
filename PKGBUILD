pkgname=openssh-gui-git
_pkgname=OpenSSH-GUI
pkgver=3.2.3.852b291afb50a7a7235e4773a39dd4643d6e4b44.20260707
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Sourcepackage)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')
options=('!strip')

depends=('icu' 'openssl' 'zlib' 'krb5' 'libx11')
makedepends=('git' 'dotnet-sdk-10.0' 'librsvg')

provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-bin' 'openssh-gui-nightly')

source=("git+${url}.git#branch=development")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    local version

    version=$(dotnet msbuild OpenSSH_GUI/OpenSSH_GUI.csproj \
        -nologo \
        -restore:false \
        -getProperty:Version \
        | tr -d '\r' \
        | tr '-' '.')

    printf "%s.%s.%s" \
        "$version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  dotnet publish OpenSSH_GUI/OpenSSH_GUI.csproj \
      --configuration Release \
      --runtime linux-x64 \
      --output publish \
      -p:SelfContained=true \
      -p:PublishSingleFile=true \
      -p:PublishReadyToRun=false \
      -p:IncludeNativeLibrariesForSelfExtract=true \
      -p:Version="${pkgver}"

  rsvg-convert -w 256 -h 256 images/openssh-gui.svg -o appicon-256.png
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "publish/OpenSSH_GUI" \
    "${pkgdir}/usr/bin/openssh-gui"

  install -Dm644 "appicon-256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"

  install -Dm644 "images/openssh-gui.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openssh-gui.svg"

  install -Dm644 "openssh-gui.desktop" \
    "${pkgdir}/usr/share/applications/openssh-gui.desktop"

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}