# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Ansgar Taflinski <ataflinski at uni-koblenz dot de>
# Contributor: Jordy van Wolferen <jordy at kluisip dot nl>

_pkgname=xf86-video-qxl
pkgname=$_pkgname-git
pkgver=0.1.4.7.ge765cc5
pkgrel=1
pkgdesc='X Window System QXL driver including Xspice server'
arch=('i686' 'x86_64')
url='http://www.spice-space.org'
license=('custom')
depends=('xf86dgaproto' 'xproto' 'fontsproto' 'randrproto' 'renderproto'
         'videoproto' 'resourceproto' 'scrnsaverproto' 'spice')
optdepends=('python2: Xspice server')
# xf86-video-qxl can't be built against spice-protocol 0.12.8 due to a bug,
# see http://lists.freedesktop.org/archives/spice-devel/2015-July/020860.html
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=19'
             'spice-protocol<0.12.8')
provides=('xf86-video-qxl')
conflicts=('xf86-video-qxl' 'X-ABI-VIDEODRV_VERSION<19' 'X-ABI-VIDEODRV_VERSION>=20')
source=('git://anongit.freedesktop.org/xorg/driver/xf86-video-qxl'
        'fix-cast.patch')
sha256sums=('SKIP'
            '575243334f763c21282eccd7bd4eb713b90e96fdd46a882370925fa20d4acb70')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's/xf86-video-qxl.//;s/-/./g'
}

prepare() {
    cd $_pkgname
    patch -p1 < ${srcdir}/fix-cast.patch
    sed -i '1c #!/usr/bin/python2' scripts/Xspice
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr --enable-xspice=yes
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
    install -D -m644 $srcdir/$_pkgname/COPYING \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
