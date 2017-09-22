# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=sabaki
pkgver=0.31.3
pkgrel=2
pkgdesc='An elegant SGF editor for the game of Go'
arch=('any')
url='http://sabaki.yichuanshen.de/'
license=('MIT')
makedepends=('npm')
install=${pkgname}.install
source=("https://github.com/yishn/Sabaki/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        'sabaki.xml')
md5sums=('cf374e056f2763585821c9535eef9f61'
         'b39f3b91292cb3983124bd38035fbd8e'
         'efbd547e892c7781a5ece702d389dd9e')

prepare() {
    # Hackishly revert electron from ^1.8.0 to 1.7.7
    # This should only be necessary until the next Sabaki release
    sed -i 's/electron\(.*\)\^1\.8\.0/electron\11.7.7/' \
        "${srcdir}/Sabaki-${pkgver}/package.json"
}

build() {
  cd $srcdir/Sabaki-$pkgver

  npm install --cache "${srcdir}/npm-cache"
  npm run build
}

check() {
  cd $srcdir/Sabaki-$pkgver
  npm test
}

package() {
  mkdir $pkgdir/opt

  cp -r $srcdir/Sabaki-$pkgver/dist/linux-unpacked $pkgdir/opt/Sabaki
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
