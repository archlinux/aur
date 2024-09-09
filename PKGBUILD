# Maintainer: Peter <peter@nexoid.at>
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
source=("https://cm-gitlab.stanford.edu/bil/s7/-/archive/$_commit/s7-$_commit.tar.gz")
sha256sums=('c451b6a3d70d0d6aa7add4595aa4650be8d296418046cd66efd45cd9e5304371'
)

noextract=()
validpgpkeys=()

pkgver() {
  grep 'S7_VERSION ' ${srcdir}/s7-$_commit/s7.h | sed -e 's/[^"]*"//' -e 's/"//'
}

# based on https://github.com/scheme-containers/s7/blob/master/latest/Dockerfile
build() {
  cd s7-$_commit
  echo '#define S7_LOAD_PATH "/usr/lib/s7"' > mus-config.h
  gcc -o s7 s7.c -ldl -lm -rdynamic -O2 -g -I . -D WITH_MAIN
  ./s7 libc.scm
}

package() {
  mkdir -p ${pkgdir}/usr/lib/s7
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/licenses/s7/
  echo '0-clause BSD' > ${pkgdir}/usr/share/licenses/s7/LICENSE
  cd ${srcdir}/s7-$_commit
  find . -name '*.scm' | rsync -va --files-from - ./ ${pkgdir}/usr/lib/s7
  cp -v libc_s7.so ${pkgdir}/usr/lib/s7
  strip s7
  cp -v s7 ${pkgdir}/usr/bin/
}
