# Maintainer: BlueDrink9 <bluedrink9+aur@gmail.com>
# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=('autokey-git')
pkgver=0.96.0.r0.fbcc72b
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
  'dbus-python'
  'gtksourceview3'
  'gvfs'
  'kdialog'
  'libappindicator-gtk3'
  'libnotify'
  'python-cairo'
  'python-gobject'
  'python-pyhamcrest'
  'python-pyinotify'
  'python-qscintilla-qt5'
  'python-xlib'
  'qt5ct'
  'wmctrl'
  'xapp'
  'xfconf'
  'zenity'
)
makedepends=(
  'coreutils'
  'git'
  'python-setuptools'
  'sed'
)
optdepends=(
  'gnome-themes-extra'
  'gtk-engine-murrine'
  'nvidia-utils'
)
source=(
  'git+https://github.com/autokey/autokey.git#branch=master
'
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

  # copying sample user scripts
  echo -e "${prefix}${prefix}Copying sample user scripts"
  [ -d lib/autokey/configmanager/predefined_user_scripts ] && cp -r lib/autokey/configmanager/predefined_user_scripts build/lib/autokey/configmanager/

  # [FIXME - is this still necessary? ] remove shebang from python libraries
  #for lib in $(find lib/autokey/ -name "*.py"); do
  #  sed '/\/usr\/bin\/env/d' $lib > $lib.new &&
  #  touch -r $lib $lib.new &&
  #  mv $lib.new $lib
  #done
}

package() {
  cd "$pkgname2" || return
  echo -e "${prefix}Packaging AutoKey"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir/" --optimize=1 --skip build
}
