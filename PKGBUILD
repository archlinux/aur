# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
# Contributor: Leonidas Spyropoulos <artafinde at gmail dot com>

_pkgname="auracle"
pkgname="${_pkgname}"
pkgver=2020.09.05
pkgrel=5
pkgdesc='A flexible client for the AUR'
arch=('x86_64' 'i686')
_ns="falconindy"
url="https://github.com/${_ns}/${_pkgname}"
license=('MIT')
depends=(
  'pacman'
  'libcurl.so'
  'libsystemd')
makedepends=(
  'meson'
  'perl'
  'systemd')
checkdepends=(
  'python'
  'fakechroot'
  'gtest')
_commit="87399290d15900a2fcbc4d1d382f57bdac2ee4be"
source=(
  "${_pkgname}-${_commit}.zip::${url}/archive/${_commit}.zip"
  "0001-Force-fmt-dependency-to-static.patch"
  "0002-Update-abseil-cpp-to-LTS-20220623.0.patch"
  "0003-Use-non-deprecated-meson-command.patch")
b2sums=(
  'caab3f6b9fb6d989ae24d2142a57fa0117f079d7e7be60a68187fca043e033786e5fede2a027e75d13a78735e8f143ce87e50731e437196ec995ff2fc308c281'
  '36c8b35b06a9f2d09669110e6ec5686bcb755ae384dbcd985691e5f635a733b9c87b31371de5fa5f743a256b2140cd6dd9c86aebb2ea4a5395377ce273fd080b'
  'df877c951a2054deca1a390cc4e3b458193a0f084e850dbf155f8cac5068753c868215f749034c2e9df914c252517d3017bff542e947477e67b426b5fd554b9c'
  'd743c7cf9a38b0088f356869800d72728672c6dea876d436405f48e4e5b83ff6c7b9f4ce4d3d4002ed25fb7630cacebb6281085cfc8e77eaa7a1730666dd8d01')

prepare() {
  cd "${_pkgname}-${_commit}" 

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
}

build() {
  cd "${_pkgname}-${_commit}"

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
  cd "${_pkgname}-${_commit}"

  meson test -C build
}

package () {
  cd "${_pkgname}-${_commit}"

  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 LICENSE \
      "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: et ts=2 sw=2
