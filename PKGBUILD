# Maintainer: dreieck

_pkgname=j2j
pkgname="${_pkgname}-git"
epoch=0
pkgver=r6.20230912.ad772bb
pkgrel=2
pkgdesc='Small utility to convert certain Java serialized objects into JSON.'
url='https://github.com/Zerocopter/J2J'
arch=(any)
license=(BSD)
depends=(
  'python>=3'
  "python-javaobj-py3"
)
makedepends=(
  'dos2unix'
  'git'
  'patch'
)
optdepends=()
provides=(
  "${_pkgname}"
  "python-${_pkgname}"
  "python-${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pkgname}"
  "python-${_pkgname}-git"
)
source=(
  "${_pkgname}::git+${url}.git"
  "add-shebangline.patch"
)
sha256sums=(
  'SKIP'
  'd878fd39383ed4e2b2142cf0f3f15fe01e7985c175e53fa6b3e7324a917b943f'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/add-shebangline.patch; do
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  dos2unix J2J.py
  dos2unix JAVA_SERIALIZED_OBJECT.yar

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine Git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  _pythonver="$(python --version | awk '{print $2}' | awk -F. '{print $1"."$2}')"
  _sitepackagedir="${pkgdir}/usr/lib/python${_pythonver}/site-packages/J2J"

  install -D -v -m755 'J2J.py' "${_sitepackagedir}/J2J.py"
  install -d -v -m755 "${pkgdir}/usr/bin"

  ln -svr "${_sitepackagedir}/J2J.py" "${pkgdir}/usr/bin/j2j"

  for _docfile in README.md git.log JAVA_SERIALIZED_OBJECT.yar; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
