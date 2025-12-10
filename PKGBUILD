# Maintainer: dreieck

_pkgname='firefox-decrypt'
pkgname="${_pkgname}-git"
pkgver=1.1.1+24.r339.20251113.7aad315
pkgrel=1
pkgdesc="A tool to extract passwords from Mozilla (Firefox™, Waterfox™, Thunderbird®, SeaMonkey®) profiles."
arch=('any')
url="https://github.com/Unode/firefox_decrypt"
license=('GPL3')
groups=()
depends=(
  'python>=3.9'
)
makedepends=(
  'git'
)
optdepends=(
  "firefox: This generates the data which ${_pkgname} works on."
  "pass: To import extracted login information directly into 'pass' password store."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options+=('!emptydirs')
install=
source=(
  "${_pkgname}::git+https://github.com/Unode/firefox_decrypt.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(python3 firefox_decrypt.py --version | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
  # _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m755 firefox_decrypt.py "${pkgdir}/usr/bin/firefox-decrypt"

  for _docfile in CONTRIBUTORS.md CHANGELOG.md README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  cp -rv "tests" "${pkgdir}/usr/share/doc/${_pkgname}/tests"

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sv "../../licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
