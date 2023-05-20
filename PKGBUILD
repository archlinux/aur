pkgname=sseqplayer-git
pkgver=r27.91436e7
pkgrel=1
pkgdesc="Library for decoding Nitro Composer Sound Format (NSCF) files"
arch=(i686 x86_64)
url='https://github.com/kode54/SSEQPlayer'
license=(custom:WTFPL)
depends=(glibc gcc-libs)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname}::git+https://github.com/kode54/SSEQPlayer.git
        makefile.patch
        g++-fix.patch
        g++-fix-2.patch
        g++-fix-3.patch)
sha256sums=('SKIP'
            '9459ce17453fb70b04ccac200e77259f8995fb22f8c4232473657e16f0563b78'
            'db3afb40a04b8199e78636d309e279b2ec47bf0c81b6c3fdb859c405568fde68'
            '9151cea3ba73daec0eec2a1b4708a84a351f41aa2767cee642e097cb759cfef6'
            'ec2a2a32e467895f82aff74b881e8139fbf0e3dcd96b2c3f179c476fcc69313a')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch Makefile "$srcdir"/makefile.patch
  patch Player.cpp "$srcdir"/g++-fix.patch
  patch convert.h "$srcdir"/g++-fix-2.patch
  patch common.h "$srcdir"/g++-fix-3.patch
}


build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include/SSEQPlayer" Player.h SSEQ.h Track.h Channel.h consts.h SBNK.h INFOEntry.h common.h SWAV.h SWAR.h SDAT.h
  install -D -m644 -t "$pkgdir/usr/lib" libSSEQPlayer.{a,so}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.TXT
}

# vim:set sw=2 et:
