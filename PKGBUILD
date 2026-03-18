# Maintainer: exceptionptr <https://github.com/exceptionptr>
pkgname=tsm-app
pkgver=1.0.2
pkgrel=1
pkgdesc="TradeSkillMaster Desktop App for Linux — auction data downloader for WoW under Wine/Lutris/Steam"
arch=('x86_64')
url="https://github.com/exceptionptr/tsm-app-linux"
license=('MIT')
depends=(
    'python>=3.11'
    'pyside6'
    'python-aiohttp'
    'python-pydantic'
    'python-aiosqlite'
    'python-keyring'
    'python-structlog'
    'python-tomli-w'
    'python-yaml'
    # APScheduler 4.x dependencies (available in Arch repos)
    'python-anyio'
    'python-attrs'
    'python-tenacity'
    'python-tzlocal'
    # APScheduler 4.x itself is not yet in Arch repos; bundled in package()
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-vcs'
    'python-pip'
    'git'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5364916b407aab4021810e53fa9e5ad090b1f590dd466a05a757c5a805b13a96')

build() {
    cd "$srcdir/tsm-app-linux-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tsm-app-linux-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Bundle APScheduler 4.x and tzlocal — not yet packaged in Arch official repos
    pip install --ignore-installed --no-deps --prefix=/usr --root="$pkgdir" "apscheduler>=4.0.0a5,<5"
    install -Dm644 packaging/tsm-app.desktop \
        "$pkgdir/usr/share/applications/tsm-app.desktop"
    install -Dm644 tsm/ui/assets/tsm_16.png  "$pkgdir/usr/share/icons/hicolor/16x16/apps/tsm-app.png"
    install -Dm644 tsm/ui/assets/tsm_32.png  "$pkgdir/usr/share/icons/hicolor/32x32/apps/tsm-app.png"
    install -Dm644 tsm/ui/assets/tsm_48.png  "$pkgdir/usr/share/icons/hicolor/48x48/apps/tsm-app.png"
    install -Dm644 tsm/ui/assets/tsm_128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/tsm-app.png"
    install -Dm644 tsm/ui/assets/tsm_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/tsm-app.png"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
