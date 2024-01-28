pkgname=nxtb-git
pkgrel=1
pkgver=r14.5536b53
pkgdesc='Access to the Nextbike API via cli or python lib'
arch=('any')
url="https://gitlab.com/S60W79/nextbike-cli/"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('gzip' 'git' 'fakeroot' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
md5sums=('SKIP')

source=("${pkgname}"::'git+https://gitlab.com/S60W79/nextbike-cli/')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}
package () {
  cd "${pkgname}"
  git checkout archpkg
  echo "Installing site package"
  python -m installer --destdir="$pkgdir" dist/*.whl
  echo "Safing documentation"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/nxtb/README.md"
  gzip -f "${srcdir}/${pkgname}/README"
  install -Dm644 "${srcdir}/${pkgname}/README.gz" "${pkgdir}/usr/share/man/man8/nxtb.8.gz"
  echo 'Alle Raeder stehen still, wenn dein starker Arm es will.'
  echo 'Finished'
}
