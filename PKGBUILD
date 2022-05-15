# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=amule-daemon-git
pkgver=latest
pkgrel=6
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks (daemon only, development version)'
url='http://www.amule.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('crypto++' 'wxbase' 'boost')
makedepends=('git')
conflicts=('amule')
source=('git+https://github.com/amule-project/amule.git'
        'amuled.service'
        'amuled@.service'
        'amuled.tmpfile')
md5sums=('SKIP'
         '0bb6c56702cd79dc46ff618c4946df33'
         'f2a109a00db1871fcab05dc2ced6a993'
         '70a7fdf6a76e68794635e3f3a9613e26')
install="amule-daemon-git.install"

pkgver() {
  cd "${srcdir}"/amule
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}"/amule
  ./autogen.sh && ./configure \
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
	  --with-boost \
      --with-wx-config=/usr/bin/wx-config
  make
} 

package() {
  cd amule
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/system/amuled@.service"
  install -Dm644 "${srcdir}/amuled.tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/amuled.conf"
  install -dm750 -o129 -g129 "${pkgdir}/var/lib/amule"
  rm -fr "${pkgdir}/usr/share"/{pixmaps,applications}
}

