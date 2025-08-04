# Maintainer: Branimir Ricko <rickobranimir at gmail dot com>

pkgname=brplot-git
_pkgver=0.0.5
pkgver=v0.0.5.r0.gb02ef20
pkgrel=1
pkgdesc='Better real time plot - plotting lines that are sent to stdin'
url="https://github.com/branc116/brplot"
arch=('x86_64')
license=('MIT')
depends=('glibc')
optdepends=()
makedepends=('gcc' 'git')
provides=('brplot')
options=()

source=("git+https://github.com/branc116/brplot.git#tag=v${_pkgver}")
sha256sums=('SKIP') # from VCS you don't need checksums

pkgver() { # Correct handling of VCS packages versions
  cd brplot
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd brplot
  gcc -O2 -I. -o nob nob.c -lm
  ./nob amalgam
  gcc               -O3 -fvisibility=hidden -mtune=native -march=native -DBRPLOT_APP            -o brplot.final       .generated/brplot.c -lm
  gcc -shared -fPIC -O3 -fvisibility=hidden -mtune=native -march=native -DBRPLOT_IMPLEMENTATION -o libbrplot.final.so .generated/brplot.c -lm
}

check() {
  cd brplot
  ./nob unittests || (echo "" && echo "" && echo "Unittests failed!" && echo "Please Report everything below this to `${url}`" && echo "" && echo "" && ./nob -ap unittests && exit 1)
}

package() {
  cd brplot
  install -D -m755 "brplot.final" "${pkgdir}/usr/bin/brplot"
  install -D -m755 "libbrplot.final.so" "${pkgdir}/usr/lib/libbrplot.so"
  install -D -m644 ".generated/brplot.c" "${pkgdir}/usr/include/brplot.h"
  install -D -m644 ".generated/FULL_LICENSE" "${pkgdir}/usr/share/licenses/brplot-git/LICENSE"
}
