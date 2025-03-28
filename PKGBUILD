# Maintainer: TheCyberArcher <thecyberarcher@protonmail.ch>
# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-desktop
pkgver=2.1.2
pkgrel=1
pkgdesc="An Electron app that provides a native Apple Music experience for Linux & Windows."
arch=('x86_64')
url="https://github.com/Alex313031/apple-music-desktop"
license=('BSD-3-Clause')
depends=(alsa-lib
         at-spi2-core
         bash
         cairo
         dbus
         electron
         expat
         gcc-libs
         glib2
         gtk3
         hicolor-icon-theme
         libcups
         libdrm
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxrandr
         mesa
         nspr
         nss
         pango)
makedepends=('npm' 'nvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('080dea32f1ef53a11868700dc2f1781b3f6fafe1e0b73d813b86e3eb9138cdc9'
            '336945e159e2d00c497bfcfef4d31af3b6f620a2fd6b62bc2ad92c7afadd8110'
            'e0bf199faf01e3ea79b845214408ad3852e260d73a2e0f5be437989646c2f169')

_ensure_local_nvm() {
	# let's be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# The init script returns 3 if version specified
	# in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	_ensure_local_nvm
	cd "$pkgname-$pkgver"
	nvm install
}

build() {
	_ensure_local_nvm
	cd "$pkgname-$pkgver"
	npm install --cache "${srcdir}/npm-cache"
	npm run build
}

package() {
	install -Dm755 "$pkgname.sh" "${pkgdir}/usr/bin/$pkgname.sh"
	install -Dm644 "$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname-$pkgver/assets/README.txt" "${pkgdir}/usr/share/doc/$pkgname/README.txt"
	cd $pkgname-$pkgver/dist/linux-unpacked
	find . -type f -exec install -Dm644 "{}" "${pkgdir}/opt/$pkgname/{}" \;
	install -Dm755 "apple-music" "${pkgdir}/opt/$pkgname/apple-music"
	cd ../../assets
	for _icons in $(find . -name "*x*.png");do
		install -Dm644 "$_icons" \
		"${pkgdir}/usr/share/icons/hicolor/${_icons%.png}/apps/$pkgname.png"
	done
}
