# Contributor: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=geforcenow-electron
pkgver=2.2.0
pkgrel=2
pkgdesc='Linux desktop client for GeForce NOW, using Electron'
arch=(any)
url='https://github.com/hmlendea/gfn-electron'
license=(GPL-3.0-only)
_electron=electron35
depends=(libva $_electron)
makedepends=(npm git)
source=("git+$url#tag=v$pkgver")
sha512sums=('be5fb6b056a895a771df7ab0850940dc5a25fd15e1624265a2914e0000e0465c43efed30a3ebeeff683bf8f2b7875b557ceb878b7878c5e3682130cc1bcb09c9')

prepare() {
	cd gfn-electron

	sed -i 's|Exec=.*|Exec=/usr/bin/geforcenow|' com.github.hmlendea.geforcenow-electron.desktop
	sed -i 's|Icon=.*|Icon=geforcenow-electron|' com.github.hmlendea.geforcenow-electron.desktop
}

build() {
	cd gfn-electron

	HOME="$srcdir/.electron-gyp" npm install

	./node_modules/.bin/electron-builder --linux --x64 --dir \
		-c.electronDist=/usr/lib/$_electron/ \
		-c.electronVersion=$(cat /usr/lib/$_electron/version)
}

package() {
	cd gfn-electron

	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	cp -r --preserve=mode "dist/linux-unpacked/resources/app" "$pkgdir/usr/lib/$pkgname"

	ln -s "/usr/lib/$pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/geforcenow-electron.png"
	install -Dm644 "com.github.hmlendea.geforcenow-electron.desktop" -t "$pkgdir/usr/share/applications/"

	echo -e "#!/usr/bin/bash\nexec $_electron /usr/lib/geforcenow-electron \"\$@\"" >"$pkgdir/usr/bin/geforcenow"
	chmod 755 "$pkgdir/usr/bin/geforcenow"
}
