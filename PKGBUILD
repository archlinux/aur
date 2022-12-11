# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: LIN Ruoshui <lin dot ruohshoei plus archlinux at gmail dot com>
# Contributor: lukpod

pkgname=amule-git
pkgver=2.3.3.r42.e26d06a6e
pkgrel=3
pkgdesc="Client for the eD2k and Kad networks"
arch=(x86_64)
url="https://amule.org/"
license=(GPL2)
depends=(crypto++ geoip libupnp wxwidgets-gtk3 gd)
makedepends=(git boost cmake)
provides=(amule)
conflicts=(amule)
source=("git+https://github.com/amule-project/amule.git"
        #git+https://repo.or.cz/amule.git
        amuled.systemd amuleweb.systemd amule.sysusers amule.tmpfiles)
sha256sums=('SKIP'
            '20ac6b60c5f3bf49c0b080dfc02409da3c9d01b154344188008c6a75ca69681e'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2'
            'c4ca658ab4105b3b90e0bb3efcc8121eca1c4d873787db1ed4f637925c16d502'
            'e9d1b7019c7075b0f8616c6507a767b87de8f899936680e9ff5829d8cbba224d')

pkgver() {
  cd amule
  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cmake -B build -S amule \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_ALC=ON \
    -DBUILD_ALCC=ON \
    -DBUILD_AMULECMD=ON \
    -DBUILD_CAS=ON \
    -DBUILD_DAEMON=ON \
    -DBUILD_REMOTEGUI=ON \
    -DBUILD_WEBSERVER=ON \
    -DBUILD_WXCAS=ON \
    -DBUILD_FILEVIEW=ON \
    -DENABLE_NLS=ON
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir"/amuled.systemd "$pkgdir"/usr/lib/systemd/system/amuled.service
  install -Dm644 "$srcdir"/amuleweb.systemd "$pkgdir"/usr/lib/systemd/system/amuleweb.service
  install -Dm644 "$srcdir"/amule.sysusers "$pkgdir"/usr/lib/sysusers.d/amule.conf
  install -Dm644 "$srcdir"/amule.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/amule.conf
}
