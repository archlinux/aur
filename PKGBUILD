# Maintainer: centi_07 <centi07 at proton dot me>
# based on lib32=libdrm-git by
# Yurii Kolesnykov <root at yurikoles dot com>
#
# Send PRs here: https://github.com/centi07/arch-ps4-aur
#
pkgname=lib32-libdrm-ps4
pkgver=2.4.114.r2.ge699b28b
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, git 32-bit version"
arch=(x86_64)
license=('custom')
depends=('libdrm-ps4' 'lib32-libpciaccess' 'lib32-gcc-libs')
makedepends=('python-docutils' 'meson' 'git' 'ninja')
checkdepends=('lib32-cairo')
url="http://dri.freedesktop.org/"
provides=('lib32-libdrm')
conflicts=('lib32-libdrm')

source=('libdrm::git+https://gitlab.freedesktop.org/mesa/drm.git'
        COPYING
        'libdrm-2.4.120.patch')
sha256sums=('SKIP'
            '9631d4f694952e3e6ae5a05534c2e93e994e47d3413677a3a00e45c8cef6db93'
            'SKIP')

          
pkgver() {
    cd libdrm
    git describe --long --tags --abbrev=8 | sed 's/^libdrm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    if [  -d _build ]; then
        rm -rf _build
    fi
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config
    meson setup libdrm _build \
        --prefix /usr \
        --libdir lib32 \
        --buildtype plain \
        --wrap-mode      nofallback \
        -D udev=false \
        -D valgrind=disabled
    meson configure --no-pager _build
    ninja -C _build
}

check() {
   # '-t 10' is needed for the 'threaded' test, which uses the default meson
   # test timeout of 30 seconds. This is too short for many systems. It can be
   # removed if upstream fixes the issue.
    meson test -C _build -t 10
}

package() {
    DESTDIR="$pkgdir" ninja -C _build install
  
    # remove files already provided by libdrm-git
    rm -rf "$pkgdir"/usr/{include,share,bin}
  
    install -Dt "$pkgdir/usr/share/licenses/$pkgname"  -m644 COPYING
}
