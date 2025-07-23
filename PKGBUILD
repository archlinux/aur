# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=chawan-git
pkgver=r3746.daed0cb
pkgrel=1
pkgdesc="Web browser for your terminal"
arch=(i686 x86_64)
url="https://git.sr.ht/~bptato/${pkgname%-git}"
license=(Unlicense)
depends=(
  brotli
  gcc-libs
  glibc
  libssh2
  openssl
  sh
)
makedepends=(
  git
  "nim>=2.0.0"
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${pkgname%-git}
  export CFLAGS+=" -ffile-prefix-map=$srcdir/="
  if [[ $CARCH == "i686" ]]; then
    export CFLAGS+=" -fpermissive"
  fi
  make LIBEXECDIR=/usr/lib/${pkgname%-git}
}

package() {
  cd ${pkgname%-git}
  install -vDm 644 UNLICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}/
  make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="$pkgdir"/usr/lib/${pkgname%-git} install
}
