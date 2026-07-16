# Maintainer: Eslam M. Abdel-Salam <eabdelsalam@hotmail.com>
pkgname=arcitect-bin
_pkgname=arcitect
pkgver=1.6.0
pkgrel=1
pkgdesc="Cross-platform GUI app to create and manage DataPLANT ARCs (Annotated Research Contexts)."
arch=('x86_64')
url="https://github.com/nfdi4plants/ARCitect"
license=('custom:none')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'git'
  'git-lfs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'libxkbcommon'
  'mesa'
  'nspr'
  'nss'
  'pango'
)
optdepends=('libnotify: For desktop notifications'
            'libsecret: For secure password storage'
            'xdg-utils: For opening links')
options=('strip')

source=("${pkgname}-${pkgver}.deb::https://github.com/nfdi4plants/ARCitect/releases/download/v${pkgver}/ARCitect_${pkgver}_amd64.deb")
sha256sums=('6b5b02b29532eb259db8379319ad0a5b573100f2518406b0821a4a159498c144')

prepare() {
    cd "$srcdir"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.*
}

package() {
    cd "$srcdir"

    cp -r usr "${pkgdir}/"
    cp -r opt "${pkgdir}/"

    if [ ! -e "$pkgdir/usr/bin/arcitect" ] && [ -d "$pkgdir/opt/ARCitect" ]; then
      install -d "$pkgdir/usr/bin"
      ln -s "/opt/ARCitect/arcitect" "$pkgdir/usr/bin/arcitect"
    fi

    # Add license notice as the arcitect repo has no license available
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat <<EOF > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  This application is distributed by DataPLANT (nfdi4plants).
  No formal LICENSE file was included in the upstream repository or the distribution package at the time of packaging.
  Please refer to the upstream repository for updates: https://github.com/nfdi4plants/ARCitect
EOF
}
