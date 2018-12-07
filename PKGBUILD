# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor : Eric Engestrom <eric@engestrom.ch>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libdrm-git
pkgver=2.4.96.r9.gb28b8237
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, git 32-bit version"
arch=(i686 x86_64)
license=('custom')
depends=('libdrm-git' 'lib32-libpciaccess')
makedepends=('gcc-multilib' 'meson')
checkdepends=('lib32-cairo')
url="http://dri.freedesktop.org/"
provides=('lib32-libdrm')
conflicts=('lib32-libdrm')

source=('libdrm::git://anongit.freedesktop.org/mesa/drm#branch=master'
        COPYING)
sha256sums=('SKIP'
            '9631d4f694952e3e6ae5a05534c2e93e994e47d3413677a3a00e45c8cef6db93')

          
pkgver() {
    cd libdrm
    git describe --long --abbrev=8 | sed 's/^libdrm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/pkg-config-32
    if [  -d _build ]; then
        rm -rf _build
    fi
    meson setup libdrm _build \
        --prefix /usr \
        --libdir lib32 \
        --buildtype plain \
        --wrap-mode      nofallback \
        -D udev=true
    ninja -C _build
}

check() {
  meson test -C _build
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install
  
  # remove files already provided by libdrm-git
  rm -rf "$pkgdir"/usr/{include,share,bin}
  
  install -Dt "$pkgdir/usr/share/licenses/$pkgname"  -m644 COPYING
}
