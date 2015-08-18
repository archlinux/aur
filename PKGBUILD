# Maintainer: S Leduc <sebastien@sleduc.fr>
# Contributor: r20d20 <r20d20@web.de>

pkgname=mediatomb-git
pkgver=7ab7616
pkgver() {
  cd mediatomb
  git describe --always | sed 's|-|.|g'
}
pkgrel=1
pkgdesc="Free UPnP/DLNA media server mediatomb"
arch=(i686 x86_64)
url="http://www.mediatomb.cc"
license=('GPL')
depends=('curl' 'ffmpegthumbnailer' 'file' 'js185' 'libexif' 'libmariadbclient' 'sqlite3' 'taglib')
makedepends=('autoconf>=2.61')
conflicts=('mediatomb')
provides=('mediatomb')
backup=('etc/conf.d/mediatomb')
source=('git://mediatomb.git.sourceforge.net/gitroot/mediatomb/mediatomb'
        'mediatomb.install'
        'mediatomb.service'
        'mediatomb.conf')
install=mediatomb.install
sha256sums=('SKIP'
            'a0f9801cd910a574b701359e80906a1d2040b5bc64b6c0510639de2460f2ab6c'
            '62dfa849f8b93af55ef9fe33af8f588113031094e98f29f0daac645caf93db3c'
            'c9b43dfa23e58e8c104421733cafa5f441c280db3ede3ee9bfb9bf6a7ade6d8c')

build() {
	cd mediatomb

	autoreconf -i
	./configure --prefix=/usr \
		--enable-libmagic \
		--enable-libjs \
		--enable-ffmpeg

	make
}

package() {
	cd mediatomb
	make DESTDIR="${pkgdir}/" install

	install -D --mode=0311 "${srcdir}/mediatomb.conf" "${pkgdir}/etc/conf.d/mediatomb"
	install -D --mode=0311 "${srcdir}/mediatomb.service" "${pkgdir}/usr/lib/systemd/system/mediatomb.service"
}
