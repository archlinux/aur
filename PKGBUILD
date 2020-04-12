
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Brett Dutro <brett.dutro@gmail.com>

pkgname=ashuffle-git
pkgver=2.1.0.r2.gefb54d6
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd. (git)"
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("git" "meson")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "git+https://github.com/joshkunz/${pkgname%-git}.git"
  "git+https://github.com/zorgnax/libtap.git"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"

  git submodule init
  git config submodule.libtap.url $srcdir/libtap
  git submodule update
}

build() {
  cd "ashuffle"

  arch-meson -Dtests=enabled builddir

  ninja -C builddir
}

check() {
  cd "ashuffle"

  ninja -C builddir test
}

package() {
  cd "ashuffle"

  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
