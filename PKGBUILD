# Maintainer: fuhd
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
pkgname=amule-dlp-git-patch
pkgver=2.3.1.r381.4c904e5
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch"
arch=('i686' 'x86_64')
url="https://github.com/persmule/amule-dlp"
license=('GPL')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
conflicts=('amule' 'amule-dlp' 'amule-dlp-hg' 'amule-dlp-git')
makedepends=(git)
optdepends=('antileech')
install=amule.install
provides=('amule' 'amule-dlp')
source=("git+https://github.com/persmule/amule-dlp.git#commit=4c904e5e94ed9909dbf18423c82605d6f9abc5ec"
        'amuled.systemd'
        'amuleweb.systemd')
sha256sums=('SKIP'
            '527a2cca6d56b8269722aafc77a89734f59a929f946f342bd0f69b256f9c7522'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2')

pkgver() {
  cd "${srcdir}/amule-dlp"
  printf "2.3.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}/amule-dlp"
  cp src/aMule.xpm amule.xpm
}

build() {
  cd "${srcdir}/amule-dlp"

  ./autogen.sh
  ./configure \
	  --prefix=/usr \
	  --mandir=/usr/share/man \
	  --disable-debug \
	  --enable-amule-daemon \
	  --enable-amulecmd \
	  --enable-amule-gui \
	  --enable-webserver \
	  --enable-cas \
	  --enable-wxcas \
	  --enable-alc \
	  --enable-alcc \
	  --enable-geoip \
	  --enable-upnp \
	  --with-denoise-level=3 \
	  --enable-nls \
	  --enable-optimize \
	  --enable-mmap \
	  --enable-ccache \
	  --with-wxversion=2.8

  make -j`cat /proc/cpuinfo |grep "processor"|wc -l`
}

package() {
  cd "${srcdir}/amule-dlp"

  make DESTDIR=${pkgdir} install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
