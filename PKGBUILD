# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

pkgname=mingw-w64-rav1e
pkgver=0.6.2
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety (mingw-w64)'
arch=(any)
url=https://github.com/xiph/rav1e/
license=(BSD)
depends=(
  mingw-w64-crt
)
options=(!strip !buildflags staticlibs)
makedepends=(
  cargo-c
  git
  nasm
  mingw-w64-gcc
  mingw-w64-rust
  mingw-w64-wine
)
_tag=b57f8150d566ff353253e52d20623c2684243476
source=(
  git+https://github.com/xiph/rav1e.git#tag=${_tag}
  Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock
)
b2sums=('SKIP'
        'aba9c2e8ce62d65c7eab224f935d25dbc2fb15701035a7934193044aa949e99d5077e381d2fa45a500d8c001390ba0f00dbd67bdc31ab408bfa68ae4a687a6b6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd rav1e

  git describe --tags | sed 's/^v//'
}

prepare() {
  cp -f Cargo-rav1e-${pkgver}.lock rav1e/Cargo.lock

  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  for _arch in ${_architectures}; do
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=x86_64-pc-windows-gnu
    fi

    cd "${srcdir}"

    cp -r rav1e build-${_arch}

    cd "$srcdir/build-${_arch}"

    cargo fetch \
      --locked \
      --manifest-path ./Cargo.toml
  done
}

build() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/rav1e"
  for _arch in ${_architectures}; do
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=x86_64-pc-windows-gnu
    fi

    cd "${srcdir}/build-${_arch}"

    cargo build \
      --release \
      --frozen \
      --manifest-path ./Cargo.toml

    cargo cbuild \
      --release \
      --frozen \
      --target $CARGO_BUILD_TARGET \
      --dlltool ${_arch}-dlltool \
      --prefix=/usr/${_arch} \
      --manifest-path ./Cargo.toml
  done
}

check() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/rav1e"
  for _arch in ${_architectures}; do
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=x86_64-pc-windows-gnu
    fi

    cd "${srcdir}/build-${_arch}"
    cargo test \
      --release \
      --frozen \
      --manifest-path ./Cargo.toml
  done
}

package() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cd "${srcdir}/rav1e"
  for _arch in ${_architectures}; do
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export CARGO_BUILD_TARGET=x86_64-pc-windows-gnu
    fi

    cd "${srcdir}/build-${_arch}"

    cargo install \
      --frozen \
      --offline \
      --no-track \
      --path . \
      --root "${pkgdir}"/usr/${_arch}
    cargo cinstall \
      --release \
      --frozen \
      --target $CARGO_BUILD_TARGET \
      --dlltool ${_arch}-dlltool \
      --prefix /usr/${_arch} \
      --destdir "${pkgdir}"
   install -Dm 644 LICENSE PATENTS -t "${pkgdir}"/usr/${_arch}/share/licenses/rav1e/

   ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
   ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
   ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
