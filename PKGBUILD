# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=6.3.9
pkgrel=1
_deb=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=(x86_64 aarch64)
url="https://github.com/mfat/sshpilot"
license=(GPL-3.0-only)
provides=(sshpilot)
conflicts=(sshpilot)
options=(!strip)
source_x86_64=("$pkgname-$pkgver-$_deb-x86_64.deb::$url/releases/download/v$pkgver/sshpilot_$pkgver-${_deb}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-$_deb-aarch64.deb::$url/releases/download/v$pkgver/sshpilot_$pkgver-${_deb}_arm64.deb")
sha256sums_x86_64=('668af10442c1336d6c63f39d8e2d77cd1030d8b23fa74fdb6585285c620183ff')
sha256sums_aarch64=('3e0aeaecf0c3da33ed28edcf80ce4dfd3209786adcae0fc8f750ff1e74ad2be4')

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
