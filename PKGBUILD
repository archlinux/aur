# Maintainer: zer0def <zer0def@github>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>
_pkgname=googleplaydownloader
pkgname="${_pkgname}-git"
pkgver=2.3.r16.3d16974
pkgrel=1
pkgdesc="A graphical software to download APKs from the Google Play store."
arch=(any)
url="https://framagit.org/tuxicoman/googleplaydownloader"
license=('AGPL')
depends=('python'
         'python-requests'
         'python-pyasn1'
         'python-wxpython'
         'python-androguard')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_pkgname}"
  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.%s' \
    "${GITTAG#v}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare(){
  sed -i "s#/usr/lib/python2.7/dist-#/usr/lib/python$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')/site-#" "${srcdir}/${_pkgname}/debian/wrapper/${_pkgname}"
  sed -i 's#python2#python#g' "${srcdir}/${_pkgname}/debian/wrapper/${_pkgname}" $(find "${srcdir}/${_pkgname}" -type f -iname '*.py')
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm755 "debian/wrapper/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
