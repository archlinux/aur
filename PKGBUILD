# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=auracle-git
_pkgname="${pkgname%-git}"
pkgver=r366.8739929
pkgrel=4
pkgdesc='A flexible client for the AUR'
arch=('x86_64' 'i686')
url="https://github.com/falconindy/auracle.git"
license=('MIT')
depends=('pacman' 'libcurl.so' 'libsystemd')
makedepends=('meson' 'git' 'perl' 'systemd')
checkdepends=('python' 'fakechroot' 'gtest')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/falconindy/auracle.git"
        "0001-Update-abseil-cpp-to-LTS-20211102.0-version.patch"
        "0002-Force-fmt-dependency-to-static.patch")
b2sums=('SKIP'
        'b3b08d114328e09dc1a045733bfea7dcc2235eb4f18fe930d572ebb28a436cdea738acca3cc5d22b71ca47a74437b57f4790a8fc3fea7574fccfb2ccc7a594ed'
        '9972eecdded08cb18b402c9ff8fa483a401ee13d1760de3094d9f8494d829f6ed6f75b66393b22c51e3dc98290d863b49d9c52dab17699d88d6a26b02e55fac5')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  patch -Np1 < "${srcdir}/0001-Update-abseil-cpp-to-LTS-20211102.0-version.patch"
  patch -Np1 < "${srcdir}/0002-Force-fmt-dependency-to-static.patch"
}

build() {
  cd "$_pkgname"

  local meson_args=(
    --prefix=/usr
    --buildtype=plain
    --default-library=static
  )

  [[ -d build ]] && meson_args+=(--wipe)

  # Some tests fail with these enabled
  CFLAGS=${CFLAGS/,-D_GLIBCXX_ASSERTIONS/}
  CXXFLAGS="${CFLAGS}"
  meson build "${meson_args[@]}"

  meson compile -C build
}

check() {
  cd "$_pkgname"

  meson test -C build
}

package () {
  cd "$_pkgname"

  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: et ts=2 sw=2
