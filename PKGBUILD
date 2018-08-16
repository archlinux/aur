# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>

# Build options (yes/no/default)
_large_network=default
_pcre=default
_perl=default
_contrib=default
_cracklib=default
_ldap=default

pkgname=xtheme
pkgver=8.0.0
pkgrel=1
pkgdesc="A fork of the atheme IRC services"
arch=("i686" "x86_64")
url="http://www.xtheme.org/Xtheme/"
license=('MIT')
depends=('bash')
conflicts=('libmowgli' 'atheme')
optdepends=(
	'pcre: for pcre support'
	'perl: for Perl support'
	'cracklib: cracklib support in NickServ'
	'libldap: LDAP support'
)
backup=(
	'etc/xtheme/xtheme.conf'
	'etc/xtheme/xtheme.motd'
)
install=xtheme.install
source=(
	"https://github.com/XthemeOrg/Xtheme/releases/download/$pkgver/Xtheme-$pkgver.tar.bz2"
	"system.service"
)
md5sums=(
	"5ce6c772cf3f061424ab699d60148b77"
	"SKIP"
)

build() {
	cd "Xtheme-$pkgver"
	
	_configure="./configure --prefix=/usr --enable-fhs-paths"
	_configure+=" --sysconfdir=/etc/xtheme --localstatedir=/var"
	
	[[ $_large_network = yes ]] && _configure+=" --enable-large-net"
	[[ $_contrib = yes ]]       && _configure+=" --enable-contrib"
	
	[[ $_pcre = yes ]] && _configure+=" --with-pcre"
	[[ $_pcre = no ]]  && _configure+=" --without-pcre"
	

	[[ $_pcre = yes ]] && _configure+=" --with-pcre"
	[[ $_pcre = no ]]  && _configure+=" --without-pcre"

	eval $_configure	
	make
}

package() {
	cd "Xtheme-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/xtheme.service"
	
	cd "$pkgdir"
	rm -r var
	install -dm755 -o142 -g142 var/lib/xtheme/
	
	chmod 0755 etc/xtheme/
	chmod 0644 etc/xtheme/*
	install -dm755 usr/share/doc/xtheme/config/
	mv etc/xtheme/xtheme.conf.example etc/xtheme/xtheme.conf
	mv etc/xtheme/xtheme.conf.operserv-example usr/share/doc/xtheme/config/
	mv etc/xtheme/xtheme.conf.userserv-example usr/share/doc/xtheme/config/
	mv etc/xtheme/xtheme.motd.example etc/xtheme/xtheme.motd
	rm etc/xtheme/xtheme.cron.example
}
