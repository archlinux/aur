# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=ninja-ide-git
pkgver=20190207
pkgrel=4
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org"
license=('GPL3')
depends=('python-pyqt5' 'qt5-declarative' 'python-pycodestyle' 'python-pyflakes')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
options=('emptydirs') # for font dir
source=("git+https://github.com/ninja-ide/ninja-ide.git"
        "setup.py"
        "MANIFEST.in")
md5sums=('SKIP'
         'c4dbf95e76d6507e3c087cc6cdaf64b0'
         'e8fd6b8243172d576d032c26d9140285')

pkgver() {
  cd ninja-ide
  git log -1 --date=short --pretty=format:%ad | sed 's/-//g'
}

prepare() {
  cd ninja-ide

  ln -sf $srcdir/setup.py
  ln -sf $srcdir/MANIFEST.in

  # fix desktop file
  sed "/MimeType/d" -i build_files/$pkgname.desktop
  echo "MimeType=text/x-python;" >> build_files/$pkgname.desktop

  # Work around not being prepared for python 3.8
  # sed -e "s/_ast.Num/_ast.Constant/" \
  #     -e "s/_ast.Str/_ast.Constant/" \
  #     -i ninja_ide/tools/introspection.py
  # Alternative - can we instead of _ast just use ast,
  # which still has this code for backwards compatibility (for a while)?
  sed -e "/_map_type/,/def _parse_assign/ s/_ast/ast/" \
      -i ninja_ide/tools/introspection.py

  # Updating external dependencies:

  # Use newer pycodestyle (might break things though)
  sed -e "s/from ninja_ide.dependencies import pycodestyle/import pycodestyle/" \
      -i ninja_ide/gui/editor/checkers/pep8_checker.py
  rm -f  ninja_ide/dependencies/pycodestyle.py

  # Notimportchecker is up to date
  # https://github.com/eamanu/NotImportChecker

  # Use newer pyflakes (again, might break things, may resolve #2088)
  sed -e "s/from ninja_ide.dependencies.pyflakes_mod import checker/from pyflakes import checker/" \
      -i ninja_ide/gui/editor/checkers/errors_checker.py
  rm -rf ninja_ide/dependencies/pyflakes_mod/
}

build () {
  cd ninja-ide

  python3 setup.py clean
  python3 setup.py build
}

check() {
  cd ninja-ide

  ./run-tests.py
}

package() {
  cd ninja-ide

  #find ninja_ide | sed -e '/.cpython.[0-9]*.pyc/d' -e '/__pycache__/d' | sort > /tmp/ninja-ide-repository-files.txt

  python3 setup.py install --root="$pkgdir" --skip-build -O1

  # This is intended as a safeguard, to realize, when many things are missing
  #cd "$pkgdir/usr/lib/python3.9/site-packages/"
  #find ninja_ide | sed -e '/.cpython.[0-9]*.pyc/d' -e '/__pycache__/d' | sort > /tmp/ninja-ide-packaged-files.txt
  #cd -

  # Do that here instead of earlier, as the links are converted to text files otherwise
  ln -s grammar37.txt "$pkgdir"/usr/lib/python3.9/site-packages/ninja_ide/intellisensei/parso/python/grammar38.txt
  ln -s grammar38.txt "$pkgdir"/usr/lib/python3.9/site-packages/ninja_ide/intellisensei/parso/python/grammar39.txt

  # The fonts are now not anymore packaged, but the directory is required
  install -dm755 "$pkgdir"/usr/lib/python3.9/site-packages/ninja_ide/fonts
  install -Dm755 ninja-ide.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ninja_ide/images/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 build_files/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
