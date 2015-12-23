# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=libdrm-git
_pkgname=libdrm
pkgver=5795.b38a4b2
pkgrel=2
pkgdesc="Userspace interface to kernel DRM services, master git version"
arch=(i686 x86_64)
license=('custom')
depends=('glibc' 'libpciaccess')
makedepends=('valgrind' 'xorg-util-macros')
checkdepends=('cairo' 'cunit')
url="http://dri.freedesktop.org/"
provides=('libdrm=2.4.66')
replaces=('libdrm')
conflicts=('libdrm')

source=('libdrm::git://anongit.freedesktop.org/mesa/drm#branch=master'
        COPYING)
sha256sums=('SKIP'
            '9631d4f694952e3e6ae5a05534c2e93e994e47d3413677a3a00e45c8cef6db93')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${_pkgname}
  
  # pthread is useless in Linux
  sed -i "/pthread-stubs/d" configure.ac
}

build() {
  cd ${_pkgname}
  ./autogen.sh --prefix=/usr --enable-udev
  make
}

check() {
  cd ${_pkgname}
  make -k check
}

package() {
  cd ${_pkgname}
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 ${srcdir}/COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
