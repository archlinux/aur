# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=claude-monitor-git
pkgver=r72.f25fe16
pkgrel=1
pkgdesc="A real-time terminal monitoring tool for Claude AI token usage"
arch=('any')
url="https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor"
license=('MIT')
depends=('python>=3.8' 'python-pytz' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('claude-monitor')
conflicts=('claude-monitor')
source=("git+https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor.git"
        "fix-missing-dependency.patch")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    patch -p1 < "$srcdir/fix-missing-dependency.patch"
}

build() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Claude-Code-Usage-Monitor"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
