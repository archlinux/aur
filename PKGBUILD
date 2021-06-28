# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=ninja-ide-git
pkgver=20210526
pkgrel=1
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org"
license=('GPL3')
depends=('python-pyqt5' 'qt5-declarative' 'python-pycodestyle' 'python-pyflakes' 'python-jedi')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/ninja-ide/ninja-ide.git#branch=develop"
        "setup.py"
        "MANIFEST.in")
sha256sums=('SKIP'
            '1045011c72b3b192b5919a9625f5b838368d3e492f3c7e569c204b119f74721e'
            '0341af903c8947afaba84555054edf80f1177ad22fc0a17be1c6c9d94536498a')

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
  sed "/Categories/ s/$/Qt;/" -i build_files/$pkgname.desktop

  # Updating external dependencies:

  # Use newer pycodestyle (might break things though)
  sed -e "s/from ninja_ide.dependencies import pycodestyle/import pycodestyle/" \
      -i ninja_ide/gui/editor/checkers/pep8_checker.py
  rm -f  ninja_ide/dependencies/pycodestyle.py

  # Notimportchecker is up to date
  # https://github.com/eamanu/NotImportChecker

  # Use newer pyflakes (again, might break things, may resolve #2088)
  sed -e "s/from ninja_ide.dependencies.pyflakes_mod/from pyflakes/" \
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

  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # This is intended as a safeguard, to realize when many things are missing.
  #cd "$pkgdir/usr/lib/python3.9/site-packages/"
  #find ninja_ide | sed -e '/.cpython.[0-9]*.pyc/d' -e '/__pycache__/d' | sort > /tmp/ninja-ide-packaged-files.txt
  #cd -

  install -Dm755 ninja-ide.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ninja_ide/images/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 build_files/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
