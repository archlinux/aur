# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cqrlogo-git
pkgver=0.5.5.r1.gb2bc264
pkgrel=1
pkgdesc='CGI QR-Code logo for web services - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/cqrlogo'
depends=('iniparser' 'libpng' 'qrencode')
makedepends=('fcgi' 'git' 'discount')
optdepends=('apache: for apache web server inclusion'
            'fcgi: for FastCGI version'
            'lighttpd: for lighttpd web server inclusion'
            'mod_fastcgi: for fastcgi in apache web server'
            'mod_fcgid: for fastcgi in apache web server')
conflicts=('cqrlogo')
provides=('cqrlogo')
checkdepends=('zbar' 'pngcheck')
license=('GPL')
install=cqrlogo.install
backup=('etc/cqrlogo.conf'
	'etc/httpd/conf/extra/cqrlogo.conf'
	'etc/lighttpd/conf.d/cqrlogo.conf')
source=('git+https://github.com/eworm-de/cqrlogo.git')
sha256sums=('SKIP')

pkgver() {
	cd cqrlogo/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd cqrlogo/

	make
}

check() {
	cd cqrlogo/

	make check
}

package() {
	cd cqrlogo/

	make DESTDIR="${pkgdir}" install
}

