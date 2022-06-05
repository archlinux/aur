# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli-bin
pkgver=3.0.6
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
sha256sums=('b5452250bcb1c2134b996ceb2f832b3924ea6254c05bbee5c128ae6d413c4554'
            'SKIP'
            '861a40ead90266234e2ecca520ea837e3118f994431053f390f7b81bf45b0fb9')

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
