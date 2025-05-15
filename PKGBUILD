# Maintainer: dashy-jngl <you@example.com>
pkgname=stardom-card
pkgver=0.1.0
pkgrel=5
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/stardom-card"
license=('MIT')
depends=(python-requests python-beautifulsoup4 python-wcwidth python-deep-translator)
makedepends=('python-pip' 'python-flit-core')
source=(https://github.com/dashy-jngl/stardom-card/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')

build() {
  cd "$srcdir/stardom-card-${pkgver}"
  # build a wheel in ./dist
  python -m pip wheel \
    --no-deps \
    --no-build-isolation \
    --wheel-dir dist \
    .
}

package() {
  cd "$srcdir/stardom-card-${pkgver}"

  # 1) Unpack all of the wheel files into $pkgdir/usr
  #    this places stardom_card/ and its .dist-info/ in the right spot
  bsdtar -xf dist/*.whl -C "$pkgdir/usr"

  # 2) Write our own tiny console‐script wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/stardom-card" << 'EOF'
#!/usr/bin/env python3
from stardom_card.cli import main
if __name__ == "__main__":
    main()
EOF
}
