# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=tagspaces
pkgver=2.1.2
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("i686" "x86_64")
url="http://tagspaces.org"
license=("AGPL")
depends=("node-webkit")
makedepends=("gendesk" "npm")
sha256sums=('00665595b6b2b63b7792271219ac88808bcc5b2cd41cbefd59af7e92b8010d6c'
            '5b7605288e221a852a9d7138efbccf15ca524607074b663527ce32e159a49596')
source=("https://github.com/uggrock/tagspaces/archive/v${pkgver}.tar.gz"
        "patch")

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec='nw /opt/'${pkgname}'/data/node-webkit/'
  echo "nw /opt/${pkgname}/data/node-webkit/" > $pkgname
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/${source[1]}
}

build() {
  (
  cd $srcdir/${pkgname}-${pkgver}/data
  npm install bower
  ./node_modules/bower/bin/bower install
  )
}

package() {
  msg2 "create path and copy files"
  mkdir -p $pkgdir/opt/${pkgname}
  cp -R $srcdir/${pkgname}-${pkgver}/* $pkgdir/opt/${pkgname}
  sed -i "s/@@VERSION.@@BUILD.@@BID/${pkgver}-${pkgrel}/g" $pkgdir/opt/tagspaces/data/about.html
  sed -i "s/@@VERSION.@@BUILD/${pkgver}/g" $pkgdir/opt/tagspaces/data/about.html
#  patch -d $pkgdir/opt/tagspaces -p1 < patch.patch
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/data/assets/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
