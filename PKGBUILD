# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis-git
pkgver=0.2.2.124.g99dee87f
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('python2')
url='https://github.com/flame/blis'
#provides=('blas=3.5.0' 'cblas')
#conflicts=('blas' 'cblas')
options=('!makeflags' '!emptydirs')
source=("git+https://github.com/flame/blis.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|tr - .) 
}

prepare() {
# Determine appropriate BLIS kernel for CPU
  cd "${pkgname%-git}/build/auto-detect"
  _bliskernel="$(./auto-detect.sh)"
  cd ..
  sed -i '1s+python$+python2+' flatten-headers.py
}

build() {
  cd "${pkgname%-git}"
  ./configure -p "${pkgdir}/usr" "${_bliskernel}"
  make BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

check() {
  cd "${pkgname%-git}"/testsuite
  make
  ./test_libblis.x
}

package() {
  mkdir -p "${pkgdir}/etc/profile.d"
  cd "${pkgname%-git}"
  make install BLIS_ENABLE_DYNAMIC_BUILD:=yes
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libblas.so"
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libcblas.so"
  printf "# Set blis loop threading environment variables\\n# Please customize for your hardware and application\\n\\nexport BLIS_IR_NT=1\\nexport BLIS_JR_NT=1\\nexport BLIS_IC_NT=1\\nexport BLIS_JC_NT=1" > "${pkgdir}/etc/profile.d/blis.sh"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
