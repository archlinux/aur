# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_name=cursor
pkgbase="${_name}-electron"
pkgname=("$pkgbase"{,-latest,35})
pkgver=0.51.1
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
_hash=a9dd46cbd249a30044eaae1526eb6ca1ec2f7568
_code=1.100.2-1
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/${_code}/code.sh")
source_aarch64=("${pkgver}-aarch64.img::https://downloads.cursor.com/production/${_hash}/linux/arm64/Cursor-${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgver}-x86_64.img::https://downloads.cursor.com/production/${_hash}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
sha512sums=('937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')
sha512sums_aarch64=('2ff0cafb6e271fd0399e7e6e8cff9292270ea6658db598354feb758dfe1cd5c8d9dd2e1b168882b7aef205c5c95584b0e1d030ea98606adff95b1125ebd785d2')
sha512sums_x86_64=('8bc0cfd45374f744236ea4a18960d5d67467a38c001ee888cd6e2bced64add2a86bb5e972ede5011e219b6b60c44f8133ce17fa8dc30bfb78e3e7e842e0c34af')
options=(!strip) # for ext?
prepare() { # Create cp -r friendly layout with FHS
	sed -e "s|code-flags|cursor-flags|" -e "s|lib/code|lib/cursor|" -e "s|/usr/lib/code/code.mjs|--app=/usr/lib/cursor|" code.sh > run.sh
	rm -rf squashfs-root # clean cache
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

package_cursor-electron35(){
	depends+=(electron35)
	pkgdesc="${_desc}electron35"
	mv squashfs-root/usr "${pkgdir}/usr" # breaks --repackage
	sed "s|name=electron|name=electron35|" run.sh > run-safe.sh
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/cursor"
}
