# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# A modified version of the meson package (https://gitlab.archlinux.org/archlinux/packaging/packages/meson)

_pkgname=meson
pkgname=meson-rust
pkgver=1.3.2
pkgrel=2
pkgdesc="High productivity build system (version with improved Rust support)"
url="https://mesonbuild.com/"
arch=(any)
license=(Apache-2.0)
depends=(
  ninja
  python-tqdm
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  boost
  clang
  cmake
  cuda
  cython
  doxygen
  gcc-fortran
  gcc-objc
  git
  glibc-locales
  gmock
  gnustep-base
  gobject-introspection
  graphviz
  gtest
  gtk-doc
  gtk-sharp-2
  gtk3
  gtkmm3
  hotdoc
  itstool
  java-environment=8
  ldc
  libelf
  libwmf
  llvm
  mercurial
  mono
  nasm
  netcdf-fortran
  openmpi
  openssh
  protobuf
  python-gobject
  python-pytest-xdist
  qt5-base
  qt5-tools
  rust
  rust-bindgen
  sdl2
  vala
  valgrind
  vulkan-validation-layers
  wxgtk3
)
provides=("meson=$pkgver")
conflicts=(meson)
source=(
  https://github.com/mesonbuild/meson/releases/download/"$pkgver"/meson-"$pkgver".tar.gz{,.asc}
  "meson-reference-$pkgver.3::https://github.com/mesonbuild/meson/releases/download/$pkgver/meson-reference.3"
  "meson-reference-$pkgver.json::https://github.com/mesonbuild/meson/releases/download/$pkgver/reference_manual.json"
  arch-meson
  cross-lib32
  native-clang
  0001-Skip-broken-tests.patch
  0002-Limit-unittests-workers.patch
  rustc-rebuild.patch
)
b2sums=('72b061598a0cb22517460de4df25394a9dfbddb536c5b8e75b7267ae21292fe2a6a3ec16d64aa81cde63d33022decebcc051cf2d87d677f9b40eb2f4106a40cd'
        'SKIP'
        '692feb16f6ef585e5b7fa46370b0ad0ed0418cf05a15fe08cc5f2945cc83425dda0232e8c30c26b3d82ce95fe1703890b0a53ee7745c78e71a1a8eb8cd376e1c'
        '46b62e840f066287c74ac066e03f56b54e9c7fa1e5789dd0c93e112ff4d62194dc5be6ac39c9d17d6242105e078c05e98109aed3c4f0f7c317b549cb9ff54610'
        '70f042a7603d1139f6cef33aec028da087cacabe278fd47375e1b2315befbfde1c0501ad1ecc63d04d31b232a04f08c735d61ce59d7244521f3d270e417fb5af'
        '9b16477aa77a706492e26fb3ad42e90674b8f0dfe657dd3bd9ba044f921be12ceabeb0050a50a15caee4d999e1ec33ed857bd3bed9e4444d73bb4a4f06381081'
        '7d88929d5a3b49d91c5c9969f19d9b47f3151706526b889515acaeda0141257d5115875ac84832e9ea46f83a7700d673adcc5db84b331cd798c70ae6e90eac1e'
        'ebcd0d961bdc00309aa76e93e49c7136c454d1d1838c6bf5a5b168c0a94532353d32364de16c045f14950dd5313c17f33b3d7974317ba94db161638f93de6845'
        '5847e2f1bf362c9fdaf522f0d3a6c81e67c7ac8c016e0ade5632bf23c1ea591c3659fe40f2139e97805144b3a6db6fe375977735b6fc74a7c7a6f8e581632f24'
        '1cf2521f6ebfdbedf1c58c09abfc0f77fcc0d59d903cca6634443d11cb5998cf51c3bfa61c6b17dca98a87f32c12e59558d6da25c57d8b341ae4c266ecd8857a')
validpgpkeys=(
  19E2D6D9B46D8DAA6288F877C24E631BABB1FE70  # Jussi Pakkanen <jpakkane@gmail.com>
)

prepare() {
  cd ${_pkgname}-${pkgver}

  # Pass tests
  patch -Np1 -i ../0001-Skip-broken-tests.patch
  patch -Np1 -i ../0002-Limit-unittests-workers.patch

  # Rebuild targets after a rustc update (https://github.com/mesonbuild/meson/pull/12536)
  # (this should fix Rust project compile issues after a compiler update)
  patch -Np1 -i ../rustc-rebuild.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() (
  cd $pkgname-$pkgver
  export LC_CTYPE=en_US.UTF-8 CPPFLAGS= CFLAGS= CXXFLAGS= LDFLAGS=
  ./run_tests.py --failfast
)

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -rt "$pkgdir/usr/share/vim/vimfiles" data/syntax-highlighting/vim/*/

  install -Dm644 data/shell-completions/bash/* -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 data/shell-completions/zsh/*  -t "$pkgdir/usr/share/zsh/site-functions"

  install -Dm644 ../meson-reference-$pkgver.3    "$pkgdir/usr/share/man/man3/meson-reference.3"
  install -Dm644 ../meson-reference-$pkgver.json "$pkgdir/usr/share/doc/$pkgname/reference_manual.json"

  install -D ../arch-meson -t "$pkgdir/usr/bin"

  install -Dm644 ../cross-lib32 "$pkgdir/usr/share/meson/cross/lib32"
  install -Dm644 ../native-clang "$pkgdir/usr/share/meson/native/clang"
}

# vim:set sw=2 sts=-1 et:
