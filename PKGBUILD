
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Brett Dutro <brett.dutro@gmail.com>

pkgname=ashuffle-git
pkgver=3.14.0.r0.gf860a9d
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd. (git)"
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient" "yaml-cpp")
makedepends=("git" "meson" "cmake")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(
  "git+https://github.com/joshkunz/${pkgname%-git}.git"
  "git+https://github.com/abseil/abseil-cpp.git"
  "git+https://github.com/google/googletest.git"
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"

  git submodule init
  git config submodule."subprojects/absl".url       "${srcdir}/abseil-cpp"
  git config submodule."subprojects/googletest".url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "ashuffle"

  # fix a build failure in tests where -Werror is set
  export CXXFLAGS="$CXXFLAGS -Wno-error=unused-variable"

  arch-meson \
    -Dtests=enabled \
    -Dunsupported_use_system_yamlcpp=true \
    builddir

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
