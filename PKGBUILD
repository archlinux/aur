# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=pdfrip
pkgname="${_pkgname}-git"
pkgver=2.0.1+27.r85.20251113.66c71d4
pkgrel=1
arch=(
  'i686'
  'x86_64'
  'armv7h'
  'aarch64'
)
pkgdesc='A multi-threaded PDF password recovering/ cracking utility.'
url='https://github.com/mufeedvh/pdfrip'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'base-devel'
  'git'
  'gifsicle'
  'zopfli'
  'rust'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'  # Main upstream source
)
# options+=('!lto')

prepare() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo fetch

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

  # shrinking PNG and GIF files losslessy:
  local _png _gif
  for _png in screenshots/*.png; do
    zopflipng -y -m "${_png}" "${_png}"
  done
  for _gif in screenshots/*.gif; do
    gifsicle -O3 -V -o "${_gif}" "${_gif}"
  done


  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo build --offline --release
}

check() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  cargo test --offline
}

package() {
  cd "${srcdir}/${_pkgname}"

  CARGO_HOME="${srcdir}/cargo"
  export CARGO_HOME

  # Install manually:
  install -Dvm755 -t "${pkgdir}/usr/bin" target/release/pdfrip

  for _docfile in README.md screenshots/* examples/*; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -v -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sv "/usr/share/licenses/${pkgname}/LICENSE" "LICENSE"
}
