# Maintainer: sukanka <su975853527 at gmail.com>
pkgname=tradingview-bin
_pkgname=tradingview
pkgver=1.0.10
_snapver=21
pkgrel=1
pkgdesc="Track all markets"
arch=('x86_64')
url="https://www.tradingview.com/desktop/"
license=('unknown')
depends=('electron')
provides=(${_pkgname})
makedepends=('squashfs-tools')
source=("${_pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_${_snapver}.snap"
${_pkgname}.sh
)
sha512sums=('e854753c942a1d21509d0d39c1f4466860f7617df7a9b7c0944b00f3fb9c9c9c77bcc8563bf0b75bc502ab38a4d5f20a00542d84b170020edcd1bc0c0f2b5cd9'
            '241971af1b52a147a860ad43802897337baa81a04f3a51c88f9ff669cb1b937bc69b805312fa49ac53c8bec01159ae4e396b7bc85b4a550a6a5b2f2269f4844f')


## run these to get the source URL and the version, require jq

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/tradingview | jq '.download_url' -r

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/tradingview | jq '.version' -r

prepare() {
  cd $srcdir
  unsquashfs -f "${_pkgname}-${pkgver}.snap" resources/app.asar \
      resources/app.asar.unpacked \
     /meta/gui/${_pkgname}.desktop \
     /meta/gui/icon.png
  sed "s|\${SNAP}/meta/gui/icon.png|${_pkgname}|g" -i squashfs-root/meta/gui/${_pkgname}.desktop
}

package() {
  cd $srcdir/squashfs-root
  install -Dm0644 meta/gui/${_pkgname}.desktop	$pkgdir/usr/share/applications/${_pkgname}.desktop
  install -Dm0644 meta/gui/icon.png				$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
  install -Dm0755 resources/app.asar			$pkgdir/usr/lib/${_pkgname}/app.asar
  install -Dm755 $srcdir/${_pkgname}.sh         $pkgdir/usr/bin/${_pkgname}
  cp -rf resources/app.asar.unpacked            $pkgdir/usr/lib/${_pkgname}/
}
