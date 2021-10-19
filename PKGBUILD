# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=epydoc
pkgver=3.0.1
pkgrel=5
pkgdesc='Tool for generating API documentation for Python modules, based on their docstrings'
arch=('any')
license=('MIT')
url='https://epydoc.sourceforge.net/'
depends=('python2' 'docutils')
optdepends=('tk: needed for epydocgui'
            'texlive-bin: needed for PDF conversion'
            'graphviz: needed for graph generation')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.zip"
        'handle-docutils-0.6.patch'
        'python26-tokenizer.patch'
        'string-exceptions.patch')
sha256sums=('574c1dca1b0e8783be0121c32f589cf56255cdb288b4d4e52e60f0a8bcf799cb'
            '84d6724e0fcb3a5307963cbe37875e72110bf707781c64e7ddff0dfe96eeb1ab'
            '8bfd54be68ee8e743ab470370042e40130e9cf8c0430d493401fa44eae2d66f6'
            '099a94ba394f0c1c4f3f721fc3c9cf982a54f182be457faa03a7bb54188c8364')

prepare() {
  cd "$pkgname-$pkgver"

  # py2 fix
  sed -i "s|env python|&2|" `grep -Erl "env python" .`

  patch -p1 -i "$srcdir/handle-docutils-0.6.patch"
  patch -p1 -i "$srcdir/python26-tokenizer.patch"
  patch -p1 -i "$srcdir/string-exceptions.patch"
}

build() {
  cd "$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -d "$pkgdir/usr/share/man/man1"
  install -m644 man/*.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2 sw=2 et:
