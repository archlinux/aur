# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blis-git
pkgver=0.3.0.38.g3c91c7ae
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software framework by the Science of High-Performance Computing Group"
arch=('x86_64')
license=('custom:BSD')
depends=('glibc')
makedepends=('python2')
url='https://github.com/flame/blis'
options=('!buildflags' '!emptydirs')
source=("git+https://github.com/flame/blis.git#commit=3c91c7aebafb446a2582267beb3b22c8bb475b3b" fpic.patch)
md5sums=('SKIP'
         'e6e4efeb173915d038d62cb76f58c4bb')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|tr - .) 
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 < "$srcdir"/fpic.patch
}

build() {
  cd "${pkgname%-git}"
  CFLAGS+=" -fPIC" ./configure -p "${pkgdir}/usr" x86_64
  make BLIS_ENABLE_DYNAMIC_BUILD:=yes
}

package() {
  install -d "${pkgdir}"/etc/profile.d
  cd "${pkgname%-git}"
  make install BLIS_ENABLE_DYNAMIC_BUILD:=yes
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libblas.so"
#  ln -s "/usr/lib/libblis.so" "${pkgdir}/usr/lib/libcblas.so"
  printf "# Set blis loop threading environment variables\\n# Please customize for your hardware and application\\n\\nexport BLIS_IR_NT=1\\nexport BLIS_JR_NT=1\\nexport BLIS_IC_NT=1\\nexport BLIS_JC_NT=1" > "${pkgdir}/etc/profile.d/blis.sh"
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
