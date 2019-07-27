# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Porting this to xorg-server 1.20 made possible by : loqs, progandy, regid
# see https://bbs.archlinux.org/viewtopic.php?id=237632

pkgname=xf86-video-sis
pkgver=0.11.0
pkgrel=1
pkgdesc="X.org SiS video driver"
arch=('i686' 'x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=24.0' 'xorgproto'  'pixman')
conflicts=('xorg-server<1.20' 'X-ABI-VIDEODRV_VERSION<24' 'X-ABI-VIDEODRV_VERSION>=25')
optdepends=('sis-dri: DRI1 support from community repo')
groups=('xorg-drivers')
# _commit=a50b2b3412dd8e7f3916acb142c942e85ffcb3e5
validpgpkeys=('CDA92E38A7A7A82237E9AB61C922784178BFFDB0')
# The above is the fingerprint for key-id C922784178BFFDB0
# That key has been verified to belong to Kevin Brace, xorg developer
source=(https://xorg.freedesktop.org/archive/individual/driver/$pkgname-$pkgver.tar.bz2{,.sig}
                'fix_defines.patch::https://ptpb.pw/2MVt')
md5sums=('b4ad0e572bffa609f75df787ea7b3d11'
         'SKIP'
         'd607e1ae3d9cc52096769eb55209ebab')
sha512sums=('b8ad05b3faa24c6df65d825b576ddb8e2ce44705ce8b55d8cf0d9f37aa47a429ab43765d8daea57ff35c4cffed056fbec6dfe8ce95efcd6269cc7711115ea09c'
            'SKIP'
            'a3f2653f5937d300afdd8d12e4c73bc0447321c426f30dd0d47171bdc640b5996712342d21a63965ad3a280e89e9d46da2fe807eebaef61665710a6a276aa31e')

# source=("git+https://anongit.freedesktop.org/git/xorg/driver/xf86-video-sis.git#commit=$_commit"
#        'fix_defines.patch::https://ptpb.pw/2MVt')
#sha256sums=(
#            '8338641b519c25d9a8387608ea562970b4313e7602f890ff0331a0742c3f7f8b')

# pkgver() {
#   cd ${pkgname}
#  git describe --long | sed 's/^xf86-video-sis.//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix_defines.patch
  autoreconf -vfi
}

build() {
  cd $pkgname-$pkgver
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dt  "$pkgdir"/usr/share/licenses/$pkgname "$srcdir"/$pkgname-$pkgver/COPYING
}
