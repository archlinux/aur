# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis
pkgver=0.2.1
pkgrel=2
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('i686' 'x86_64')
depends=('glibc')
license=('BSD')
url='https://github.com/flame/blis'
#provides=('blas=3.5.0' 'cblas')
#conflicts=('blas' 'cblas')
options=('!makeflags' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flame/blis/archive/${pkgver}.tar.gz")
md5sums=('85f7fc63ca3dec48d02655ccdb775700')
sha512sums=('a8b0fbbeede584c54548f366ffd2d4cc94fd6b86bd7de7b8cacf59c40acd4349593198f1f8fade739ba39ad21eb2dd2e078aa31491fa9cea5451d160e88d04ff')

prepare() {
# Determine appropriate BLIS kernel for CPU
  cd "${srcdir}/blis-${pkgver}/build/auto-detect"
  _bliskernel="$(./auto-detect.sh)"
  echo "Selected a BLIS kernel for the ${_bliskernel} CPU architecture"

# # Switch on BLAS compatibility and set Fortran name-mangling macros
#   sed -i '/#define BLIS_CONFIG_H/a#define BLIS_ENABLE_BLAS2BLIS\n#define BLIS_BLAS2BLIS_INT_TYPE_SIZE 32\n#define PASTEF770(name)                        name ## _ \n#define PASTEF77(ch1,name)       ch1        ## name ## _ \n#define PASTEF772(ch1,ch2,name)  ch1 ## ch2 ## name ## _' "${srcdir}//blis-${pkgver}/config/${_bliskernel}/bli_config.h"

# # Switch on CBLAS compatibility (always switches on the BLAS compatibility layer)
#   sed -i '/#define PASTEF772(ch1,ch2,name)  ch1 ## ch2 ## name ## _/a#define BLIS_ENABLE_CBLAS' "${srcdir}//blis-${pkgver}/config/${_bliskernel}/bli_config.h"

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
