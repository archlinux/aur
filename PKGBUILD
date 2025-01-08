# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Partially adapted from https://github.com/wasta-linux/lameta-snap
pkgname=lameta
pkgver=2.3.16_beta
_electron=electron27
pkgrel=1
pkgdesc="The Metadata Editor for Transparent Archiving of language document materials"
arch=('x86_64')
url="https://github.com/onset/lameta"
license=('MIT')
depends=(
  gcc-libs
  glibc
	bash
	"$_electron"
	nodejs
)
makedepends=(
	asar
	npm
	yarn
)
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	"${pkgname}.desktop"
  'no_node_pin.patch'
)
sha256sums=('8d4e890859d49e7df19a0918f2cae01778e5f11e90aaad9a3b2c0a78fad2c47d'
            '874e1acc986076e9c876c6ccd2efc7ee0dcda322733c018fb8e3d0bf010b8791'
            '7bc59aee62f8a77217d76ae42f6445ed51375f5c1c158c678aa56c208edbdc28')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	echo -e 'logFilters:\n  - code: "YN0013"\n    level: "discard"' >> .yarnrc.yml
  echo "Applying patch to unpin node and yarn versions"
  patch --forward --strip=1 --input="${srcdir}/no_node_pin.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  yarn
  yarn install --frozen-lockfile
  yarn build
  yarn lingui-compile
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
  install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
  cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOD
	echo "This build dir is rather large:"
  du -h -d0 "$(dirname "$srcdir/../")"
  echo "Maybe you should consider deleting it"
}
