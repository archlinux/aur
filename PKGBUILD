# Maintainer: dashy-jngl <you@example.com>
pkgname=stardom-card
pkgver=0.1.2
pkgrel=12
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/stardom-card"
license=('MIT')
depends=(python-requests python-beautifulsoup4 python-wcwidth python-deep-translator)
makedepends=('python-pip' 'python-flit-core')
source=(https://github.com/dashy-jngl/stardom-card/archive/v${pkgver}.tar.gz)
sha512sums=('da4cd2f0ab7ebdb01ed14f61ff971dc68645ee254012d1bb2b97b128e252688c918f38bce812da145dcae85e561ef877c0db8170b5068f6fe499018a0754f70c')

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
