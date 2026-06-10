# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=cmus-auto-lyrics
pkgver=0.3.0
pkgrel=1
pkgdesc="Curses based lyrics display and fetcher for cmus music player"
arch=('any')
url="https://github.com/sparklost/$pkgname"
license=('GPL-3.0-only')
depends=('cmus')
makedepends=('python>=3.12' 'uv' 'git' 'clang' 'patchelf')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export UV_NO_CACHE=1
	
	# setup python 3.14
	if uv python list --only-installed | grep -q '3.14'; then
        echo "Python 3.14 is already installed"
        PY_ALREADY_INSTALLED=true
    else
        uv python install 3.14
        PY_ALREADY_INSTALLED=false
    fi
    
	uv sync --all-groups
}

build() {
	cd "$pkgname"
	uv run build.py --nuitka
	
	# remove python 3.14
	if [ "$PY_ALREADY_INSTALLED" != "true" ]; then
        uv python uninstall 3.14  # Or exact version from 'uv python list'
    fi
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
