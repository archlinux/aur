# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis
pkgver=0.3.0
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
depends=('glibc')
license=('custom:BSD')
url='https://github.com/flame/blis'
#provides=('blas=3.5.0' 'cblas')
#conflicts=('blas' 'cblas')
options=('!makeflags' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flame/blis/archive/${pkgver}.tar.gz" fpic.patch)
sha512sums=('cc78694bca8f2738b6d7c7b79c792486274157ee22c01c16d40efb9e4cd91a67abcca138cb6a0be9e1c9310cb7f645b9a00bb843fa9ce4e227e6d8e583c35daf'
            'e9b7558a8c703570089ba1923d03444ec0a63c9d10cc8931dc9a19a0faa5553eecbae5af9ca4923f425259173fc7958e852c6ef9c9375f83b5d21c4634e088b5')

prepare() {
  cd blis-${pkgver}
  patch -Np1 < "$srcdir"/fpic.patch
}

build() {
  cd blis-${pkgver}
  CFLAGS+=" -fPIC" ./configure -p "${pkgdir}"/usr x86_64
  make  BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

check() {
  cd blis-${pkgver}/testsuite
  make
  ./test_libblis.x
}

package() {
  mkdir -p "${pkgdir}/etc/profile.d"
  cd "${srcdir}/blis-${pkgver}"
  make install BLIS_ENABLE_DYNAMIC_BUILD:=yes
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libblas.so"
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libcblas.so"
  printf "# Set blis loop threading environment variables\\n# Please customize for your hardware and application\\n\\nexport BLIS_IR_NT=1\\nexport BLIS_JR_NT=1\\nexport BLIS_IC_NT=1\\nexport BLIS_JC_NT=1" > "${pkgdir}/etc/profile.d/blis.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
