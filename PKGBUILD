# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=spiderfoot
pkgver=2.12.0
_verpostfix="-final"
pkgrel=1
pkgdesc="SpiderFoot is an open source intelligence automation tool. Its goal is to automate the process of gathering intelligence about a given target."
arch=('any')
url="http://www.spiderfoot.net/"
license=('GPLv2')
depends=( 'python2' 'python2-m2crypto' 'python2-netaddr' 'python2-dnspython' 'python2-cherrypy' 'python2-mako' 'python2-pysocks' 'python2-pypdf2' 'python2-stem'  'python2-bs4' 'python2-phonenumbers')
makedepends=('python2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/smicallef/spiderfoot/archive/v${pkgver}-final.tar.gz"
	"spiderfoot.sh"
	"spiderfoot.service")
sha256sums=('93946fb8ff8b53fae53187ea5ff7a09da07da0e09c29480d52fe78b0524cbcb7'
            '2246fe34cd61433a35cd49f2d6d18a6a66fd714014c6c703d1f1f29e3b2a5007'
            'fe22ab59b2e6b118c3d7fdeb7da2ca8489379810acae713519a48a651c62774e')

build() {
  cd "${pkgname}-${pkgver}${_verpostfix}"
  # Add shebang because derp who wrote this is a windows silly goose
  for file in *.py;do
    sed -i '1s/^/#!\/usr\/bin\/python2\n/' ${file}
  done
  python2 -m compileall *.py
}


package() {
  cd "${pkgname}-${pkgver}${_verpostfix}"
  mkdir -p "${pkgdir}/usr/share/spiderfoot"
  #mkdir -p "${pkgdir}/usr/bin"
  cp -r * "${pkgdir}/usr/share/spiderfoot"
  install -Dm755 "${srcdir}/spiderfoot.sh" "${pkgdir}/usr/bin/spiderfoot"
  install -Dm644 "${srcdir}/spiderfoot.service" "${pkgdir}/usr/lib/systemd/system/spiderfoot.service"
}

