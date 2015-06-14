pkgname=jrebel
pkgver=6.2.0
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
_downloadurl=https:$(curl "https://zeroturnaround.com/software/jrebel/download/thank-you/?file=$_pkgfile" --silent | grep -o "//dl\.zeroturnaround\.com/?token=[a-fA-F0-9]*" | head -n 1)

source=("$_pkgfile::$_downloadurl"
        "$pkgname.sh"
        "$pkgname.csh")

md5sums=('b0d0c4b7751c4b763b89227cbcd6de6e'
         '3acd6fe2b66cc18c74d15fff985bac33'
         '4f7cfc0ab796d6de2da1c650247fe3d1')

package() {
  msg2 "Creating required dirs"
  mkdir -p "$pkgdir"/{opt/$pkgname,/etc/profile.d,usr/{bin,share/licenses/$pkgname}}

  cd "$srcdir/$pkgname"

  msg2 "Removing unecessary stuff"
  rm bin/*.cmd

  msg2 "Moving stuff in place"
  mv 3rd-party-licenses-jrebel.txt License.txt License-until-2013.txt readme.txt "$pkgdir/usr/share/licenses/$pkgname/"
  mv * "$pkgdir/opt/$pkgname"

  msg2 "Installing scripts"
  cd "$srcdir"
  install -m755 $pkgname.{c,}sh "$pkgdir/etc/profile.d/"
}
