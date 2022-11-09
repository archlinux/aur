# Maintainer           : Arnaud Dovi <mr.dovi@gmail.com>
# Contributor          : SharkEzz <icraft640@gmail.com>
# Contributor          : Nikola Milinković <nikmil@gmail.com>

# WITH_KNOTIFICATION = 0 -> Default notifier is use simply qt5
# WITH_KNOTIFICATION = 1 -> Enable the Plasma/knotifications support notifier
WITH_KNOTIFICATION=0

# WITH_DARK_ICON = 0 -> Default icons
# WITH_DARK_ICON = 1 -> Replace the green icon by a dark one (dark themes support)
WITH_DARK_ICON=1

pkgname=octopi-git
pkgver=0.14.0.r4.2db10e3b
pkgrel=1
pkgdesc="This is Octopi, a powerful Pacman frontend using Qt libs"
arch=('x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
depends=(
  'alpm_octopi_utils-git'
  'pkgfile'
  'qtermwidget'
  'sudo'
)
makedepends=(
  'git'
  'qt5-base'
  'qt5-tools'
)
provides=(
  'octopi'
  'octopi-cachecleaner'
  'octopi-helper'
  'octopi-notifier'
  'octopi-repoeditor'
  'octopi-sudo'
)
conflicts=(
  'octopi'
  'octopi-cachecleaner'
  'octopi-helper'
  'octopi-notifier'
  'octopi-repoeditor'
  'octopi-sudo'
  'octopi-dev'
  'octopi-kde-git'
  'octopi-notifier-frameworks'
  'octopi-notifier-qt5'
  'octopi-notifier-noknotify'
)
#install=octopi.install
source=(
  'git+https://github.com/aarnt/octopi.git'
  'octopi_dark.png'
)
sha256sums=('SKIP'
            '49aa640be835eb9ccf216f44a2d86aba3b39bf349e62b855192096526883cdc0')

pkgver() {
  cd "${pkgname/-git/}" || exit
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname/-git/}" || exit
  [[ "$WITH_KNOTIFICATION" == "1" ]] && sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier.pro
  if [[ "$WITH_DARK_ICON" -eq "1" ]]; then
    cp resources/images/octopi_green.png resources/images/octopi_green.bak.png
    cp "${srcdir}/octopi_dark.png" resources/images/octopi_green.png
  fi
  cp resources/images/octopi_green.png resources/images/octopi.png
  # https://github.com/aarnt/octopi/commit/2250904a902fca96ea16adf463400fbda913aa70
  #patch --forward --strip=2 --input="${srcdir}/2250904a902fca96ea16adf463400fbda913aa70.patch"
}

build() {
  cd "${pkgname/-git/}" || exit
  echo "Starting build..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi.pro
  make

  _subdirs="cachecleaner helper notifier repoeditor sudo"

  for _subdir in $_subdirs; do
    pushd $_subdir
    echo "Building octopi-$_subdir..."
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "octopi-$_subdir.pro"
    make
    popd
  done
}

package() {
  cd "${pkgname/-git/}" || exit
  make INSTALL_ROOT="${pkgdir}" install

  _subdirs="cachecleaner helper notifier repoeditor sudo"

  for _subdir in $_subdirs; do
    pushd $_subdir
    make INSTALL_ROOT="${pkgdir}" install
    popd
  done
}
