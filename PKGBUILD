# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

pkgname=cursor-electron
pkgver=0.50.4
pkgrel=1
pkgdesc="The AI Code Editor (system-wide electron)"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom') #should be fixed
_elnum=34
depends=(electron${_elnum} ripgrep xdg-utils #replacements
hicolor-icon-theme libxkbfile)
optdepends=('electron: /usr/share/cursor/cursor-latestron'
'vulkan-driver')
makedepends=(sed)
provides=(cursor{,-bin})
conflicts=(cursor{,-bin})
_source=8ea935e79a50a02da912a034bbeda84a6d3d355d
source=("${pkgver}.iso::https://downloads.cursor.com/production/${_source}/linux/x64/Cursor-${pkgver}-${arch}.AppImage"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('8a4fb64ea991867cd733eaa8090f8a2d0916fdca994aa7194b63f6cae50f188f'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
#options=(!strip)
prepare() {
	chmod +x ${pkgver}.iso;./${pkgver}.iso --appimage-extract > /dev/null
	# Verify version of electron
	echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' squashfs-root/usr/share/cursor/resources/app/package.json) with $(cat /usr/lib/electron${_elnum}/version)
	echo 'Fix if "major" version is wrong.'
}
_app=/usr/share/cursor/resources/app
build() {
	sed -e "s|code-flags|cursor-flags|" code.sh \
		-e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
		-e "s|/usr/lib/code/code.mjs|--app=${_app}|" > run.sh
	sed -e s/name=electron/name=electron${_elnum}/ run.sh > run-safe.sh
	# Replacements
	ln -svf /usr/bin/rg squashfs-root/usr/share/cursor/resources/app/node_modules/@vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open squashfs-root/usr/share/cursor/resources/app/node_modules/open/xdg-open
}
package(){
	install -d "${pkgdir}"/usr/share/cursor/resources
	# Pick up resources
	mv squashfs-root/usr/share/{appdata,applications,bash-completion,mime,zsh} "${pkgdir}/usr/share"
	mv squashfs-root/usr/share/cursor/resources/app "${pkgdir}/usr/share/cursor/resources/app"
	# Icon
	install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/cursor.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/co.anysphere.cursor.png"
	# Launchers
	install -Dm755 run.sh "${pkgdir}/usr/share/cursor/cursor-latestron"
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/cursor"
	ln -sf /usr/bin/cursor "${pkgdir}/usr/share/cursor/cursor"
	# License
	install -Dm644 "${pkgdir}/usr/share/cursor/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
