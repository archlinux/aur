# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

pkgname=mingw-w64-rav1e
pkgver=0.6.6
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
_tag=7c9db10494c2fffa98a572027d756e55bf754036
source=(
  git+https://github.com/xiph/rav1e.git#tag=${_tag}
  Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock
)
b2sums=('SKIP'
        'c7d1f548e9cd194c98685827b178f923d7cb1b4e4c20c4cab4779bc1e56a59b84655731cd0e8e60dfb9d3a3dad6f9bd25aee903601f7a2c5214285584b1a3977')
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
      --no-default-features \
      --features binaries,asm,threading,signal_support \
      --manifest-path ./Cargo.toml

    cargo cbuild \
      --release \
      --frozen \
      --no-default-features \
      --features binaries,asm,threading,signal_support \
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
      --no-default-features \
      --features binaries,asm,threading,signal_support \
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
      --no-default-features \
      --features binaries,asm,threading,signal_support \
      --offline \
      --no-track \
      --path . \
      --root "${pkgdir}"/usr/${_arch}
    cargo cinstall \
      --release \
      --frozen \
      --no-default-features \
      --features binaries,asm,threading,signal_support \
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
