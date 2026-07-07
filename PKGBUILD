pkgname=openssh-gui-git
_pkgname=OpenSSH-GUI
_pkgdirname=OpenSSH_GUI
pkgver=3.2.0.417.a1b2c3d
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

prepare() {
  cd "${srcdir}/${_pkgname}"
  dotnet restore ${_pkgdirname}/${_pkgdirname}.csproj
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    local version

    version=$(dotnet msbuild ${_pkgdirname}/${_pkgdirname}.csproj \
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

  dotnet publish ${_pkgdirname}/${_pkgdirname}.csproj \
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

  install -Dm755 "publish/${_pkgdirname}" \
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