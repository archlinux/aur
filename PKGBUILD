# Maintainer: Joshua Haase <hahj87@gmail.com>
# Contributor: Jonas Weber <contact@jonasw.de>
# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>

pkgname=gpp
pkgver=2.28
pkgrel=4
pkgdesc="A general-purpose preprocessor with customizable syntax, suitable for a wide range of preprocessing tasks"
arch=('x86_64' 'i686' 'armv7' 'mips64el')
url="https://logological.org/gpp"
license=('LGPL-2.1-or-later' 'FSFAP' 'GPL-2.0-or-later' 'X11')
depends=('glibc')
source=(
  "gpp::git+https://github.com/logological/gpp.git#tag=$pkgver"
  "expected_output.txt"
  "input_file.gpp"
)
sha256sums=('b75e2a19d22fa8cbc2649edb99fc0f57fac1b3e990fd775f1fd123c35b63c7da'
            '5b19c6214d45454d937f7a115967fd769f5438185319b176f9f7e98558bda736'
            'b5cbd0a32fafa5792bdcda80b6156b3339629836c7bda6ae6a7c0a21e3805bf2')
# you can get the public key from: http://common.nothingisreal.com/w/images/1/13/EFBF4915.txt
validpgpkeys=("28F47A15AB82C216D278DEB92B119C3AEFBF4915")

build() {
  cd "$srcdir/$pkgname"
  aclocal \
  && autoheader \
  && automake --add-missing \
  && autoconf \
  && ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER"
  make DESTDIR="$pkgdir/" install
}

check(){
  diff <(gpp input_file.gpp) <(cat expected_output.txt) || true
}
