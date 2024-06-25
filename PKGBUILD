# Maintainer:  dreieck
# Contributor: Maxim Andersson

pkgname=zget-git
_gitname=zget
pkgver=0.11.1+19.r136.20240613.89a4063
pkgrel=1
pkgdesc="Zeroconf based peer to peer file transfer."
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=(
  'python>=3'
  'python-netifaces'
  'python-progressbar'
  'python-requests'
  'python-six'
  'python-zeroconf'
)
makedepends=(
  'git'
  'python-babel'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=("zget=${pkgver}")
conflicts=('zget')
source=('zget::git+https://github.com/nils-werner/zget.git')
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_gitname}"

  # Remove unneeded limitations (on Arch)
  sed -i 's/<......//' setup.py

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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
  cd "${srcdir}/${_gitname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  for _docfile in CHANGELOG README.md git.log; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/zget/${_docfile}"
  done
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/zget/LICENSE"
}

# vim:set ts=2 sw=2 et:
