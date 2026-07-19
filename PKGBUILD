# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=5.5.7
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
    "sshpilot_${pkgver}.deb::${url}/releases/download/v${pkgver}/sshpilot_${pkgver}-${_pkgrel_deb}_all.deb"
)
sha512sums=('ace25f3641751ad0b72029d5f879902ce130883f5eec1f6d5bfc6fdc387f2626f444aeb4eef204ed821bc8dc081e6671235566792aff9f086d3e6e1af8f3153f')

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
