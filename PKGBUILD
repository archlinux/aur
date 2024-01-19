# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Partially adapted from https://github.com/wasta-linux/lameta-snap
pkgname=lameta
pkgver=2.2.4_alpha
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
	jq # Used to fix version string
	npm
	yarn
	asar
)
source=(
	"https://github.com/onset/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
	'lameta.desktop'
)
sha256sums=('4db4a27efaaa67963fe1b5a10035607dfb169e258dccd52914e22ef1fa01bf7d'
            '874e1acc986076e9c876c6ccd2efc7ee0dcda322733c018fb8e3d0bf010b8791')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	echo -e 'logFilters:\n  - code: "YN0013"\n    level: "discard"' >> .yarnrc.yml
	tmp=$(mktemp)
	jq --arg v "${pkgver//_/-}" '.version = $v' package.json > "$tmp" && mv "$tmp" test.json
  export NODE_ENV=production
	_ver="$(</usr/lib/${_electron}/version)"
	yarn install --immutable
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	yarn run build
	export NODE_ENV=production
	_ver="$(</usr/lib/${_electron}/version)"
	local i686=ia32 x86_64=x64
	./node_modules/.bin/electron-builder \
	  --linux --"${!CARCH}" --dir \
    --config.electronDist=/usr/lib/"$_electron" \
    --config.electronVersion="$_ver"
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
  install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
  cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/$pkgname "\$@"
EOD
  du -h -d0 "$(dirname "$srcdir/../")"
}
