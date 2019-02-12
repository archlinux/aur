# Contributor: Joel Schaerer <joel.schaerer@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=textext
_pkgname=TexText
pkgver=0.9.1
pkgrel=3
pkgdesc="An inkscape extension which lets you add LaTeX equations to your drawings"
arch=('any')
license=('custom:BSD')
url="https://github.com/textext/textext"
depends=('inkscape' 'texlive-core' 'python2')
optdepends=('pdf2svg' 'pygtk' 'imagemagick6')
source=("$pkgname-$pkgver.tar.gz::https://github.com/textext/textext/releases/download/$pkgver/${_pkgname}-Linux-$pkgver.tar.gz"
        "0001-Fix-Issue-111-Write-log-file-to-user-writable-dir.patch")

sha256sums=('5c48544b4c51547792909ba89fd27432b58bfb26d9d9c3131ab65ec809d8198b'
            '3fc97197fc55a7de3df3ec35955802156a9c9ead07f48fe821792c11f4dcfeab')

prepare() {
    cd "$pkgname-$pkgver"
    dos2unix "$srcdir/$pkgname-$pkgver/extension/textext/__init__.py"
    patch -l -p1 < "$srcdir/0001-Fix-Issue-111-Write-log-file-to-user-writable-dir.patch"
}

package() {
  install -d "$pkgdir"/usr/share/inkscape/extensions
  cd $pkgname-$pkgver/extension
  cp -r $pkgname "$pkgdir"/usr/share/inkscape/extensions
  install -m644 $pkgname.inx "$pkgdir"/usr/share/inkscape/extensions/
  cd ..
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  cd "$pkgdir"/usr/share/inkscape/extensions/$pkgname
  sed -i '1s+\#!/usr/bin/env python+\#!/usr/bin/env python2+' __init__.py typesetter.py
}

