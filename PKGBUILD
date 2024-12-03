# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Chocobo1 <chocobo1@archlinux.net>

pkgname=mingw-w64-rav1e
pkgver=0.7.1
pkgrel=1
pkgdesc='An AV1 encoder focused on speed and safety (mingw-w64)'
arch=(any)
url=https://github.com/xiph/rav1e/
license=(custom:BSD)
depends=(
  mingw-w64-crt
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  cargo-c
  git
  nasm
  mingw-w64-gcc
  mingw-w64-rust
  mingw-w64-wine
)
_tag=a8d05d0c43826a465b60dbadd0ab7f1327d75371
source=(
  git+https://github.com/xiph/rav1e.git#tag=${_tag}
  Cargo-rav1e-${pkgver}.lock::https://github.com/xiph/rav1e/releases/download/v${pkgver}/Cargo.lock
)
b2sums=('SKIP'
        '7cbeaff87ca4e9db469be06cbead0c5b05af2064d6d5f12f97f5999992017b66a24bc19ed4eaf69f7d6579732f843f3e93f30d9581b8c8344728d3e3773a0f79')
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
      --prefix /usr/${_arch} \
      --destdir "${pkgdir}"

   rm "${pkgdir}"/usr/${_arch}/lib/rav1e.dll.a
   ${_arch}-dlltool -d "${pkgdir}"/usr/${_arch}/lib/rav1e.def -D rav1e.dll -l "${pkgdir}"/usr/${_arch}/lib/rav1e.dll.a

   ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
   ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
   ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dm 644 LICENSE PATENTS -t "${pkgdir}"/usr/share/licenses/mingw-w64-rav1e/
}

# vim: ts=2 sw=2 et:
