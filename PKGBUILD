# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pypipe
pkgver=0.2.0
pkgrel=1
pkgdesc='Python command-line tool for pipeline processing'
arch=('any')
url='https://github.com/bugen/pypipe'
license=('Apache')
depends=('python')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bugen/pypipe/archive/v${pkgver}.tar.gz"
  'test.csv'
)

sha512sums=(
  'f672b5fc12d6adde563289885a1005a3b7f93e43363c49cecb4fb7eba531594da831097ef68feac6afbc8608646dab359ec78e9ce872a2f05ad7a5b2dcfae58b'
  '1ec418fd1a274fd2f02e393aa53126c662ff1285479d960d3c953749399898fda8028f4cfa600a9c1e4906f911f496fedd0df39ff42714d651f1fa5ea0caa6dc'
)

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  color="$(
    python pypipe.py < ../test.csv rec -C -f 'r[0] == "test"' 'r[1]'
  )"
  [ "${color}" == 'green' ]
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo >&2 'Packaging script'
  install -D -m 755 -T 'pypipe.py' "${pkgdir}/usr/bin/ppp"

  echo >&2 'Packaging examples'
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" docs/*

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
