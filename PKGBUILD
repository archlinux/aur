# Maintainer: ahmedmoselhi <ahmedmoselhi55@gmail.com> 

pkgname='grub-customizer5-git'
_pkgname='grub-customizer'
pkgver=5.2.2.r785.8408d98
_pkgver=5.2.2
pkgrel=1
pkgdesc='A tool to choose grub2 bootscreen theme'
arch=('x86_64')
url="https://launchpad.net/grub-customizer"
license=('GPL3')
depends=(gcc-libs glibc grub gtkmm3 openssl)
makedepends=(atkmm cairomm cmake glib2 glibmm gtk3 libarchive libsigc++
pangomm)
optdepends=(
  'hwinfo: for additional hardware information'
  'polkit: for authorization'
  'xorg-xhost: for authorization on xorg-xwayland'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://git.launchpad.net/$_pkgname
              "grub.cfg")
sha256sums=("SKIP"
                       "47c6de7e8f77d843dd79547b6ea34d5f485271cdf86fa3770f67c59359d2e78b")

pkgver() {
  cd ${_pkgname}
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -B build \
        -S $_pkgname
  make VERBOSE=1 -C build
}

package() {
  depends+=(libarchive.so libatkmm-1.6.so libcairomm-1.0.so libgdk-3.so
  libglib-2.0.so libglibmm-2.4.so libgtkmm-3.0.so libpangomm-1.4.so
  libsigc-2.0.so)

  make install DESTDIR="${pkgdir}" -C build
  # configuration
  install -vDm 644 grub.cfg -t "$pkgdir/etc/$_pkgname/"
  # additional documentation
  install -vDm 644 $_pkgname/{changelog,README} -t "$pkgdir/usr/share/doc/$_pkgname/"
}