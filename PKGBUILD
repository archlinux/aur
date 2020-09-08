# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore
pkgver=4.0.0
pkgrel=1
pkgdesc="An easy to use web platform for writing scalable web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
depends=('curl' 'openssl' 'postgresql-libs' 'python>=3.6')
provides=('kore')
source=("https://kore.io/releases/kore-${pkgver}.tar.gz")
sha256sums=('c4f5629c9fca7ede7664063a318021f58c7909cbff822dad8dca88da7d9043c2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  set +e
  # XXX Fatal Error while compiling Python support. But success when compiling again.
  PREFIX=/usr ACME=1 CURL=1 TASKS=1 PGSQL=1 JSONRPC=1 PYTHON=1 make || true
  set -e
  PREFIX=/usr ACME=1 CURL=1 TASKS=1 PGSQL=1 JSONRPC=1 PYTHON=1 make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  install -dm755 "${pkgdir}/usr/share/doc/kore/"
  install -m644 conf/kore.conf.example "${pkgdir}/usr/share/doc/kore/"
  install -m644 README.md "${pkgdir}/usr/share/doc/kore/"
  cp -r examples "${pkgdir}/usr/share/doc/kore/examples/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
