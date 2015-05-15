pkgname=hvl_replay-kode54-git
pkgver=r47.f8ecadf
pkgrel=1
pkgdesc="Hively Tracker (HVL and AHX) replayer library (kode54's fork, from foo_input_hvl)"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/foo_input_hvl'
license=(custom:MIT)
depends=(glibc)
makedepends=('git' 'qtchooser')
source=("${pkgname}::git+https://bitbucket.org/kode54/foo_input_hvl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"

  # Don't request a static lib, it prevents a dynamic one from being built.
  sed -i '/^CONFIG /s/ staticlib//' hvl_replay.pro

  # Install the header files too.
  cat >> hvl_replay.pro <<EOF
headers.path = /usr/include/hvl_replay
headers.files = hvl_replay.h blip_buf.h
INSTALLS += headers
EOF
}

build() {
  cd "$srcdir/$pkgname"
  qmake hvl_replay.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.TXT
}

# vim:set sw=2 et:
