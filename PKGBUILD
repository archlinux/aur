# Archtrack maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Thanx <thanxm@gmail.com>
pkgname=exploit-db-git
gitname="exploit-database"
pkgver=1128.8290029ac
pkgrel=1
pkgdesc="The Exploit Database (EDB) an ultimate archive of exploits and vulnerable software - A collection of hacks"
url="https://github.com/offensive-security/exploit-database"
license=("custom")
arch=('any')
depends=('bash' 'wget' 'grep' 'sed' 'tar' 'git')
provides=('exploit-db')
conflicts=('exploit-db')
options=('!strip')
source=("git+https://github.com/offensive-security/${gitname}.git")
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${gitname}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}


package() {
	# The script
	#install -Dm755 $srcdir/exploit-db.sh $pkgdir/usr/bin/exploit-db

	# The database
	chmod -R 644 "$srcdir/${gitname}"
	chmod -R a+X "$srcdir/${gitname}"
	install -dm 755 "$pkgdir/usr/share"
	install -dm 755 "$pkgdir/usr/bin"
	cp -dr --no-preserve=ownership "$srcdir/${gitname}" "$pkgdir/usr/share/exploit-db"
	sed -i 's/\/opt\/exploit-database/\/usr\/share\/exploit-db/' "$pkgdir/usr/share/exploit-db/searchsploit"
	chmod -R a+x "$pkgdir/usr/share/exploit-db/searchsploit"
	ln -s "/usr/share/exploit-db/searchsploit" "${pkgdir}/usr/bin/searchsploit"
}
