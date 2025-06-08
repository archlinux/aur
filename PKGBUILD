# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_name=cursor
pkgbase="${_name}-electron"
pkgname=("$pkgbase"{,-latest})
_api='https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=latest'
pkgver=$(curl -Ls "$_api"|grep -oP '"version":"\K[^"]+')
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
_electron=electron34 # for --printsrcinfo
depends=('ripgrep' 'xdg-utils' # electron* is added at package()
		'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
makedepends=('desktop-file-utils')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_commit=$(curl -Ls "$_api"|grep -oP '"commitSha":"\K[^"]+')
_code=1.100.2-1
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/${_code}/code.sh")
source_aarch64=("${pkgver}-aarch64.img::https://downloads.cursor.com/production/${_commit}/linux/arm64/Cursor-${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgver}-x86_64.img::https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
sha512sums=('937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')
sha512sums_aarch64=('4f0619e4cd99931f16ff97a3f7c72cdbadebbc0c1a86e3177dcab17f4773990d193defdefb225e0b502cefa9bd8e59cf98466a5614f01864a3f8abe6a4c70b46')
sha512sums_x86_64=('a5458bd09eb3f6eaa6970ce316180d82f39f7ed541705cd55083886b1c6c253205e5d2ff359aaa74dd2fd3c386c51b1e89184662308eb2e581b200c624712c4b')
options=(!strip) # for ext?
prepare() { # Create cp -r friendly layout with FHS
	sed -e "s|code-flags|cursor-flags|" -e "s|lib/code|lib/cursor|" -e "s|/usr/lib/code/code.mjs|--app=/usr/lib/cursor|" code.sh > run.sh
	rm -rf squashfs-root # for unclean build
	chmod +x "${pkgver}-${CARCH}.img"; ./"${pkgver}-${CARCH}.img" --appimage-extract > /dev/null
 	cd squashfs-root/usr
 	# Fin desktop entries
	desktop-file-edit --set-key Icon --set-value cursor share/applications/cursor.desktop
	desktop-file-edit --set-key Exec --set-value cursor share/applications/cursor.desktop
	desktop-file-edit --set-key Exec --set-value 'cursor --open-url' share/applications/cursor-url-handler.desktop
	# Shell completions
	mv -v share/zsh/{vendor-completions,site-functions}
	# Replace bundled runtimes
	mv share/cursor/resources/app lib/cursor
	rm -r share/cursor
	cd lib/cursor/node_modules
	ln -svf /usr/bin/rg       @vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open open/xdg-open
}
_desc="AI Code Editor on "
package_cursor-electron-latest(){
	depends+=(electron)
	pkgdesc="${_desc}latest stable electron"
	cp -r --reflink=auto squashfs-root/usr "${pkgdir}/usr"
	install -Dm755 run.sh "${pkgdir}/usr/bin/cursor"
}

package_cursor-electron(){
	_electron=electron$(rg --no-messages -N -o -r '$1' '"electron": *"[^\d]*(\d+)' squashfs-root/usr/lib/cursor/package.json)
	echo $_electron
	depends+=($_electron)
	pkgdesc="${_desc}system electron"
	cp -r --reflink=auto squashfs-root/usr "${pkgdir}/usr"
	sed "s|name=electron|name=${_electron}|" run.sh > run-safe.sh
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/cursor"
}
