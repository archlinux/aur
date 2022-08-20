# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: Maik93 <michael.mugnai@gmail.com>

pkgname=simavr
pkgver=1.7
pkgrel=3
pkgdesc='A lean, mean and hackable AVR simulator'
arch=('x86_64')
url="https://github.com/buserror-uk/simavr"
license=('GPL3')
depends=('elfutils' 'glu')
makedepends=('avr-libc' 'git' 'freeglut')
_pkghash=1d227277b3d0039f9faef9ea62880ca3051b14f8
source=("${pkgname}::git+https://github.com/buserror-uk/simavr.git#commit=${_pkghash}"
		"local://make_fix.patch")
options=(!strip)
md5sums=('SKIP'
         '885fa2f78b7f59ad8058115562c32441')

build() {
  cd "$srcdir/$pkgname"

  make AVR_ROOT=/usr/avr RELEASE=1 \
      CFLAGS="-Wall -Wextra -fPIC -O2 -std=gnu99 -Wno-sign-compare -Wno-unused-parameter" \
      build-simavr

  # fix some install commands
  git apply "$srcdir/make_fix.patch"
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir/usr" install
}

