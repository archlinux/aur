# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=ninja-ide-git
pkgver=20190207
pkgrel=2
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org"
license=('GPL3')
depends=('python' 'python-pyqt5' 'qt5-declarative')
makedepends=('python-setuptools')
source=("git+https://github.com/ninja-ide/ninja-ide.git"
        "setup.py"
        "MANIFEST.in")
md5sums=('SKIP'
         '9f9a5b9894d192de503bc98969067f56'
         'e8fd6b8243172d576d032c26d9140285')

pkgver() {
  cd ninja-ide
  git log -1 --date=short --pretty=format:%ad | sed 's/-//g'
}

prepare() {
  cd ninja-ide

  ln -sf $srcdir/setup.py
  ln -sf $srcdir/MANIFEST.in

  rm -rf ninja_tests ninja_profiling

  # Work around not being prepared for python 3.8
  sed -e "s/_ast.Num/_ast.Constant/" \
      -e "/_ast.Str/ s/^/#/" \
      -i ninja_ide/tools/introspection.py
  ln -s grammar37.txt \
    ninja_ide/intellisensei/parso/python/grammar38.txt
}

build () {
  cd ninja-ide

  python3 setup.py clean --all
  python3 setup.py build
}

package() {
  cd ninja-ide

  python3 setup.py install --root="$pkgdir" --skip-build -O1

  install -Dm755 ninja-ide.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ninja_ide/images/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 build_files/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
