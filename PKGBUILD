# Maintainer: sukanka <su975853527 at gmail.com>
pkgname=tradingview-bin
_pkgname=tradingview
pkgver=1.0.14
_snapver=25
_electron=electron18
pkgrel=1
pkgdesc="Track all markets"
arch=('x86_64')
url="https://www.tradingview.com/desktop/"
license=('unknown')
depends=("${_electron}" 'libsecret')
provides=(${_pkgname})
makedepends=('squashfs-tools')
source=("${_pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_${_snapver}.snap"
${_pkgname}.sh
)
sha512sums=('35dad0ea64b364ce3e048540d9cc48289be61b2b53ecee0956f04dfe14df206bdc8dfb9fca117d58e34ed5801c9e557ce0bb2aca0769775676bfc5ad194c8fb0'
            '77475260093aa86dba3cb682c2964d9b390c7a1ba2ef967388beb2aef45c83bf45e1cbaaa19ed2193aedfaeea55fe4be6779477f3983314cc910753f11d67603')


## run these to get the source URL and the version, require jq

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/tradingview | jq '.download_url' -r

# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/tradingview | jq '.version' -r

prepare() {
  cd $srcdir
  sed -i "s|@ELECTRON@|${_electron}|g" ${_pkgname}.sh
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
