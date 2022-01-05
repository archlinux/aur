# Maintainer: TJM <tommy.mairo@gmail.com>
# Contributor: Yijian Chen <dastudiodirector@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
pkgname=amule-dlp-git
pkgver=2.3.3.r10607.78a95e54e
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch"
arch=('i686' 'x86_64')
url="https://github.com/persmule/amule-dlp"
license=('GPL')
depends=('wxgtk2' 'gd' 'geoip' 'libupnp' 'crypto++>=6.0.0' 'libsm' 'boost-libs')
conflicts=('amule' 'amule-dlp' 'amule-dlp-hg')
makedepends=('git' 'boost')
optdepends=('antileech')
install=amule.install
provides=('amule' 'amule-dlp')
source=("git+https://github.com/persmule/amule-dlp.git"
        'amuled.systemd'
		'amuleweb.systemd'
		'0001-allow-to-build-with-autoconf-2.70-and-later.patch')
sha256sums=('SKIP'
            '6dbdd1ad1c3c3d8637b8f4cbd5416f39c8e4277a2f8498577b08bf6cda8dbca9'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2'
            '78b0021d878a8985d87c5f00caa7a1165b9bdf92880a2e3a197db429a7eb6dd8')

pkgver() {
  cd "${srcdir}/amule-dlp"
  printf "%s.r%s.%s" "$(grep -Po '(?<=set \(PACKAGE_VERSION ").+(?="\))' ./CMakeLists.txt)" \
					"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}/amule-dlp"
  cp src/aMule.xpm amule.xpm
  patch -p1 < ../0001-allow-to-build-with-autoconf-2.70-and-later.patch
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
	  --with-boost \
	  --with-wxversion=3.0

  make 
}

package() {
  cd "${srcdir}/amule-dlp"

  make DESTDIR=${pkgdir} install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
}
