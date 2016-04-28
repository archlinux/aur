# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis
pkgver=0.2.0
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('i686' 'x86_64')
license=('BSD')
url='https://github.com/flame/blis'
#provides=('blas=3.5.0' 'cblas')
#conflicts=('blas' 'cblas')
options=('!makeflags' '!emptydirs')

source=("https://github.com/flame/blis/archive/${pkgver}.zip")
md5sums=('d9886c662ad801c1bf19a29c5f68dada')
sha512sums=('e97f6757004e2154a9920d6570050a02025602a16bd7f53253fcb7cf7681c95e780641298020cee5cb53c0f3e3337a69a023b26cbe526e048011dbb68d6b4c4d')

prepare() {
# Determine appropriate BLIS kernel for CPU
  cd "${srcdir}/blis-${pkgver}/build/auto-detect"
  _bliskernel="$(./auto-detect.sh)"
  echo "Selected a BLIS kernel for the ${_bliskernel} CPU architecture"

# Switch on BLAS compatibility and set Fortran name-mangling macros
  sed -i '/#define BLIS_CONFIG_H/a#define BLIS_ENABLE_BLAS2BLIS\n#define BLIS_BLAS2BLIS_INT_TYPE_SIZE 32\n#define PASTEF770(name)                        name ## _ \n#define PASTEF77(ch1,name)       ch1        ## name ## _ \n#define PASTEF772(ch1,ch2,name)  ch1 ## ch2 ## name ## _' "${srcdir}//blis-${pkgver}/config/${_bliskernel}/bli_config.h"

# Switch on CBLAS compatibility (always switches on the BLAS compatibility layer)
  sed -i '/#define PASTEF772(ch1,ch2,name)  ch1 ## ch2 ## name ## _/a#define BLIS_ENABLE_CBLAS' "${srcdir}//blis-${pkgver}/config/${_bliskernel}/bli_config.h"

}

build() {
  cd "${srcdir}/blis-${pkgver}"
  ./configure -p "${pkgdir}/usr" "${_bliskernel}"
  make  BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

check() {
  cd "${srcdir}/blis-${pkgver}/testsuite"
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
