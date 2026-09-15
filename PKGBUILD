# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=6.1.3
pkgrel=1
_pkgrel_deb=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=(any)
url="https://github.com/mfat/sshpilot"
license=(GPL-3.0-only)
provides=(sshpilot)
conflicts=(sshpilot)
options=(!strip)

source=(
    "$pkgname-$pkgver-$_pkgrel_deb.deb::$url/releases/download/v$pkgver/sshpilot_${pkgver}-${_pkgrel_deb}_all.deb"
)
sha512sums=('606aa7fadf9002fca007caaa34f30fae7a77e59f6610fdd897736caf6356ceca14d71555349fcae7561591dd4109c82668bad021d1a47e6a1f1cfadd4dc1ae6b')

package() {
    depends=(
        gtk4
        libadwaita
        libsecret
        python
        python-cairo
        python-cryptography
        python-gobject
        python-keyring
        python-matplotlib
        python-paramiko
        python-psutil
        sshpass
        vte4
        webkitgtk-6.0
        python-flask
        python-flask-socketio
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
}
