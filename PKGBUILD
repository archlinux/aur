# Maintainer: LIN Ruoshui <lin dot ruohshoei plus archlinux at gmail dot com>
# Contributor: lukpod

pkgname=amule-git
pkgver=2.3.2.r64.20afd75fa
pkgrel=1
pkgdesc="Client for the eD2k and Kad networks"
arch=('x86_64')
url=http://amule.org/
license=(GPL2)
depends=(boost-libs crypto++ geoip libupnp wxgtk2 gd boost-libs)
makedepends=(git ccache boost)
conflicts=(amule)
source=(
git+https://github.com/amule-project/amule.git
#git+https://repo.or.cz/amule.git
amuled.systemd amuleweb.systemd amule.sysusers amule.tmpfiles
)
sha256sums=('SKIP'
            '20ac6b60c5f3bf49c0b080dfc02409da3c9d01b154344188008c6a75ca69681e'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2'
            'c4ca658ab4105b3b90e0bb3efcc8121eca1c4d873787db1ed4f637925c16d502'
            'e9d1b7019c7075b0f8616c6507a767b87de8f899936680e9ff5829d8cbba224d')

pkgver() {
  cd amule/
  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd amule/
  ./autogen.sh
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-geoip \
              --enable-upnp \
              --enable-fileview \
              --with-boost
  make
}

check() {
  make -C amule/ check
}

package() {
  cd amule
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/amuled.systemd "$pkgdir"/usr/lib/systemd/system/amuled.service
  install -Dm644 "$srcdir"/amuleweb.systemd "$pkgdir"/usr/lib/systemd/system/amuleweb.service
  install -Dm644 "$srcdir"/amule.sysusers "$pkgdir"/usr/lib/sysusers.d/amule.conf
  install -Dm644 "$srcdir"/amule.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/amule.conf
}
