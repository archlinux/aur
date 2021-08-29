# Maintainer: Andrea Scarpino <andrea at archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>

pkgname=python2-markdown
_pkgbasename=Markdown
pkgver=3.1.1
pkgrel=6
pkgdesc="Python implementation of John Gruber's Markdown."
arch=('any')
url='https://python-markdown.github.io/'
license=('BSD')
depends=('python2' 'python2-setuptools')
checkdepends=('python2-yaml')
source=("https://files.pythonhosted.org/packages/source/M/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz")
sha256sums=('2e50876bcdd74517e7b71f3e7a76102050edec255b3983403f1a63e7c8a41e7a')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  python2 -m unittest discover tests
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=0
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/python2-markdown/LICENSE"

  # Fix conflict with python-markdown
  mv "${pkgdir}"/usr/bin/markdown_py{,2}
}

check_python2-markdown() {
  [[ $(python2 -c "import markdown; print(markdown.version)") == "$pkgver" ]]
  [[ $(python2 -c "import markdown; print(markdown.markdown('*test*'))") == "<p><em>test</em></p>" ]]
}
