# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=sshpilot-bin
pkgver=6.5.2
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
sha256sums_x86_64=('9315cbc70f48ed0c251c520077007c8afd9123af612f641590071f35f93bd6ee')
sha256sums_aarch64=('9edd1d7aa13bfd6c7f7d2e097bec861759d2a6f991bb015873df96c3b7bca0ca')

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
