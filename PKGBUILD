# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=ncursesfm-git
_gitname=ncursesFM
pkgver=v3.1.r37.gd823532
pkgrel=2
pkgdesc="A FileManager written in c and ncurses library."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('ncurses' 'libconfig' 'libarchive' 'glibc' 'libcups' 'systemd' 'libnotify')
optdepends=('xdg-utils: xdg-open support'
            'udisks2: mountable drives and ISO mount support'
            'packagekit: package installation support'
            'upower: AC (dis)connection events support')
# libcups and libnotify are optional build dep.
# If compiled without them, the program will run just fine;
# but that would disable desktop notifications and printing support.
makedepends=('git' 'bash-completion' 'cmake')
source=("git://github.com/FedeDP/${_gitname}.git")
backup=('etc/default/ncursesFM.conf')
install=ncursesFM.install
sha256sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_gitname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}/build"
    cmake \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DENABLE_CUPS=true \
        -DENABLE_NOTIFY=true \
        ..
    make
}

package() {
    cd "${srcdir}/${_gitname}/build"
    make DESTDIR="$pkgdir" install
}
