# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=auracle-git
_pkgname="${pkgname%-git}"
pkgver=r366.8739929
pkgrel=5
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
        "0001-Force-fmt-dependency-to-static.patch"
        "0002-Update-abseil-cpp-to-LTS-20220623.0.patch"
        "0003-Use-non-deprecated-meson-command.patch")
b2sums=('SKIP'
        '36c8b35b06a9f2d09669110e6ec5686bcb755ae384dbcd985691e5f635a733b9c87b31371de5fa5f743a256b2140cd6dd9c86aebb2ea4a5395377ce273fd080b'
        'df877c951a2054deca1a390cc4e3b458193a0f084e850dbf155f8cac5068753c868215f749034c2e9df914c252517d3017bff542e947477e67b426b5fd554b9c'
        'd743c7cf9a38b0088f356869800d72728672c6dea876d436405f48e4e5b83ff6c7b9f4ce4d3d4002ed25fb7630cacebb6281085cfc8e77eaa7a1730666dd8d01')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
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
