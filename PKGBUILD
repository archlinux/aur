# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli-bin
pkgver=3.0.9
pkgrel=1
pkgdesc="Aliyunpan CLI"
arch=('any')
url="https://github.com/wxy1343/aliyunpan"
license=("GPL-3.0")
makedepends=('python-pip')
provides=("aliyunpan" "aliyunpan-cli")
conflicts=("aliyunpan" "aliyunpan-cli")
source=(${_pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        dlnap-master.tar::"https://github.com/cherezov/dlnap/archive/master.tar.gz"
        "0001-upgrade-requirements.patch")
sha256sums=('bcf6aefbf2990dd1f81a24b9307363b2198d5540b22c6099d4a56ff25010cba4'
            'SKIP'
            '130eae5955b74cdc9984c1bc69982480d0b38fdbe719de068a7a12dcc4c8b3d3')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mv -vTf "${srcdir}"/dlnap-master dlnap
  patch -Np1 -i "${srcdir}/0001-upgrade-requirements.patch"
  pip install -r requirements.txt
  pip install pyinstaller
  export PATH=${HOME}/.local/bin:${PATH}
}

build() {
  cd ${_pkgname}-${pkgver}
  pyinstaller -F aliyunpan/main.py -n aliyunpan-cli
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 ./dist/aliyunpan-cli "$pkgdir/usr/bin/aliyunpan-cli"
  ln -vsf aliyunpan-cli $pkgdir/usr/bin/aliyunpan
}

# vim: set et ts=2 sw=2:
