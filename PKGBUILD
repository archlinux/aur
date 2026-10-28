# Maintainer:  dreieck

_pyname=dtspretty
_pkgname="${_pyname}"
pkgname="${_pkgname}-git"
pkgver=r16.20260322.e2d1e91
pkgrel=1
pkgdesc="Tool for pretty-printing decompiled device tree/ dts files."
arch=('any')
url="https://github.com/stolen/dtspretty"
license=('MIT')
depends=(
  'python>=3'
  'python-fdt'
  'python-yaml'
)
makedepends=(
  'git'
)
optdepends=()
#checkdepends=(
#  'python-pytest'
#)
provides=(
  "${_pkgname}"
  "python-${_pkgname}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname}"
)
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git"
  "${install}"
)
sha256sums=(
  'SKIP'
  '6436f09850fa919abc24b8af62b9e638f01b79409b3e548102ed6111c3a45faf'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

#check() {
#  cd "${srcdir}/${_pkgname}"
#
#  make -C test test
#}

package() {
  cd "${srcdir}/${_pkgname}"

  local _python_sitepackage_dir="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -Dvm755 -t "${pkgdir}/${_python_sitepackage_dir}/${_pyname}" dtspretty.py
  install -Dvm644 -t "${pkgdir}/${_python_sitepackage_dir}/${_pyname}" dereference_phandles.py dts_parser.py generate_restored_dts.py parse_dts_symbols.py
  install -Dvm644 -t "${pkgdir}/usr/share/${_pyname}/rules" base.yaml qcom.yaml rk.yaml rules.yaml

  install -dvm755 "${pkgdir}/usr/bin"
  pushd "${pkgdir}/usr/bin" > /dev/null
  cd "${pkgdir}/usr/bin"
  ln -sv "${_python_sitepackage_dir}/${_pyname}/dtspretty.py" dtspretty
  popd > /dev/null

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
