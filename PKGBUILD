
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Brett Dutro <brett.dutro@gmail.com>

pkgname=ashuffle-git
pkgver=3.0.0.r2.g9e6f286
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd. (git)"
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("git" "meson" "cmake")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "git+https://github.com/joshkunz/${pkgname%-git}.git"
  "git+https://github.com/abseil/abseil-cpp.git"
  "git+https://github.com/google/googletest.git"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"

  git submodule init
  git config submodule."subprojects/absl".url       "${srcdir}/abseil-cpp"
  git config submodule."subprojects/googletest".url "${srcdir}/googletest"
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

  # clean up weird static libs installed
  # this is a meson bug:
  # https://github.com/mesonbuild/meson/issues/2550
  rm -rf "${pkgdir}/usr/lib/"*.a
  rmdir "${pkgdir}/usr/lib"

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
