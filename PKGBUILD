# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Partially adapted from https://github.com/wasta-linux/lameta-snap
pkgname=lameta
pkgver=2.3.0_alpha
_commit="05711bf10a8100fdb83e1b7a7bc823624832216f"
_electron=electron22
pkgrel=1
pkgdesc="The Metadata Editor for Transparent Archiving of language document materials"
arch=('x86_64')
url="https://github.com/onset/lameta"
license=('MIT')
depends=(
	bash
	"$_electron"
	nodejs-lts-hydrogen
)
makedepends=(
	asar
	npm
	yarn
)
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/${_commit}.zip"
	# This will work when they fix https://github.com/onset/lameta/issues/50
  #"${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	"${pkgname}.desktop"
  'no_node_pin.patch'
)
sha256sums=('ca9307b1418caa729658476cee5caed6e1c4a8fa385c6948524e75302dcb0870'
            '874e1acc986076e9c876c6ccd2efc7ee0dcda322733c018fb8e3d0bf010b8791'
            '7bc59aee62f8a77217d76ae42f6445ed51375f5c1c158c678aa56c208edbdc28')

prepare() {
  mv "${srcdir}/${pkgname}-$_commit" "${srcdir}/${pkgname}-${pkgver//_/-}"
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	echo -e 'logFilters:\n  - code: "YN0013"\n    level: "discard"' >> .yarnrc.yml
	sed -i -e 's/translateChoice(s, this\.props\.field\.definition\.key)/translateChoice(s)/' \
		src/components/ClosedChoiceEdit.tsx
  echo "Applying patch to unpin node and yarn versions"
  patch --forward --strip=1 --input="${srcdir}/no_node_pin.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  yarn
  yarn build
  yarn install --frozen-lockfile
	./node_modules/.bin/electron-builder \
	  --linux --x64 --dir \
    --config.electronDist=/usr/lib/"$_electron"
}

package() {
	cd "${srcdir}"
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  install -Dm644 "LICENSE" \
   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "assets/icon.png" \
		"$pkgdir/usr/share/icons/$pkgname/$pkgname.png"
	install -dm755 "${pkgdir}/var/log/lameta"
  install -d "$pkgdir/usr/lib/$pkgname/"
  asar e "release/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
  rm -R "${pkgdir}/usr/lib/$pkgname/node_modules/ffprobe-static/bin/darwin"
  rm -R "${pkgdir}/usr/lib/$pkgname/node_modules/ffprobe-static/bin/linux/ia32"
  rm -R "${pkgdir}/usr/lib/$pkgname/node_modules/flatted/python/"
  install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
  cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOD
	echo "This build dir is rather large:"
  du -h -d0 "$(dirname "$srcdir/../")"
  echo "Maybe you should consider deleting it"
}
