# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Kartoffel
_pkgname=pineflash
pkgname="${_pkgname}-git"
pkgver=0.5.3+19.r295.20240112.4c6996d
pkgrel=2
arch=(
  i686
  x86_64
  armv7h
  aarch64
)
pkgdesc='A GUI tool to flash IronOS to the Pinecil V1, V2 and future other pine64 products.'
url='https://github.com/Spagett1/PineFlash'
license=('GPL2')
depends=(
  'bzip2'
  'curl'
  'dfu-util'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'gtk3'
  'libudev'
  'libusb'
  'polkit'
)
makedepends=(
  'base-devel'
  # 'cargo-ndk' # To verify some integrity checksums of rust modules
  'git'
  'optipng'
  'pkgconf'
  'rust'
)
optdepends=(
  'blisp: For pinecil V2 support.'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options+=('!lto')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo fetch || cargo fetch # Twice in order to work around the error "failed to verify the checksum of `ndk-sys v0.4.0`". See also https://github.com/rust-lang/cargo/issues/7180#issuecomment-1325636251.

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  optipng -o7 assets/*.png

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo build --offline --release
}

# check() {
### Currently (as of 2022-12-15), no tests are defined in the source.
# cd "${srcdir}/${_pkgname}"
# 
#   CARGO_HOME="${srcdir}/cargo"
#   export CARGO_HOME
# 
#   cargo build --offline --release --tests
#   cargo test --offline
# }

package() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  ### Install via install routine (and fix up things afterwards):
  # cargo install --root "${pkgdir}" --offline --path .
  # install -d -v -m755 "${pkgdir}/usr"
  # mv -v "${pkgdir}/bin" "${pkgdir}/usr/bin"
  # rm -f "${pkgdir}"/{.crates2.json,.crates.toml}

  ### Install manually:
  install -D -v -m755 "target/release/pineflash" "${pkgdir}/usr/bin/pineflash"

  install -D -v -m644 "assets/Pineflash.desktop" "${pkgdir}/usr/share/applications/Pineflash.desktop"
  install -D -v -m644 "assets/pine64logo.png" "${pkgdir}/usr/share/pixmaps/pine64logo.png"
  install -D -v -m644 "assets/pine64logo.ico" "${pkgdir}/usr/share/pixmaps/pine64logo.ico"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _connectioninstructions in assets/Step*.svg; do
    install -D -v -m644 "${_connectioninstructions}" "${pkgdir}/usr/share/doc/${_pkgname}/pinecil-connection-instruction/${_connectioninstructions}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -v -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "LICENSE"
}
