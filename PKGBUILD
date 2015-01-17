# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=quassel-light
pkgver=0.11.0
pkgrel=2
pkgdesc="Modern, cross-platform, distributed IRC client; built with few dependencies"
arch=('i686' 'x86_64')
url="http://quassel-irc.org/"
license=('GPL')
depends=('qt5-base')
optdepends=('qca-ossl')
makedepends=('cmake')
provides=('quassel-core' 'quassel-client')
conflicts=('quassel-core' 'quassel-client')
install=quassel.install
backup=(etc/conf.d/quassel)
source=("http://quassel-irc.org/pub/quassel-$pkgver.tar.bz2"
        'quassel.service'
        'quassel.conf')
sha256sums=('99a191b8bc2a410f7020b890ec57e0be49313f539da9f4843675bb108b0f4504'
            '91a1aaae47d41c11aa418dd560039ddbbfb659e02b86379d8c4789c5ada362d3'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8')

build() {
  [[ ! -d build ]] && mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWANT_MONO=OFF \
    -DWITH_KDE=OFF \
    -DWITH_WEBKIT=OFF \
    -DWITH_PHONON=OFF \
    -DWITH_LIBINDICATE=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    ../quassel-${pkgver}/ \
    -Wno-dev

  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 quassel.service "$pkgdir"/usr/lib/systemd/system/quassel.service
  install -Dm644 quassel.conf "$pkgdir"/etc/conf.d/quassel
}
