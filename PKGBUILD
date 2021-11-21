# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli-bin
pkgver=2.10.2
pkgrel=2
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
sha256sums=('d29db6437bb8b1467d6c31df2aeffc17da857fc260f7cde20a0ebb695bc75b0f'
            'SKIP'
            '716c9542077062d32c59e27f44ddbdb232b9e3774124647d7c67dbcd150f6fd7')

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
  pyinstaller -F main.py -n aliyunpan-cli
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 ./dist/aliyunpan-cli "$pkgdir/usr/bin/aliyunpan-cli"
  ln -vsf aliyunpan-cli $pkgdir/usr/bin/aliyunpan
}

# vim: set et ts=2 sw=2:
