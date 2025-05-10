# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

pkgname=cursor-electron
pkgver=0.50.0
pkgrel=1
pkgdesc="The AI Code Editor"
arch=('x86_64')
url="https://www.cursor.com"
license=('custom:Proprietary') #should be fixed
_elnum=34
depends=(electron${_elnum} ripgrep #replacements
'hicolor-icon-theme'  'libxkbfile')
optdepends=('electron: For /usr/share/cursor/cursor-latestron'
'vulkan-driver')
makedepends=(sed)
provides=(cursor)
conflicts=(cursor)
source=("src.iso::https://downloads.cursor.com/production/bbfa51c1211255cbbde8b558e014a593f44051f4/linux/x64/Cursor-${pkgver}-${arch}.AppImage"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('d49032ada9c7f405a0efb98db34abdb87de26d297ae43c2a9a75009806ec184e'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')
options=(strip)
prepare() {
	chmod +x src.iso;./src.iso --appimage-extract > /dev/null
	# Verify version of electron
	echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' squashfs-root/usr/share/cursor/resources/app/package.json) with $(cat /usr/lib/electron${_elnum}/version)
	echo 'Ask packager to fix if "major" version is wrong.'
}
_app=/usr/share/cursor/resources/app
build() {
	sed -e "s|code-flags|cursor-flags|" code.sh \
		-e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
		-e "s|/usr/lib/code/code.mjs|--app=${_app}|" > run.sh
	sed -e s/name=electron/name=electron${_elnum}/ run.sh > run-safe.sh
	# ripgrep
	ln -svf /usr/bin/rg squashfs-root/usr/share/cursor/resources/app/node_modules/@vscode/ripgrep/bin/rg
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
