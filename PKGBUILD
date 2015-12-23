# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libdrm-git
_pkgname=libdrm
pkgver=5795.b38a4b2
pkgrel=2
pkgdesc="Userspace interface to kernel DRM services, git 32-bit version"
arch=(i686 x86_64)
license=('custom')
depends=('libdrm>=2.4.66' 'lib32-libpciaccess')
makedepends=('gcc-multilib' 'valgrind-multilib' 'xorg-util-macros')
checkdepends=('lib32-cairo' 'lib32-cunit')
url="http://dri.freedesktop.org/"
provides=('lib32-libdrm=2.4.66')
replaces=('lib32-libdrm')
conflicts=('lib32-libdrm')

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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-udev
  make
}

check() {
  cd ${_pkgname}
  make -k check
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ${srcdir}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
