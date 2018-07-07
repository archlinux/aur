# Maintainer: lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Porting this to xorg-server 1.20 made possible by : loqs, progandy, regid
# see https://bbs.archlinux.org/viewtopic.php?id=237632

pkgname=xf86-video-sis
pkgver=0.10.9.r7.ga50b2b3
pkgrel=1
pkgdesc="X.org SiS video driver"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'xf86dgaproto' 'git' 'pixman')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
optdepends=('sis-dri: DRI1 support from community repo')
groups=('xorg-drivers')
_commit=a50b2b3412dd8e7f3916acb142c942e85ffcb3e5
source=("git+https://anongit.freedesktop.org/git/xorg/driver/xf86-video-sis.git#commit=$_commit"
        'fix_defines.patch::https://ptpb.pw/2MVt')
sha256sums=('SKIP'
            '8338641b519c25d9a8387608ea562970b4313e7602f890ff0331a0742c3f7f8b')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/^xf86-video-sis.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  patch -Np1 -i ../fix_defines.patch
  autoreconf -vfi
}

build() {
  cd $pkgname
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -Dt  "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/$pkgname/COPYING
}
