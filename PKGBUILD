# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=4.8.3
pkgrel=1
_pkgrel_deb=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=('any')
url="https://github.com/mfat/sshpilot"
license=('GPL-3.0-only')
provides=('sshpilot')
conflicts=('sshpilot')
options=(!strip)

source=(
    "sshpilot_${pkgver}.deb::${url}/releases/download/v${pkgver}/sshpilot_${pkgver}-${_pkgrel_deb}_all.deb"
    "LICENSE::https://raw.githubusercontent.com/mfat/sshpilot/refs/tags/v${pkgver}/LICENSE"
)
sha512sums=('649914ef40b62763745a7bd4503200c362aff8ed56494090d8024abc4b8f4e4402cb0d493e5077860764586497a3ac606a72e607235913dfb1b8aa42b84d9591'
            '714d66c4a17e6dfc1553521af2be03f4579fac64048c0b96c592177562b01fc70a8e184bb21725e11ef96a54bf466ae1abd4992b8940f0fe2c0859d6a166a2ef')

package() {
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
    local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

    # Copy package contents to pkgdir
    tar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

    # Move Python package to correct site-packages location
    install -dm755 "${pkgdir}${site_packages}"
    mv "${pkgdir}/usr/lib/python3/dist-packages/sshpilot" "${pkgdir}${site_packages}/"

    # Compile bytecode
    python -m compileall -q "$pkgdir/$site_packages/sshpilot/"

    # Clean up Debian-specific Python path
    rm -rf "${pkgdir}/usr/lib/python3"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
