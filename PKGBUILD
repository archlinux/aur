# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.7.8
pkgrel=1
_pkgrel_deb=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=('any')
url="https://github.com/mfat/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
    'gtk4'
    'libadwaita'
    'libsecret'
    'python'
    'python-cairo'
    'python-cryptography'
    'python-gobject'
    'python-keyring'
    'python-matplotlib'
    'python-paramiko'
    'python-psutil'
    'sshpass'
    'vte4'
    'webkitgtk-6.0'
    'python-flask'
    'python-flask-socketio'
)
options=(!strip)

source=(
    "${_pkgname}_${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${_pkgrel_deb}_all.deb"
    "LICENSE::https://raw.githubusercontent.com/mfat/${_pkgname}/refs/tags/v${pkgver}/LICENSE"
)
sha512sums=('64658a0c1710a90e7ff460f3a18f8b6d929d16dca7255569923a69c9e9777f787f4906782ad623e5fb6d8ea72f54abdc9e2ade43a7552f3e81449984951f3d14'
            '714d66c4a17e6dfc1553521af2be03f4579fac64048c0b96c592177562b01fc70a8e184bb21725e11ef96a54bf466ae1abd4992b8940f0fe2c0859d6a166a2ef')

prepare() {
    # Extract deb data archive
    tar -xf "${srcdir}/data.tar.zst" -C "${srcdir}"
}

package() {
    local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

    # First, copy usr directory contents to pkgdir
    cp -r "${srcdir}/usr" "${pkgdir}/"

    # Move Python package to correct site-packages location
    install -dm755 "${pkgdir}${site_packages}"
    mv "${pkgdir}/usr/lib/python3/dist-packages/sshpilot" "${pkgdir}${site_packages}/"

    # Clean up Debian-specific Python path
    rm -rf "${pkgdir}/usr/lib/python3"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
