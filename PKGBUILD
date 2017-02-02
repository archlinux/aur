# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-pastebin'
pkgver=3.2.1
_mintrel='betsy'
pkgrel=1
pkgdesc="Pastebin upload context menu in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'pastebinit' 'libnotify')
makedepends=('python2-distutils-extra')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('4b4da2992cc4a644f1552a870974f86d02023a4b949922ec408eba615ad914bd')

prepare() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

package() {
  cd ${pkgname}-${pkgver}+${_mintrel}

  python2 ./setup.py install --prefix=/usr --root=${pkgdir}

  # The setup script is doing some weird stuff...
  mv "${pkgdir}"/usr/bin/nemo-pastebin{.py,-configurator.py} "${pkgdir}/usr/share/${pkgname}/"

  cd "${pkgdir}"/usr/bin/
  ln -s ../share/"${pkgname}"/nemo-pastebin-configurator.py nemo-pastebin-configurator

  mkdir -p "${pkgdir}"/usr/share/nemo-python/extensions

  cd "${pkgdir}"/usr/share/nemo-python/extensions
  ln -s ../../"${pkgname}"/nemo-pastebin.py .
}
