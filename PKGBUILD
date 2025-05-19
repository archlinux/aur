# Maintainer: dashy-jngl <you@example.com>
pkgname=stardom-card
pkgver=0.1.1
pkgrel=9
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/stardom-card"
license=('MIT')
depends=(python-requests python-beautifulsoup4 python-wcwidth python-deep-translator)
makedepends=('python-pip' 'python-flit-core')
source=(https://github.com/dashy-jngl/stardom-card/archive/v${pkgver}.tar.gz)
sha512sums=('b3a6f95bf2bb558bb4f2a5e2e88ce1b95c12d9d81559a552c7bd19ee28293c7779fedc5350cd6840a54b08c44c28e802ce8fca292fdbbebd5cf323e8a7c90d66')

build() {
  cd "$srcdir/stardom-card-${pkgver}"
  python -m pip wheel \
    --no-deps \
    --no-build-isolation \
    --wheel-dir dist \
    .
}

package() {
  cd "$srcdir/stardom-card-${pkgver}"

  local libpath
  libpath="$(python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

  install -d "$pkgdir/$libpath"

  bsdtar -xf dist/*.whl -C "$pkgdir/$libpath"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/stardom-card" << 'EOF'
#!/usr/bin/env python3
from stardom_card.cli import main
if __name__ == "__main__":
    main()
EOF
}
