# shellcheck disable=2034

pkgname=jrebel
pkgver=2018.2.4
pkgrel=1
pkgdesc="JRebel is a JVM-plugin that makes it possible for Java developers to instantly see any code change made to an app without redeploying."
url="http://zeroturnaround.com/software/jrebel/"
license=('custom')
arch=('i686' 'x86_64')
provides=('jrebel')
depends=('java-environment')

backup=('etc/profile.d/jrebel.sh'
		'etc/profile.d/jrebel.csh')

install=jrebel.install

_pkgfile="$pkgname-$pkgver-nosetup.zip"
_downloadurl=https:"$(curl "https://zeroturnaround.com/software/jrebel/download/thank-you/?file=$_pkgfile" --silent | grep -o "//dl\\.zeroturnaround\\.com/?token=[a-fA-F0-9]*" | head -n 1)"

source=("$_pkgfile::$_downloadurl"
		"$pkgname.csh"
		"$pkgname.install"
		"$pkgname.sh")

sha256sums=('0e246b4c757e103d8d410563a7673446e9589b938cf6f990a69b7089e8b6509b'
			'7dbc38b6bfc45a037620bd8a21583e00308d53311285c98215b660efdb007431'
			'7616bc4c74f15c49c25c9db78aa0490a2cb88e37fe848c9e866c11ea16d0ad66'
			'd1a5193a071eeedb4d5e96a0eb90aaa4f7daad0cdfbe54ff9c89967c50634635')

package() {
	msg2 "Creating required dirs"
	# shellcheck disable=2154
	mkdir -p "$pkgdir"/{opt/$pkgname,/etc/profile.d,usr/{bin,share/licenses/$pkgname}}

	# shellcheck disable=2154
	cd "$srcdir/$pkgname" || exit

	msg2 "Removing unecessary stuff"
	rm bin/*.cmd

	msg2 "Moving stuff in place"
	mv 3rd-party-licenses-jrebel.txt License.txt readme.txt "$pkgdir/usr/share/licenses/$pkgname/"
	mv ./* "$pkgdir/opt/$pkgname"

	msg2 "Installing scripts"
	cd "$srcdir" || exit
	install -m755 $pkgname.{c,}sh "$pkgdir/etc/profile.d/"
}
