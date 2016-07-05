# Package build for homegear from git (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Sven Klomp <mail at klomp dot eu>
# Contributor: Michael Lipp <mnl at mnl dot de>

pkgdesc='Homegear home automation software'
_gitname=('homegear')
pkgname=('homegear-git')
pkgver=0.6.1245.6150f26
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/Homegear/homegear"
depends=('libhomegear-base-git>=0.6.0' 'termcap' 'openssl' 'libxml2' 'enchant' 'gnutls' 'libmcrypt' 'sqlite')
makedepends=('gcc-libs' 'git' 'gnutls>=3.3.0' 'libgpg-error>=1.14' 'libhomegear-base-git>=0.6.0' 'readline>=6.2' 'sqlite>=3.7.13' 'libxml2>=2.8.0' 'lzo>=2.0.6' 'php7-homegear' 'termcap' 'enchant')
conflicts=('homegear')
provides=('homegear=0.6.0')
source=("git+https://github.com/Homegear/homegear"
	'homegear.service'
        'homegear.logrotate')
md5sums=('SKIP'
         'e208eff7459ed6ac965c9f3ed64a4619'
         '57e41d66f3f80d9e8e3caa665dd5e788')

pkgver() {
	cd "$srcdir"/${_gitname}
	echo "0.6.$(git rev-list --count HEAD).$(git describe --always)"
}

backup=(etc/homegear/{main,mqtt,rpcclients,rpcservers}.conf
	etc/homegear/php.ini
	etc/homegear/families/miscellaneous.conf
	etc/logrotate.d/homegear)

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"
	rm -Rf autom4te.cache
	./bootstrap || exit 1
	
	# Remove qdbm dependency
	sed -i 's/-lqdbm//g' src/Makefile.am
	
	./configure --with-php=/usr --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib || exit 1
	make || exit 1
	strip -s homegear-miscellaneous/src/.libs/mod_miscellaneous.so
	strip -s src/homegear
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir/" install	

	mkdir -p "${pkgdir}/etc/logrotate.d"
        cp "${srcdir}/homegear.logrotate" "${pkgdir}/etc/logrotate.d/homegear"
        chown root:root "${pkgdir}/etc/logrotate.d/homegear"
        chmod 644 "${pkgdir}/etc/logrotate.d/homegear"

	mkdir -p "${pkgdir}/usr/lib/systemd/system"
        cp "${srcdir}/homegear.service" "${pkgdir}/usr/lib/systemd/system"
        chmod 644 "${pkgdir}/usr/lib/systemd/system/homegear.service"
        
        
	mkdir -p $pkgdir/etc
	cp -r "${srcdir}/${_gitname}/misc/Config Directory" $pkgdir/etc/homegear

}
