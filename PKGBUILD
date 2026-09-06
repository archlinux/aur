# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=6.0.4
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
sha512sums=('e942863f182520df3bc1a37cf750d0b2ddd6ea1d62437c45324f89763187b04d05fdd4f988d8c4b2423601928e4bc22dc578fff26238079f69b8912a7058c254')

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
