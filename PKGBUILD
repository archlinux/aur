# Maintainer: Peter <peter@nexoid.at>
pkgname=s7
pkgver=10.11
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
source=("https://ccrma.stanford.edu/software/s7/s7.tar.gz")
sha256sums=('de072a1c023a287a4ce0c4e0f6cb8dd24e881fe787ffd990c61ec31e83084fd6')

noextract=()
validpgpkeys=()

pkgver() {
  grep 'S7_VERSION ' ${srcdir}/s7/s7.h | sed -e 's/[^"]*"//' -e 's/"//'
}

# based on https://github.com/scheme-containers/s7/blob/master/latest/Dockerfile
build() {
  cd s7
  echo '#define S7_LOAD_PATH "/usr/lib/s7"' > mus-config.h
  gcc -o s7 s7.c -ldl -lm -rdynamic -O2 -g -I . -D WITH_MAIN
  ./s7 libc.scm
}

package() {
  mkdir -p ${pkgdir}/usr/lib/s7
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/licenses/s7/
  echo '0-clause BSD' > ${pkgdir}/usr/share/licenses/s7/LICENSE
  cd ${srcdir}/s7
  find . -name '*.scm' | rsync -va --files-from - ./ ${pkgdir}/usr/lib/s7
  cp -v libc_s7.so ${pkgdir}/usr/lib/s7
  strip s7
  cp -v s7 ${pkgdir}/usr/bin/
}
