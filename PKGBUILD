
# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.6.5
pkgrel=3
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
)
options=(!strip)

source=(
    "${_pkgname}_${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${_pkgrel_deb}_all.deb"
    "LICENSE::https://raw.githubusercontent.com/mfat/${_pkgname}/refs/tags/v${pkgver}/LICENSE"
)
sha512sums=('74b3d514fc67ff7e0035a90b8853215e8ebe2abf7278aaa04cbaf365c7d6a326b6e5a333c4a87269f41cad33fe6382043dbb6cd1cfe93b0fcfd3ce5a1a0be61b'
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
