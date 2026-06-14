# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=5.3.0
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
sha512sums=('05139662d95f88180ae1b4f9ea124d42aa3fbc1a62d3deba7d37530789eec85c930a3a1dee084e8cce2b4f80f0244bc23956ecbcb65433fff29e310c1698bfe5'
            'a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')

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
