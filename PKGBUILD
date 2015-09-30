# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=blis
pkgver=0.1.8
pkgrel=3
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('i686' 'x86_64')
license=('BSD')
url=('https://code.google.com/p/blis/')
provides=('blas' 'cblas')
conflicts=('blas' 'cblas')
options=('!makeflags' '!emptydirs')

source=("https://github.com/flame/blis/archive/${pkgver}.zip")
md5sums=('601e61d7b6c68f7efbb66199d79d96bf')
sha512sums=('1ca8829e25a19f62785e2fc4aaaa5980332549b1834dec6ed8a1a0c4f09944afb8fa3c55f1956e46016dfbb267a0ff59ac7ef130e0035704fb6e0580d69f1894')

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
  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libblas.so"
  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libcblas.so"
  printf "# Set blis loop threading environment variables\\n# Please customize for your hardware and application\\n\\nexport BLIS_IR_NT=1\\nexport BLIS_JR_NT=1\\nexport BLIS_IC_NT=1\\nexport BLIS_JC_NT=1" > "${pkgdir}/etc/profile.d/blis.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
