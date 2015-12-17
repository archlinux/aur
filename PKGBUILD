pkgname=tagspaces
pkgver=2.0.4
pkgrel=1
pkgdesc="TagSpaces is an open source personal data manager. It helps you organize files with tags on every platform."
arch=("i686" "x86_64")
url="http://tagspaces.org"
license=("AGPL")
depends=("node-webkit")
makedepends=("gendesk")
sha256sums=("b556ddb3b2d1558693c96562391e931f66e49ddba40ad56508f4dc2679c8ed7e"
            "6229505d15e9629be2a54db583e0822becfb8702bfb7a3d47acb746782fc0e2a")
source=("https://github.com/uggrock/tagspaces/archive/v${pkgver}.tar.gz"
        "patch")

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec='nw /opt/'${pkgname}'/data/node-webkit/'
  echo "nw /opt/${pkgname}/data/node-webkit/" > $pkgname
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/${source[1]}
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
