# Maintainer: Ben Davison <bendavison>
pkgname=linux-system-guis
pkgver=0.1.0
pkgrel=1
pkgdesc="An educational, transparent, and safe desktop GUI suite for low-level Linux administration"
arch=('any')
url="https://github.com/bendavison/linux-system-guis"
license=('MIT')
depends=('python' 'python-pyqt6' 'polkit')
optdepends=(
    'sudo: sudoers rule validation and privilege escalation'
    'systemd: journalctl, systemd services & timers, and systemd-boot'
    'grub: GRUB bootloader configuration'
    'acl: POSIX Access Control Lists (getfacl/setfacl)'
    'e2fsprogs: extended file attributes (chattr/lsattr)'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p dist

    local py_bin="/usr/bin/python"
    if [ ! -x "$py_bin" ]; then
        py_bin="$(which python3 2>/dev/null || which python)"
    fi

    local build_opts="--wheel --no-isolation --outdir dist"

    # Build core library
    "$py_bin" -m build $build_opts packages/core

    # Build individual applications and launcher hub
    for app in launcher fstab-gui udev-gui systemd-gui usermgmt-gui sudoers-gui journal-gui sysctl-gui permissions-gui bootloader-gui; do
        "$py_bin" -m build $build_opts "apps/$app"
    done
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    local py_bin="/usr/bin/python"
    if [ ! -x "$py_bin" ]; then
        py_bin="$(which python3 2>/dev/null || which python)"
    fi

    # Install all built wheels
    for whl in dist/*.whl; do
        "$py_bin" -m installer --destdir="$pkgdir" "$whl"
    done

    # Install desktop shortcuts
    install -dm755 "$pkgdir/usr/share/applications"
    install -m644 packaging/desktop/*.desktop "$pkgdir/usr/share/applications/"

    # Install scalable application icon
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -m644 packaging/desktop/icons/linux-system-guis.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/linux-system-guis.svg"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
