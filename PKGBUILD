# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_name=cursor
pkgbase="${_name}-electron"
pkgname=("$pkgbase"{,-latest})
pkgver=0.50.5
pkgrel=4
_desc="AI Code Editor "
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
depends=('ripgrep' 'xdg-utils' # system-wide runtimes
		'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
# electron* deps is saved at electron-store.txt, updpkgsums is needed
makedepends=('desktop-file-utils')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_hash="96e5b01ca25f8fbd4c4c10bc69b15f6228c80771"
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/1.100.2-1/code.sh")
source_aarch64=("${pkgver}-aarch64.img::https://downloads.cursor.com/production/${_hash}/linux/arm64/Cursor-${pkgver}-aarch64.AppImage")
source_x86_64=("${pkgver}-x86_64.img::https://downloads.cursor.com/production/${_hash}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
sha512sums=('937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')
sha512sums_aarch64=('22084dfcdb3dfa367d7289cb1561df40ea8a12e858630c83f2ccf306a5edde0e1365beeda25a853005e5de9da66ffd39be38764bca849b15045eea2c7094bf35')
sha512sums_x86_64=('bbfcdc6759a04e87ba24031566a4676f477821ad120f5a4ccb2348e4d0395d4660e27f90ad392f853abf7b7a4801c9807b4d5e099a245a237785a945173ed878')
options=(!strip)
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
	#rg -N -o -r '$1' '"electron": *"[^\d]*(\d+)' lib/cursor/package.json |tee "${srcdir}/electron-store.txt"
	cd lib/cursor/node_modules
	ln -svf /usr/bin/rg       @vscode/ripgrep/bin/rg
	ln -svf /usr/bin/xdg-open open/xdg-open
}
package_cursor-electron(){
	_electron=electron$(rg --no-messages -N -o -r '$1' '"electron": *"[^\d]*(\d+)' squashfs-root/usr/lib/cursor/package.json)
	depends+=($_electron) # breaks --printsrcinfo
	pkgdesc="${_desc} (system-wide electron)"
	cp -r --reflink=auto squashfs-root/usr "${pkgdir}/usr"
	sed "s|name=electron|name=${_electron}|" run.sh > run-safe.sh
	install -Dm755 run-safe.sh "${pkgdir}/usr/bin/cursor"
}

package_cursor-electron-latest(){
	depends+=(electron)
	pkgdesc="${_desc} (latest stable electron)"
	mv squashfs-root/usr "${pkgdir}/usr" # breaks --repackage
	install -Dm755 run.sh "${pkgdir}/usr/bin/cursor"
}
