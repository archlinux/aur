# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>
# Contributor: Jordy van Wolferen <jordy at kluisip dot nl>

_pkgname=xf86-video-qxl
pkgname=$_pkgname-git
pkgver=0.1.5.16.g52c421c
pkgrel=1
pkgdesc='X Window System QXL driver including Xspice server'
arch=('i686' 'x86_64')
url='https://www.spice-space.org'
license=('MIT')
#depends=('xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto' 'videoproto' 'resourceproto' 'scrnsaverproto' 'spice')
depends=('spice')
optdepends=('python: Xspice server')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=25.2' 'spice-protocol' 'libcacard')
provides=('xf86-video-qxl')
conflicts=('xf86-video-qxl' 'X-ABI-VIDEODRV_VERSION<25' 'X-ABI-VIDEODRV_VERSION>=26')
source=("git+https://gitlab.freedesktop.org/xorg/driver/$_pkgname.git"
       fix-build-against-current-x-server.diff)
sha256sums=('SKIP'
            a5e4292d3a6bc9641a8d4ec4d9eb92094ee3d20581c590051e878c8829b9a035)

pkgver() {
    cd $_pkgname
    git describe --always | sed 's/xf86-video-qxl.//;s/-/./g'
}

prepare() {
    cd $_pkgname
    patch -p1 < ../fix-build-against-current-x-server.diff
}

build() {
    cd $_pkgname

    # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
    # With them, module fail to load with undefined symbol.
    # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
    export CFLAGS=${CFLAGS/-fno-plt}
    export CXXFLAGS=${CXXFLAGS/-fno-plt}
    export LDFLAGS=${LDFLAGS/,-z,now}

    ./autogen.sh --prefix=/usr --enable-xspice=yes
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
