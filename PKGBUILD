# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Peter <peter@nexoid.at>
pkgname=s7
# Upstream publishes different versions with the same version number
pkgver=11.9.r20260730
_upstreamver=${pkgver%.*}
pkgrel=1
epoch=
pkgdesc="A Scheme implementation intended as an extension language for other applications."
arch=(x86_64 i686)
url="https://ccrma.stanford.edu/software/snd/snd/s7.html"
license=('custom:0BSD')
groups=()
depends=(glibc)
makedepends=(git rsync)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_commit="779e11342679c7f5082e1fac8af50535fbf7513e"
source=("https://cm-gitlab.stanford.edu/bil/s7/-/archive/$_commit/s7-$_commit.tar.gz" Makefile s7.pc pass-through-compiler-flags.patch)
sha256sums=('c083b51add696690dc1a9a9d7d9b4117e7e03f74837fb3a4855b16aca425c867' SKIP SKIP SKIP)

noextract=()
validpgpkeys=()

prepare() {
  sed -i 's/XX\.X/'${_upstreamver}'/' s7.pc
  cd s7-$_commit
  cp ${srcdir}/Makefile .
  patch -Np0 -i ${srcdir}/pass-through-compiler-flags.patch
}

build() {
  cd s7-$_commit
  make -j all
}

package() {
  mkdir -vp ${pkgdir}/usr/lib/s7
  mkdir -vp ${pkgdir}/usr/bin/
  mkdir -vp ${pkgdir}/usr/include/
  mkdir -vp ${pkgdir}/usr/lib/pkgconfig/
  mkdir -vp ${pkgdir}/usr/share/doc/s7/
  mkdir -vp ${pkgdir}/usr/share/licenses/s7/
  cp -v ${srcdir}/s7.pc ${pkgdir}/usr/lib/pkgconfig/
  echo '0-clause BSD' > ${pkgdir}/usr/share/licenses/s7/LICENSE
  cd ${srcdir}/s7-$_commit
  find . -name '*.scm' | rsync -va --files-from - ./ ${pkgdir}/usr/lib/s7
  cp -v libc_s7.so ${pkgdir}/usr/lib/s7
  cp -v s7 ${pkgdir}/usr/bin/
  cp -v libs7.so ${pkgdir}/usr/lib/
  cp -v s7.h ${pkgdir}/usr/include/
  cp -v *.html ${pkgdir}/usr/share/doc/s7/
}
