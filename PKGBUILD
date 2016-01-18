# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=volatility-git
_gitname=volatility
pkgver=2.5.2362.2033154
pkgrel=1
pkgdesc="Advanced memory forensics framework"
url="https://github.com/volatilityfoundation/volatility/wiki"
arch=('any')
license=('GPL2')
depends=('distorm' 'python2-crypto' 'python2-ujson')
optdepends=(
  'python2-yara: classify malware support'
  'python2-pillow: screenshots plugin support'
  'python2-pytz: timezone conversion support'
  'ipython2: enhanced volshell support'
  'python2-libforensic1394: firewire live analysis support'
  'libraw1394: alternative firewire live analysis support'
  'python2-openpyxl: Excel xlsx/xlsm files support'
)
makedepends=('git' 'python2-setuptools')
provides=('volatility')
conflicts=('volatility')
source=(${pkgname}::git+https://github.com/volatilityfoundation/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e 's/env python$/env python2/g' -i tools/vtype_diff.py
}

package() {
  cd ${pkgname}

  python2 setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  ln -s /usr/bin/vol.py "${pkgdir}/usr/bin/${_gitname}"

  install -d "${pkgdir}/usr/share/${_gitname}"
  mv "${pkgdir}/usr/tools" "${pkgdir}/usr/share/${_gitname}"
  mv "${pkgdir}/usr/contrib" "${pkgdir}/usr/share/${_gitname}"
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
