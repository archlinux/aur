# $Id$
# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=apache25
pkgver=2.5.r27203.e4f56ef
pkgrel=2
pkgdesc='A high performance Unix-based HTTP server'
arch=('i686' 'x86_64')
url='http://www.apache.org/dist/httpd'
provides=('apache=2.5')
conflicts=('apache')
license=('APACHE')
backup=(etc/httpd/conf/httpd.conf)
depends=('zlib' 'apr-util' 'pcre' 'systemd')
makedepends=('openssl' 'python2')
install=httpd.install
source=(
	httpd::git://git.apache.org/httpd.git
	arch.layout
	http://www.apache.org/dist/apr/apr-1.5.2.tar.bz2
	http://www.apache.org/dist/apr/apr-util-1.5.4.tar.bz2
	httpd.conf
	httpd.usr.conf
	modules.conf.in
	httpd.logrotate
	httpd.service
	httpd.socket
	httpd.tmpfiles
	httpd.install
)
sha256sums=(
	'SKIP'
	'dda05c6e76f12624e418ca18a36f2e90ec1c5b1cc52fed7142fce6076ec413f3'
	'7d03ed29c22a7152be45b8e50431063736df9e1daa1ddf93f6a547ba7a28f67a'
	'a6cf327189ca0df2fb9d5633d7326c460fe2b61684745fd7963e79a6dd0dc82e'
	'ecda7f08c45bbbce59c11b611493eb673743585c39824bb3a963b184e86a008c'
	'570cf1255c14c4d8420ac9bc20c66756690a1e651627b6e7fe1f8f47c7edde10'
	'53f36ac9834e34a2295cfa1e19dd28be0fa2178dc60c4fd2bc245e86d4e3f9c7'
	'875903831634edf35d8d57e9a51bacb818255ecb3bfff29627f03e43d1ab65c3'
	'46010e22039717894d074d32130ff98dc0517d51380bf0938d465d586af292be'
	'f4c967641f8889c02f96c46ac1925aac4cc9282a576f118ac5681c46ff957840'
	'26ab348276659fdf8bafbf15e1e9e78ff0ee64527694d02acf40d3aa74b91338'
	'e0f9c4e836490c182149604614208ffa977e6e18f81c27bab60ae1b8418b5cd5'
)

pkgver() {
	cd "httpd"
	printf "2.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd httpd

	cp "${srcdir}/modules.conf.in" docs/conf/httpd.conf.in
	cat "${srcdir}/arch.layout" >> config.layout

	rm -f srclib/apr
	ln -s "${srcdir}/apr-1.5.2" srclib/apr
	rm -f srclib/apr-util
	ln -s "${srcdir}/apr-util-1.5.4" srclib/apr-util

	sed -i '1 s/python/python2/' srclib/apr/build/gen-build.py
	sed -i 's/python/python2/g' srclib/apr/build/buildcheck.sh
}

build() {
	cd httpd

	./buildconf

	./configure --sbindir=/usr/bin \
		--enable-layout=Arch \
		--enable-mpms-shared=all \
		--enable-modules=all \
		--enable-mods-shared=all \
		--enable-so \
		--disable-authn-core \
		--disable-authn-anon \
		--disable-authn-dbd \
		--disable-authn-dbm \
		--disable-authn-file \
		--disable-authn-socache \
		--disable-authnz-ldap \
		--enable-authz-core \
		--disable-authz-dbd \
		--disable-authz-dbm \
		--disable-authz-groupfile \
		--disable-authz-host \
		--disable-authz-owner \
		--disable-authz-user \
		--disable-ldap \
		--disable-lua \
		--disable-proxy-html \
		--disable-xml2enc \
		--with-apr=/usr/bin/apr-1-config \
		--with-apr-util=/usr/bin/apu-1-config \
		--with-pcre=/usr

	make
}

package() {
	cd httpd

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/etc/httpd/conf" "${pkgdir}/usr/lib/httpd/conf"
	mv "${pkgdir}/usr/lib/httpd/conf/httpd.conf" "${pkgdir}/usr/lib/httpd/conf/modules.conf"

	sed -e 's/#LoadModule systemd_module/LoadModule systemd_module/' \
		-e 's/#LoadModule journald_module/LoadModule journald_module/' \
		-i ${pkgdir}/usr/lib/httpd/conf/modules.conf

	install -D -m644 "${srcdir}/httpd.conf" "${pkgdir}/etc/httpd/conf/httpd.conf"
	install -D -m644 "${srcdir}/httpd.logrotate" "${pkgdir}/etc/logrotate.d/httpd"
	install -D -m644 "${srcdir}/httpd.usr.conf" "${pkgdir}/usr/lib/httpd/conf/httpd.conf"
	install -D -m644 "${srcdir}/httpd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/httpd.conf"
	install -D -m644 "${srcdir}/httpd.socket" "${pkgdir}/usr/lib/systemd/system/httpd.socket"
	install -D -m644 "${srcdir}/httpd.service" "${pkgdir}/usr/lib/systemd/system/httpd.service"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# cleanup
	rm -r "${pkgdir}/usr/share/httpd/manual"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/srv"
	rm -r "${pkgdir}/run"
}