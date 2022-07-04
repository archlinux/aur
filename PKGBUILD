# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: prg <prg-archlinux@xannode.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname='python2-pycurl'
_name="${pkgname#python2-}"
pkgver=7.44.1
pkgrel=7
pkgdesc='A Python 2 interface to libcurl'
arch=('x86_64')
url="https://pypi.org/project/${_name}/${pkgver}"
_repourl="https://github.com/${_name}/${_name}"
license=('LGPL2.1' 'MIT')
depends=(
  'curl'
  'glibc'
  'openssl'
  'python2'
)
makedepends=('python2-setuptools')
_tagname="REL_${pkgver//./_}"
_tarname="${_name}-${_tagname}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/${_tagname}.tar.gz")
b2sums=('0b16d6598cb873f3f071fd61640c2685b0eb99aba2ac071ee533e5db24e38278d157ead5bd7123d426bdb548a36c92b0868bd46178c5c33dbc25f0c6d680d3f2')

prepare() {
  cd "${_tarname}"

  printf "Changing hashbangs in *.py files to refer to 'python2'... "
  sed -e '1s|#![ ]*[a-z0-9._/]*/bin/[a-z0-9._/ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
  echo 'done'

  echo "Disabling documentation inclusion in setup.py"
  sed -e $'/setup_args\[\'data_files\'\]/d' \
      -i 'setup.py'
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  grep -A 100000 -e "^License$" 'README.rst' > 'LICENSE.rst'
  install --verbose -Dm 644 'LICENSE.rst' 'COPYING-MIT' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln --verbose --symbolic '/usr/share/licenses/common/LGPL2.1/license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-LGPL"
}
