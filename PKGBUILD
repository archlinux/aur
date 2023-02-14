# Maintainer: gigas002 <gigas002@pm.me>

_pkgname=grub-customizer
pkgname=$_pkgname-git
pkgver=r785.8408d98
pkgrel=1
pkgdesc="A graphical grub2 settings manager (git version)"
arch=('x86_64')
url="git://git.launchpad.net/grub-customizer"
license=(GPL3)
depends=(gcc-libs glibc grub gtkmm3 openssl)
makedepends=(atkmm cairomm cmake glib2 glibmm gtk3 libarchive libsigc++
pangomm)
optdepends=(
  'hwinfo: for additional hardware information'
  'polkit: for authorization'
  'xorg-xhost: for authorization on xorg-xwayland'
)
provides=("$_pkgname")
conflicts=('grub-customizer')
source=("$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -B build
  make VERBOSE=1 -C build
}

package() {
  make install DESTDIR="$pkgdir" -C $srcdir/$_pkgname/build
  # additional documentation
  install -vDm 644 $srcdir/$_pkgname/{changelog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
