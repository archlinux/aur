# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=amule-daemon-git
pkgver=head
pkgrel=2
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks (daemon only, development version)'
url='http://www.amule.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('crypto++' 'wxbase>=2.8')
makedepends=('git')
conflicts=('amule')
source=('git+git://repo.or.cz/amule.git'
        'amuled.service'
        'amuled@.service'
        'amuled.tmpfile')
md5sums=('SKIP'
         '402d2249ec2fc6d61c85af8a817e2981'
         '253895ed04947fa95ca8fcaee9aeee10'
         '70a7fdf6a76e68794635e3f3a9613e26')
install="amule-daemon-git.install"

pkgver() {
  cd "${SRCDEST}/amule"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/amule"
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-monolithic \
      --enable-amule-daemon \
      --enable-amulecmd \
      --disable-webserver \
      --disable-amule-gui \
      --disable-cas \
      --disable-wxcas \
      --enable-ed2k \
      --disable-alc \
      --enable-alcc \
      --disable-xas \
      --disable-fileview \
      --disable-plasmamule \
      --disable-static \
      --disable-kde-in-home \
      --disable-geoip \
      --disable-upnp \
      --disable-debug \
      --disable-profile \
      --enable-optimize \
      --enable-mmap \
      --disable-nls \
      --disable-ccache \
      --with-wx-config=/usr/bin/wx-config
  make
} 

package() {
  cd "${srcdir}/amule"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/system/amuled@.service"
  install -Dm644 "${srcdir}/amuled.tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/amuled.conf"
  install -dm750 -o129 -g129 "${pkgdir}/var/lib/amule"
  rm -fr "${pkgdir}/usr/share"/{pixmaps,applications}
}

