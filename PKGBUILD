# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=('autokey-git')
pkgver=0.95.10.r18.4b87b32
pkgrel=1
pkgdesc='A desktop automation utility for Linux and X11 - GTK & Qt frontends'
arch=('x86_64')
url='https://github.com/autokey/autokey'
license=('GPL3')
provides=(
  'autokey'
  'autokey-gtk'
  'autokey-qt'
)
conflicts=(
  'autokey-common'
  'autokey-gtk'
  'autokey-qt'
)
depends=(
  'gtksourceview3'
  'kdialog'
  'libappindicator-gtk3'
  'libnotify'
  'python'
  'python-gobject'
  'python-pyqt5'
  'python-qscintilla-qt5'
  'qt5-svg'
  'zenity'
)
makedepends=(
  'python-pyqt5'
  'python-setuptools'
)
optdepends=(
  'python-atspi'
  'qt-at-spi'
)
source=(
  "git+https://github.com/autokey/autokey"
)
sha512sums=(
  'SKIP'
)
pkgname2="${pkgname/-git/}"
stop='\e[m'
color="\e[33m"
bold='\e[1m'
prefix=" ${bold}${color}==>$stop "



pkgver() {
  cd "$pkgname2" || return
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$pkgname2" || return
}

build() {
  cd "$pkgname2" || return
  echo -e "${prefix}Building AutoKey"

  python setup.py build
  # remove shebang from python libraries
  for lib in $(find lib/autokey/ -name "*.py"); do
    sed '/\/usr\/bin\/env/d' $lib > $lib.new &&
    touch -r $lib $lib.new &&
    mv $lib.new $lib
  done
}

package() {
  cd "$pkgname2" || return
  echo -e "${prefix}Packaging AutoKey"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir/" --optimize=1 --skip build
}
