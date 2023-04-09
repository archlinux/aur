# Maintainer: Paulo Matias <matias ufscar br>
pkgname=netlistsvg-git
pkgver=1.0.2.r9.g1e187a7
pkgrel=1
pkgdesc="draws an SVG schematic from a yosys JSON netlist"
url="https://github.com/nturley/netlistsvg"
arch=(any)
license=(MIT)
depends=(nodejs npm)
source=(git+https://github.com/nturley/netlistsvg.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/netlistsvg"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/netlistsvg"
  npm install -g --prefix "${pkgdir}/usr" git+file://"$(pwd)"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
