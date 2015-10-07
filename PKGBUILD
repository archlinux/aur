# Maintainer: fuhd
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
pkgname=amule-dlp-git
pkgver=2.3.1.r107.fdf4e47
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch"
arch=('i686' 'x86_64')
url="https://github.com/persmule/amule-dlp"
license=('GPL')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
conflicts=('amule' 'amule-dlp' 'amule-dlp-hg')
makedepends=(git)
optdepends=('antileech')
install=amule.install
provides=('amule' 'amule-dlp')
source=("$pkgname::git://github.com/persmule/amule-dlp.git"
        'amuled.systemd'
        'amuleweb.systemd')
sha256sums=('SKIP'
            '527a2cca6d56b8269722aafc77a89734f59a929f946f342bd0f69b256f9c7522'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "2.3.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

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
              --with-wxversion=2.8

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR=${pkgdir} install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
