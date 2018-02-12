# Maintainer: dreieck
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

_pkgname=arandr-indicator
pkgname="${_pkgname}-git"
epoch=1
pkgver=20150516+2ebd165
pkgrel=2
pkgdesc="Quick and simple tray icon menu for changing the monitor layout."
arch=('any')
url="https://github.com/denilsonsa/${_pkgname}"
license=('custom')
depends=(
  # 'libappindicator'
  'pygtk'
  'python2>=2.7'
  'python2-libappindicator'
  'python2-xdg'
)
makedepends=('git')
optdepends=('arandr: To configure monitor layouts.')
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/denilsonsa/${_pkgname}.git"
  'license-info.txt'
)
md5sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _date_rev="$(git log -n1 --format=tformat:'%cI+%h' | sed 's|T[^+]*||' | tr -d '-')"
  if [ -z "${_date_rev}" ]; then
    {
      echo "error: pkgver() could not retrieve version or revision. Please check."
      echo "Aborting."
    } > /dev/stderr
    return 1
  fi
  echo "${_date_rev}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Extract copyright information.
  cat arandr-indicator.py | tr -d '\a' | tr '\n' '\a' | sed 's|^.*\(# Copyright.*$\)|\1|g' | sed 's|\a[^#][^\a]*.*$|\a|g' | tr '\a' '\n' > "${srcdir}/license.txt"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/lincense.txt"
  install -Dvm644 "${srcdir}/license-info.txt" "${pkgdir}/usr/share/licenses/${pkgname}/lincense-info.txt"
}
