# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=libvmi-git
pkgver=0.10.r804.g69b3198
pkgrel=1
pkgdesc='LibVMI is a virtual machine introspection library'
url='http://libvmi.com'
arch=('any')
license=('GPL')
makedepends=('automake' 'autoconf' 'libtool' 'bison' 'flex')
depends=('json-c')
optdepends=('libvirt: required for KVM/libvirt usage')
provides=('libvmi')
conflicts=('libvmi')
source=("${pkgname}::git+https://github.com/libvmi/libvmi.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Create build env
  ./autogen.sh

  # Create Makefiles
  ./configure --prefix=/usr --disable-xen

  # Enable debugging output
  # sed -i -r 's/\/\/(#define VMI_DEBUG.*)/\1/' libvmi/debug.h
}

build() {
  # Build the config files / headers first (cant parallel build these)
  cd "${srcdir}/${pkgname}/libvmi/config"
  make -j1

  # Make all
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir/" install
  install -DTm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # Copy header files into package (not sure why stuff like libvmi/events.h isn't installed by default)
  cp ${srcdir}/${pkgname}/libvmi/*.h ${pkgdir}/usr/include/libvmi/
}
