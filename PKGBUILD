# Maintainer: Paul Jones <paul@spacefreak18.xyz>
_reponame=monocoque
pkgname=monocoque
pkgver=0.2.0
pkgrel=2
pkgdesc="Device Manager for Racing Sims"
arch=('x86_64')
url="https://github.com/spacefreak18/monocoque"
license=('GPL3')
_commit=12509e9709871afcb3ae264823b4a7d3c3b71bf7
depends=(
        hidapi
	libserialport
	libxml2
	argtable
	libconfig
	pipewire-pulse
)
makedepends=(
  git
  cmake
)

source=("git+https://github.com/spacefreak18/monocoque.git#commit=$_commit")

sha256sums=(
  'SKIP'
)

build() {
  cd "$srcdir" || exit 1
  cd monocoque || exit 1
  git submodule sync --recursive
  git submodule update --init --recursive
  cd ..
  cmake \
        -B "${_reponame}/build" \
        -S "${_reponame}" \
        -DUSE_PULSEAUDIO=YES \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
  cmake --build "${_reponame}/build"
}


check() {
  ctest --test-dir "${_reponame}/build" --output-on-failure --stop-on-failure
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "${_reponame}/build/monocoque" "${pkgdir}/usr/bin/"
  install -D -m644 "${_reponame}/LICENSE.rst" -t "${pkgdir}/usr/share/licenses/${_reponame}"
}
