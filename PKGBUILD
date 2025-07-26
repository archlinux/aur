# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Maxime Gauduin <alucryd@archlinux>org>
# Contributor: quietvoid <tcChlisop0@gmail.com>

pkgname=mingw-w64-libdovi
pkgver=3.3.2
pkgrel=1
pkgdesc='Library to read and write Dolby Vision metadata (mingw-w64)'
arch=('any')
url=https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision
license=(MIT)
depends=(
  mingw-w64-crt
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  cargo-c
  git
  mingw-w64-rust
)
checkdepends=(mingw-w64-wine)
_tag=4fd2b2235c9f93582dd4a00e65ee34a07800afd7
source=(git+https://github.com/quietvoid/dovi_tool.git#tag=${_tag})
b2sums=('40aefc4476b3fb674d2f2fe241de1e8e8b91658c8d5c9d7c729d371bbbb5b70955210d23b3cd088ae2001963f9aa15c29ceb4fa3abf15762f66d44efd6c3ae0e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  if [[ -d "${RUST_PATH}" ]] ; then
    export PATH="${RUST_PATH}:${PATH}"
  else
    export PATH="/opt/rust/bin:${PATH}"
  fi
  if [[ ! -d "${CARGO_HOME}" ]] ; then
    export CARGO_HOME="/opt/rust/cargo"
  fi

  cargo fetch \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

#pkgver() {
#  cd dovi_tool
#  git describe --tags | sed 's/^libdovi-//'
#}

build() {
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
      export RUST_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export RUST_TARGET=x86_64-pc-windows-gnu
    fi

    export DLLTOOL="${_arch}-dlltool"

    cargo cbuild \
      --verbose \
      --verbose \
      --target ${RUST_TARGET} \
      --release \
      --frozen \
      --prefix=/usr/${_arch} \
      --manifest-path dovi_tool/dolby_vision/Cargo.toml
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

  for _arch in ${_architectures}; do
    if [[ ${_arch} = i686-w64-mingw32 ]] ; then
      export RUST_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export RUST_TARGET=x86_64-pc-windows-gnu
    fi

    cargo test \
      --target ${RUST_TARGET} \
      --release \
      --frozen \
      --all-features \
      --manifest-path dovi_tool/dolby_vision/Cargo.toml
   done
}

package() {
  cd dovi_tool/dolby_vision

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
      export RUST_TARGET=i686-pc-windows-gnu
    fi
    if [[ ${_arch} = x86_64-w64-mingw32 ]] ; then
      export RUST_TARGET=x86_64-pc-windows-gnu
    fi

    cargo cinstall \
      --target ${RUST_TARGET} \
      --release \
      --frozen \
      --prefix /usr/${_arch} \
      --destdir "${pkgdir}"

    # somehow dlltool invocation of cargo cbuild produces a broken implib
    rm "${pkgdir}"/usr/${_arch}/lib/dovi.dll.a
    ${_arch}-dlltool -d "${pkgdir}"/usr/${_arch}/lib/dovi.def -D dovi.dll -l "${pkgdir}"/usr/${_arch}/lib/dovi.dll.a

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.dll.a
    # FIXME: Disabled stripping static lib as strip fails with no sections error
    #${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/mingw-w64-libdovi/
}

# vim: ts=2 sw=2 et:
