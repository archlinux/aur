# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis
pkgver=0.5.1
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
depends=('glibc')
url='https://github.com/flame/blis'
options=('!makeflags' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flame/blis/archive/${pkgver}.tar.gz" fpic.patch blis_profile.sh)
sha512sums=('15e8596783900e7430c5fedf5acfa4620a6cb0017905013e000df2bf708db6177cc2939f0299eb960d784add23a8195cbd69cd2450e7980272c5c65d3d360739'
            'e9b7558a8c703570089ba1923d03444ec0a63c9d10cc8931dc9a19a0faa5553eecbae5af9ca4923f425259173fc7958e852c6ef9c9375f83b5d21c4634e088b5'
            'cb53fa1f8c540062d4d55b4b91c787a821c563ea0bdb4e37f1db08869c320132a493e6b55f5d876418d56ad5b4f1dc5553f871862418393614e160dd1329ec9e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fpic.patch
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -fPIC" ./configure -p "${pkgdir}"/usr auto
  make
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
