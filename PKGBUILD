# Maintainer: Tonkku <contact@tonkku.me>

pkgname=authy-snap
pkgver=1.8.0
pkgrel=1
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url='https://authy.com/'
provides=('authy')
license=('ISC') # According to the authy(AUR) package...
depends=('nss' 'gtk3' 'libxss' 'libdbusmenu-glib')
optdepends=()
makedepends=('squashfs-tools')
_snapid="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
_snaprev="1"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha256sums=('6189c2439fbddae802b1f7f86132ffdeeed6f8e911108c41cd353ef1a70858d9')

prepare() {
    echo "Extracting snap file..."
    unsquashfs -q -f -d "${srcdir}/authy" "${_snapid}_${_snaprev}.snap"
}

package() {
    # Install files
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/authy/." "${pkgdir}/opt/${pkgname}"

    # Desktop Entry
    sed -i "s/\${SNAP}/\/opt\/${pkgname}/" "${pkgdir}/opt/${pkgname}/meta/gui/authy.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/authy.desktop" -t "${pkgdir}/usr/share/applications"
    
    # Symlink binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/authy" "${pkgdir}/usr/bin"
}
