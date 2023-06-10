# Maintainer: Paulo Matias <matias ufscar br>
# Maintainer: éclairevoyant

pkgname=netlistsvg-git
pkgver=1.0.2.r10.g752549e
pkgrel=1
pkgdesc="Draws an SVG schematic from a yosys JSON netlist"
url="https://github.com/nturley/netlistsvg"
arch=(any)
license=(MIT)
depends=(nodejs)
makedepends=(git npm)
source=(git+https://github.com/nturley/netlistsvg.git)
b2sums=(SKIP)

pkgver() {
  cd netlistsvg
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd netlistsvg
  npm install -g --prefix "${pkgdir}/usr" git+file://"$(pwd)"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
