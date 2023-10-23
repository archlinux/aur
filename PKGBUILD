# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe-git
_gitpkgname=pypipe
pkgver=r8.eb7b045
pkgrel=1
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache')
depends=('python')
makedepends=('git')
provides=('pypipe')
conflicts=('pypipe')
options=('!strip')

source=(
  "${_gitpkgname}::git+https://github.com/bugen/pypipe.git"
  'test.csv'
)

sha512sums=(
  'SKIP'
  '1ec418fd1a274fd2f02e393aa53126c662ff1285479d960d3c953749399898fda8028f4cfa600a9c1e4906f911f496fedd0df39ff42714d651f1fa5ea0caa6dc'
)

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/${_gitpkgname}"
  color="$(
    python pypipe.py < ../test.csv rec -C -f 'r[0] == "test"' 'r[1]'
  )"
  [ "${color}" == 'green' ]
}

package() {
  cd "${srcdir}/${_gitpkgname}"

  echo >&2 'Packaging script'
  install -D -m 755 -T 'pypipe.py' "${pkgdir}/usr/bin/ppp"

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" docs/*

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
