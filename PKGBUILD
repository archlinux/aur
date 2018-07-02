# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis
pkgver=0.3.2
pkgrel=2
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
url='https://github.com/flame/blis'
options=('!makeflags' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flame/blis/archive/${pkgver}.tar.gz" fpic.patch blis_profile.sh)
sha512sums=('f7a0d495260e42d70520ffb71a28d4aaad3dd365cd5305964e9d8631b537aae84eb3f838ccc0d0f566c81d3ffbbd24c2b56ed653e5c42809e4b4a8e7c352c630'
            'e9b7558a8c703570089ba1923d03444ec0a63c9d10cc8931dc9a19a0faa5553eecbae5af9ca4923f425259173fc7958e852c6ef9c9375f83b5d21c4634e088b5'
            'cb53fa1f8c540062d4d55b4b91c787a821c563ea0bdb4e37f1db08869c320132a493e6b55f5d876418d56ad5b4f1dc5553f871862418393614e160dd1329ec9e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fpic.patch
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -fPIC" ./configure -p "${pkgdir}"/usr x86_64
  make  BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

check() {
  cd blis-${pkgver}/testsuite
  make
  ./test_libblis.x
}

package() {
  install -d "$pkgdir"/etc/profile.d
  cd $pkgname-$pkgver
  make install BLIS_ENABLE_DYNAMIC_BUILD:=yes
  install -Dm755 "$srcdir"/blis_profile.sh "${pkgdir}"/etc/profile.d/blis.sh
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
