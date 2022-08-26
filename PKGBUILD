# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Dragutin Cirkovic <dragonmen@gmail.com>
# Contributor: heinrich5991 <heinrich5991@gmail.com>
pkgname=srs
pkgver=4.0_r2
pkgrel=1
pkgdesc="High performance realtime video server"
_pkgcommit=fe2002794f83f1947176ca157190d83c84761dc5
arch=('x86_64')
url="https://github.com/ossrs/srs"
license=('MIT')
depends=('gcc-libs'
         'openssl'
         'srs-state-threads')
makedepends=('zlib' 'unzip' 'net-tools' 'python' 'git')
backup=(etc/srs/srs.conf)
options=('docs')
source=("git+https://github.com/ossrs/srs/#commit=${_pkgcommit}"
        "archlinux.patch")
sha256sums=('SKIP'
            '01af4fc5b393fe4c590215a8449ab10e7aefe1e377962ca35405baaa2ed43a90')

prepare() {
  cd "${srcdir}"/srs/trunk
  patch -p2 -i "${srcdir}"/archlinux.patch
}

build() {
  cd "${srcdir}"/srs/trunk
  ./configure --prefix=/install --use-sys-ssl --use-shared-st
  make
  make DESTDIR="${srcdir}" install
}

package() {
  install -Dm644 "${srcdir}"/srs/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}"/install
  install -d "${pkgdir}"/usr/bin "${pkgdir}"/etc/srs
  cp -r conf/. "${pkgdir}"/etc/srs
  install -m755 objs/srs "${pkgdir}"/usr/bin/srs
}
