# Maintainer: Adam Brenner <adam@aeb.io>
pkgname=pravega
pkgver=0.12.0
pkgrel=1
pkgdesc='Open source storage system implementing streams serving continuous and unbounded data'
arch=('any')
url='https://github.com/pravega/pravega'
license=('Apache')
makedepends=('java-environment=11')
depends=('java-runtime=11' 'bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "lombok-java-v11.diff::https://github.com/pravega/pravega/commit/8a66db8c9cb34fb9689af1c2eb8978ba831fc985.diff")
sha256sums=('b1122f5fcd0467c9e82a7f7fd2d1be412a1e0f182e0c688ef27875725cf6e974'
            'ade50c91decd8451923c5c5272f321b64330ead2a64b1a4664577971a8b89aff')

prepare() {
  cd ${pkgname}-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/lombok-java-v11.diff"
}

build() {
  cd ${pkgname}-${pkgver}
  ./gradlew distribution
}

package() {

  cd ${pkgname}-${pkgver}
  tar -xzf build/distributions/${pkgname}-${pkgver}.tgz
  cd ${pkgname}-${pkgver}

  for jar in $(ls lib); do
    install -D -m644 lib/${jar} "${pkgdir}/opt/${pkgname}/lib/${jar}"
  done

  for conf in $(ls conf); do
    install -D -m644 conf/${conf} "${pkgdir}/opt/${pkgname}/conf/${conf}"
  done

  for bin in $(ls bin -I "*.bat"); do
    install -D -m755 bin/${bin} "${pkgdir}/opt/${pkgname}/bin/${bin}"
  done

  install -d -m755 pluginlib "${pkgdir}/opt/${pkgname}/pluginlib"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
