# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=libdrm-git
_pkgname=libdrm
pkgver=2.4.73.r9.g1924b67
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, master git version"
arch=(i686 x86_64)
license=('custom')
depends=('glibc' 'libpciaccess')
makedepends=('valgrind' 'xorg-util-macros')
checkdepends=('cairo' 'cunit')
url="http://dri.freedesktop.org/"
provides=('libdrm')
replaces=('libdrm')
conflicts=('libdrm')

source=('libdrm::git://anongit.freedesktop.org/mesa/drm#branch=master'
        COPYING)
sha512sums=('SKIP'
            'b0ca349b882a4326b19f81f22804fabdb6fb7aef31cdc7b16b0a7ae191bfbb50c7daddb2fc4e6c33f1136af06d060a273de36f6f3412ea326f16fa4309fda660')

pkgver() {
    cd "${srcdir}/${_pkgname}"
#    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    git describe --long | sed 's/^libdrm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
