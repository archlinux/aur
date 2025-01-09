# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Peter <peter@nexoid.at>
pkgname=s7
pkgver=11.2
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
_commit="f5106f09350af239f84f93c777a33f4adf241367"
source=("https://cm-gitlab.stanford.edu/bil/s7/-/archive/$_commit/s7-$_commit.tar.gz" Makefile s7.pc)
sha256sums=(
  'c451b6a3d70d0d6aa7add4595aa4650be8d296418046cd66efd45cd9e5304371'
  'SKIP'
  'SKIP'
)

noextract=()
validpgpkeys=()

pkgver() {
  grep 'S7_VERSION ' ${srcdir}/s7-$_commit/s7.h | sed -e 's/[^"]*"//' -e 's/"//'
}

build() {
  cd s7-$_commit
  cp ${srcdir}/Makefile .
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
