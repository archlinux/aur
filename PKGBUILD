# Maintainer: David Raymond <raymond at kestrel dot nmt dot edu>
# Contributor: Alex Suykov <axs at ukr dot net>
# Contributor: Frank Thieme <frank at fthieme dot net>
pkgname=lprng
pkgver=3.8.C
pkgrel=9
pkgdesc="An Enhanced Printer Spooler"
arch=('i686' 'x86_64')
url="http://www.lprng.com"
license=('custom:Artistic')
depends=(openssl bash)
optdepends=(
	'poppler: pdf to ps conversion in filters'
	'enscript: text to ps conversion in filters'
	'ghostscript: convert ps to device language'
	'foomatic-filters-lprng: foomatic-rip'
	'hplip: drivers for HP printers'

)
conflicts=(cups)
source=(http://sourceforge.net/projects/lprng/files/lprng/lprng-3.8.C.tar.gz
	 lpd.service
	 gsfilter
	 psfilter
	 foofilter
	 printcap_remote
	 printcap_server
	 README
	 lpd.conf
	 lpd.perms
	 lprng.install)

install=lprng.install

build() {
	cd "$srcdir/lprng-$pkgver"

	./configure --prefix=/usr --sysconfdir=/etc/lprng --localstatedir=/var\
	--mandir=/usr/share/man --libexecdir=/usr/lib/lprng\
	--with-userid=daemon --with-groupid=lp\
	--enable-ssl --sbindir=/usr/bin
	make
}

package() {
	  cd "$srcdir/lprng-$pkgver"

	  make MAKEPACKAGE=YES DESTDIR="$pkgdir/" install

	  install -d "${pkgdir}/usr/lib/systemd/system/"
	  install -d "${pkgdir}/usr/share/doc/lprng/"
	  install -d "${pkgdir}/etc/lprng/lpd/"
	  install -D -m 0644 "${srcdir}/lpd.service" \
	  	  "${pkgdir}/usr/lib/systemd/system/"
	  install -D -m 0644 COPYRIGHT \
	  	  "${pkgdir}/usr/share/licenses/lprng/COPYRIGHT"
	  install -D -m 0755 "${srcdir}/foofilter" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0755 "${srcdir}/gsfilter" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0755 "${srcdir}/psfilter" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0644 "${srcdir}/printcap_remote" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0644 "${srcdir}/printcap_server" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0644 "${srcdir}/README" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0644 "${srcdir}/lpd.conf" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
	  install -D -m 0644 "${srcdir}/lpd.perms" \
	  	  "${pkgdir}/usr/share/doc/lprng/"
}

md5sums=('5901bed95e61d2bea3ba3056056af432'
         '990745083e4f627a714569dc20816b0a'
         'ac43a39395da12fb039a25b71d57e6ea'
         '58a4bf1a740b67fea83f7f68336f20e7'
         '58afc1a1ec8d67a1aa2bdd64788d5213'
         '496dfbb160f2a0308b7847541b03c8db'
         '422ad79bda6ae9d2990fdef55240e569'
         '1768d2f81d6d14c22686293ca60528c1'
         '3ef9f91dc0de273da1f5f1b20d49cd17'
         '3f861c75c2d68c0e45b4095ab39ba1c8'
         '0f21b173ae0f16d225b4519e0f3238ff')
