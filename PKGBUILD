# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net> 
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=5.1.0
pkgrel=2
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes (32 bit)"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=("http://www.wavpack.com/${_pkgname}-${pkgver}.tar.bz2"
        CVE-2018-6767.patch::"https://github.com/dbry/WavPack/commit/d5bf76b5.patch"
        CVE-2018-7253.patch::"https://github.com/dbry/WavPack/commit/36a24c78.patch"
        CVE-2018-7254.patch::"https://github.com/dbry/WavPack/commit/8e3fe45a.patch")
md5sums=('7f06272651f0c2292c1d0ba353386782'
         '73473ca1044a727f5a026079d8dc4fe6'
         '528eeaa0a5e27c96ef4cfafe58d7303f'
         'ba6c3487f8a55268c8eb3f1680935ddd')

prepare() {
  cd $_pkgname-$pkgver
# Fix security issues
  patch -p1 -i ../CVE-2018-6767.patch
  patch -p1 -i ../CVE-2018-7253.patch
  patch -p1 -i ../CVE-2018-7254.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
    --disable-asm \
    --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  cd "$pkgdir/usr"
  rm -rf {bin,include,share/man}/
}
