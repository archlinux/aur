
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Brett Dutro <brett.dutro@gmail.com>

pkgname=ashuffle-git
pkgver=3.13.0.r2.gfccccdd
pkgrel=2
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
  "0001_add_option_to_use_system_yaml_cpp.patch"
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP'
  "b2b3515daf31a886bf33119276f1b968353f5ac18e353bbc39ae05c6164d47e1"
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname%-git}"

  patch -p1 -i "${srcdir}/0001_add_option_to_use_system_yaml_cpp.patch"

  git submodule init
  git config submodule."subprojects/absl".url       "${srcdir}/abseil-cpp"
  git config submodule."subprojects/googletest".url "${srcdir}/googletest"
  git submodule update
}

build() {
  cd "ashuffle"

  arch-meson \
    -Dtests=enabled \
    -Dunsupported_use_system_yaml_cpp=true \
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
