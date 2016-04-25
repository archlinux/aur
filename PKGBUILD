# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# This program encrypts/decrypts Caeser, ROT13 and Vigenere ciphers.
# These are classic pre-computer ciphers and while vignere is the most "secure".
# All of them can be easily broken, and none of them are secure. However:

# They are all still widely used for fun, and in contests where a contestant
# with low to moderate skill is expected to crack a code in short order.

# port of redhat package

pkgname=gcipher
pkgver=1.1
pkgrel=2
pkgdesc="Encode/Decode Caeser, Vignere, and ROT13 ciphers"
arch=('any')
url="http://gcipher.sourceforge.net/"
license=('any')
depends=('python2' 'libglade' 'gnome-python')
makedepends=('python2' 'gzip')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('2f55367bd837baa614779ec9b5aca76c8b1f0866bd648b4bd30fe7db15cd3a7b')

prepare() {
  cd "$pkgname-$pkgver"
  local line
  local replace

  # script uses python2, which is not default anymore
  sed -i 's/python/python2/' src/gcipher

  #uncomment the library path designed for installed packages.
  line='# sys.path.append("\/usr\/share\/gcipher\/lib")'
  sed -i "/${line}/ s/# *//" src/gcipher

  # change GLADEDIR. needed if the script is run from a diffrent location than
  # the library
  line='GLADEDIR = "."'
  replace='GLADEDIR = "\/usr\/share\/gcipher\/lib"'
  sed -i "s/${line}/${replace}/" src/Const.py
}

build() {
  cd "$pkgname-$pkgver"
  python2 /usr/lib/python2.7/compileall.py src
  gzip gcipher.1
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p \
    ${pkgdir}/usr/bin \
    ${pkgdir}/usr/share/applications \
    ${pkgdir}/usr/share/man/man1 \
    ${pkgdir}/usr/share/gcipher/lib/cipher \
    ${pkgdir}/usr/share/gcipher/lib/ciphergui \
    ${pkgdir}/usr/share/gcipher/plugins/cipher \
    ${pkgdir}/usr/share/gcipher/plugins/ciphergui
  install -m 644 gcipher.1.gz "${pkgdir}/usr/share/man/man1"

  cd src
  install -m 755 gcipher "${pkgdir}/usr/bin/gcipher"
  install -m 644 gcipher.desktop "${pkgdir}/usr/share/applications/gcipher.desktop"
  install -m 644 *.py *.pyc *.glade "${pkgdir}/usr/share/gcipher/lib"

  cd cipher
  install -m 644 *.py *.pyc "${pkgdir}/usr/share/gcipher/lib/cipher"

  cd ../ciphergui
  install -m 644 *.py *.pyc *.glade "${pkgdir}/usr/share/gcipher/lib/ciphergui"

  cd ../../plugins/cipher
  install -m 644 *.py "${pkgdir}/usr/share/gcipher/plugins/cipher"

  cd ../ciphergui
  install -m 644 *.py "${pkgdir}/usr/share/gcipher/plugins/ciphergui"
}

