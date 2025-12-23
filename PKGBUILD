# Maintainer: Branimir Ricko <rickobranimir at gmail dot com>

pkgname=brplot-git
_pkgver=0.0.13
pkgver=v0.0.13.r0.gc3ed1fc

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
}

check() {
  cd brplot
  ./nob unittests || (echo "" && echo "" && echo "Unittests failed!" && echo "Please Report everything below this to `${url}`" && echo "" && echo "" && ./nob -ap unittests && exit 1)
}

package() {
  cd brplot
  ./nob install --prefix ${pkgdir}/usr
  mv ${pkgdir}/usr/share/licenses/brplot ${pkgdir}/usr/share/licenses/brplot-git
}
