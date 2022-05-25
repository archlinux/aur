# Guoyi
pkgname=plume-sqlite
_pkgname=plume
pkgver=0.7.2
pkgrel=1
pkgdesc='Federated blogging application'
arch=(x86_64)
url='https://joinplu.me/'
license=(AGPL3)
provides=('plume')
conflicts=('plume-git' 'plume' 'plume-bin' 'plume-postgres')
depends=('gettext' 'openssl' 'pkgconf' 'sqlite')
source=("$pkgname-$pkgver::https://github.com/Plume-org/Plume/releases/download/${pkgver}/plume-sqlite.tar.gz"
	".env.sample"
	"plume.service"
	"plume.sysusers")
md5sums=('c928ee2a9bdd6fa55ecb54917cec442a'
         '939c960f67f2b859b48f96223bd6b74e'
         '545792acab035885a7cd479f43cde695'
         'ebfcfb05844a25ff281317af9b64f8bb')
install="$_pkgname.install"
package() {
	cd $srcdir/bin
	chmod +x *
	
	install -dm755 $pkgdir/usr/bin
	install -dm755 "$pkgdir"/usr/share/webapps/plume/static
	
	install -Dm 755 plm "$pkgdir"/usr/share/webapps/plume/plm
	install -Dm 755 plume "$pkgdir"/usr/share/webapps/plume/plume
	mv "$srcdir"/static/* "$pkgdir"/usr/share/webapps/plume/static
	
	install $srcdir/.env.sample "$pkgdir"/usr/share/webapps/plume/.env.sample

	ln -s /usr/share/webapps/plume/plume $pkgdir/usr/bin/plume
	ln -s /usr/share/webapps/plume/plm $pkgdir/usr/bin/plm

	install -Dm644 "$srcdir/plume.service" "$pkgdir/usr/lib/systemd/system/plume.service"
	install -Dm644 $srcdir/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf

}
