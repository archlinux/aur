# Maintainer Xichen Zhou <xzhou@xeechou.net>

pkgname=taiwins-git
_pkgname=taiwins
pkgrel=1
pkgver=v0.2.0.r434.gb98dd4b
pkgdesc="Tiling and floating wayland window manager focused on speed and size"
url="https://taiwins.org"
license=('GPL2')
source=("git+https://github.com/${_pkgname}/${_pkgname}#tag=v0.3"
	"git+https://github.com/${_pkgname}/twclient#tag=v0.2"
	"git+https://github.com/${_pkgname}/twidgets#tag=v0.1"
	"git+https://github.com/xeechou/ctypes#tag=v0.2"
	"git+https://github.com/xeechou/tdbus#tag=v0.1"
	"git+https://github.com/xeechou/love-nuklear#branch=nklua"
	"git+https://github.com/Immediate-Mode-UI/Nuklear#commit=d829ff1"
	"git+https://github.com/nothings/stb#commit=b42009b"
       )
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
arch=('x86_64')

depends=( 'glibc' 'wayland>=1.17' 'libxkbcommon' 'libinput' 'pixman>=0.25.0'
          'libdrm>=2.4.68' 'pam' 'systemd-libs' 'dbus' 'lua>=5.3.0' 'libxcursor'
          'cairo' 'fontconfig' 'freetype2' 'librsvg' 'libgl' 'libegl' 'libgles')

makedepends=('meson' 'ninja' 'git' 'wayland-protocols>=1.18')

pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    cd $srcdir/twclient
    cp -r $srcdir/stb include

    cd $srcdir/twidgets
    rm -rf include/nklua
    rm -rf include/twidgets/nuklear
    cp -r $srcdir/love-nuklear include/nklua
    cp -r $srcdir/Nuklear include/twidgets/nuklear

    cd $srcdir/${_pkgname}
    git submodule init
    cp -r $srcdir/twclient subprojects/
    cp -r $srcdir/twidgets subprojects/
    cp -r $srcdir/ctypes   subprojects/
    cp -r $srcdir/tdbus    subprojects/

    meson --wrap-mode=nodownload -Dbuildtype=release --prefix /usr build
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
