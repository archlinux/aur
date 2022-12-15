# Maintainer: dreieck
# Contributor: Kartoffel <laar@tutanota.com>
_pkgname=pineflash
pkgname="${_pkgname}-git"
pkgver=0.2.2.r61.20221214.ec8eccb
pkgrel=1
arch=(
  i686
  x86_64
)
pkgdesc='A rust program for flashing pinecils and in the future other pine64 products.'
url='https://github.com/Laar3/PineFlash'
license=('GPL2')
depends=(
  'dfu-util'
  'gtk3'
  'polkit'
)
makedepends=(
  'git'
  'rust'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo fetch
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(grep -E '^[[:space:]]*pkgver=' PKGBUILD | tail -n1 | sed -E -e 's|^[^=]*=||' -e 's|[[:space:]#]*$||')" # Upstream seems to define package version only in it's own (otherwise problematic) `PKGBUILD`. So, parse version from there.
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

  install -D -v -m644 "Pineflash.desktop" "${pkgdir}/usr/share/applications/Pineflash.desktop"
  install -D -v -m644 "assets/pine64logo.png" "${pkgdir}/usr/share/pixmaps/pine64logo.png"
  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "LICENSE"
}
