# Maintainer: Christian Kugler <syphdias+git at gmail dot com>

pkgname=swayprofile
pkgver=0.1.1
pkgrel=1
pkgdesc="Switch sway power/performance profiles (refresh rate, power-profiles-daemon, LACT GPU, DND) manually, per window or on idle"
arch=('any')
url="https://github.com/Syphdias/swayprofile"
license=('MIT')
depends=('python' 'python-i3ipc' 'sway')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
optdepends=(
    'python-dbus: power-profiles-daemon switching'
    'power-profiles-daemon: power profile switching'
    'swayidle: switching on idle'
    'swaync: do-not-disturb'
    'dunst: do-not-disturb'
    'mako: do-not-disturb'
    'lact: GPU control'
    'libnotify: desktop notifications'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aeddde02e2fbbc9d57c82c2e79bbdbf1f3a111f47a357c80f6dc6d87a5622028')

build() {
    cd "$pkgname-$pkgver"
    # upstream derives its version from git (hatch-vcs); the tag archive has no .git
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    sed -e 's|@EXEC@|/usr/bin/swayprofile|' -e '/install-service/d' src/swayprofile/data/swayprofile.service |
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/swayprofile.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
