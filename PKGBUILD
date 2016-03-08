# Contributor: Olivier Mehani <olivier.mehani@nicta.com.au>
pkgname=oml2
_redmineid=1267
pkgver=2.11.1~rc
pkgrel=1
pkgdesc="OML is a measurement library that allows to define measurement points inside applications"
arch=(i686 x86_64)
url="http://oml.mytestbed.net/"
license=('custom:MIT-Nicta')
depends=('libxml2' 'sqlite3' 'popt' 'ruby>=1.8.7' 'postgresql-libs')
makedepends=('git' 'asciidoc')
optdepends=("postgresql: to use as a backend instead of sqlite3")
checkdepends=('check')
provides=(liboml liboml-git oml2)
conflicts=(liboml liboml-git oml2)
replaces=(liboml-git)
source=(
	http://oml.mytestbed.net/attachments/download/${_redmineid}/oml2-${pkgver/\~/}.tar.gz
	oml2-server.conf
	oml2-server.logrotate
	oml2-server.rc
	oml2-server.service
)

backup=(etc/conf.d/oml2-server.conf)
install="oml2.install"

_builddir=${pkgname}-${pkgver/\~/}

build() {
	cd "${srcdir}"
	cd "${srcdir}/${_builddir}"
	./configure --prefix=/usr --localstatedir=/var --enable-doc --disable-doxygen-doc --with-pgsql
	make || return 1
}

package() {
	cd "${srcdir}/${_builddir}"
	make DESTDIR="${pkgdir}/" install
	# XXX: We can only build the example application when we can find everything else
	make -C example/liboml2 \
		BINDIR="${pkgdir}/usr/bin" \
		SCAFFOLD="${pkgdir}/usr/bin/oml2-scaffold" \
		CFLAGS="-I${pkgdir}/usr/include" \
		LDFLAGS="-L${pkgdir}/usr/lib" \
		LIBS="-loml2 -locomm -lpopt -lm" \
		install
	mv ${pkgdir}/usr/bin/generator ${pkgdir}/usr/bin/oml2-generator
	install -D -m 0644 ${srcdir}/${_builddir}/COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/COPYING
	install -D -m 0755 ${startdir}/oml2-server.rc ${pkgdir}/etc/rc.d/oml2-server
	install -D -m 0644 ${startdir}/oml2-server.service ${pkgdir}/usr/lib/systemd/system/oml2-server.service
	install -D -m 0644 ${startdir}/oml2-server.conf ${pkgdir}/etc/conf.d/oml2-server.conf
	install -D -m 0644 ${startdir}/oml2-server.logrotate ${pkgdir}/etc/logrotate.d/oml2-server
}

check() {
	cd "${srcdir}/${_builddir}"
	make check
}
md5sums=('f9fae9569b03b14836f1669838ab31d9'
         '0fcaf350b4c5ac5bc8db2f17de11f9f9'
         '422a04d8bde681e43700d949750f2d99'
         '3d783cf3f03d339d5a1607325ee71b0f'
         '06f39c048d6c3752b167770d991f984c')
