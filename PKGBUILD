# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=yay-sys-tray-git
pkgver=0.4.0
pkgrel=1
pkgdesc="Arch Linux system tray update checker using yay"
arch=('any')
url="https://github.com/skint007/yay-sys-tray"
license=('MIT')
depends=(python python-pyqt6 pacman-contrib yay)
optdepends=('tailscale: remote server update checking via Tailscale'
            'openssh: SSH access for remote server update checks')
makedepends=(git python-build python-installer python-setuptools python-wheel)
provides=('yay-sys-tray')
conflicts=('yay-sys-tray')
install=yay-sys-tray-git.install
source=("git+https://github.com/skint007/yay-sys-tray.git")
sha256sums=('SKIP')

pkgver() {
    # Fall back to the stamped pkgver= if source hasn't been fetched yet
    # (e.g. when makepkg --printsrcinfo is run by CI before cloning)
    local src="${srcdir}/yay-sys-tray"
    [ -d "$src" ] || { echo "$pkgver"; return; }
    cd "$src"
    git describe --tags --long --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/-0-g[0-9a-f]*$//;s/-\([0-9]*\)-g\([0-9a-f]*\)$/.\1.\2/' \
        || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd yay-sys-tray
    python -m build --wheel --no-isolation
}

package() {
    cd yay-sys-tray
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 resources/yay-sys-tray.desktop "$pkgdir/usr/share/applications/yay-sys-tray.desktop"
    install -Dm644 resources/yay-sys-tray.service "$pkgdir/usr/lib/systemd/user/yay-sys-tray.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
