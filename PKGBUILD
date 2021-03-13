# Maintainer Xichen Zhou <xzhou@xeechou.net>

pkgname=taiwins-git
_pkgname=taiwins
pkgrel=1
pkgver=v0.2.0.r0.g5f1f4ea
pkgdesc="Tiling and floating wayland window manager focused on speed and size"
url="https://taiwins.org"
license=('GPL2')
source=("git+https://github.com/${_pkgname}/${_pkgname}#tag=v0.2.0")
md5sums=('SKIP')
arch=('x86_64')

depends=( 'glibc' 'wayland>=1.17' 'libxkbcommon' 'libinput' 'pixman>=0.25.0'
          'libdrm>=2.4.68' 'pam' 'systemd-libs' 'dbus' 'lua>=5.3.0' 'libxcursor'
          'cairo' 'fontconfig' 'freetype2' 'librsvg' 'libgl' 'libegl' 'libgles'
          'wlroots>=0.11.0')

makedepends=('meson' 'ninja' 'git' 'wayland-protocols>=1.18')

pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/${_pkgname}
    git fetch origin --tag
    git submodule update --init --recursive
    if [ ! -d "subprojects/ctypes" ]; then
        meson wrap promote subprojects/twclient/subprojects/ctypes
    fi
    git submodule deinit subprojects/wlroots
    rm -rf subprojects/wlroots
    meson -Dbuildtype=release --prefix /usr build
}

build() {
    cd $srcdir/${_pkgname}
    ninja -C build
}

package() {
    cd $srcdir/${_pkgname}
    DESTDIR=$pkgdir ninja -C build install
    install -Dm644 $srcdir/${_pkgname}/subprojects/twclient/LICENSE "$pkgdir/usr/share/licenses/twclient/LICENSE"
    install -Dm644 $srcdir/${_pkgname}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

#vim: syntax=sh
