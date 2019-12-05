# Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Porting this to xorg-server 1.20 made possible by : loqs, progandy, regid
# see https://bbs.archlinux.org/viewtopic.php?id=237632

pkgname=xf86-video-sis
pkgver=0.12.0
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
source=(https://x.org/archive/individual/driver/$pkgname-$pkgver.tar.bz2{,.sig}
                'fix_defines.patch::https://ptpb.pw/2MVt')
md5sums=('b8ec9c21758043b1480f11baec296f5d'
         'SKIP'
         '21e11e901c326c572e058ce3a29b945a')
sha512sums=('5aa101e5217f15667f2c94f7a76f4afcf47717b61f5d206ce65efe35dc3f674ca294f98ca8586971c6467f31decdd94d8255ebfc7dc220fac0179afc61995952'
            'SKIP'
            'db0122d541b6f9416469ab42e88958792f987803254fc3b98593f9fceddbf35ae083dc16ec22c1cf876da5d600a33949978e247723f7aa091da2559670df2b85')

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
