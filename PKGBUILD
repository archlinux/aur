# Maintainer:  oech3, Oops
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin at gmail dot com>

_name=cursor
pkgbase="${_name}-electron"
pkgname=("$pkgbase"{,-latest})
pkgver=1.1.3
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor')
_electron=electron34 # for --printsrcinfo
depends=('ripgrep' 'xdg-utils' # electron* is added at package()
		'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
makedepends=('desktop-file-utils')
optdepends=('code: use extensions at code-oss ?')
provides=("${_name}"{,-bin})
conflicts=("${_name}"{,-bin})
_commit=979ba33804ac150108481c14e0b5cb970bda3266
_code=1.100.3-1
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/${_code}/code.sh")
source_aarch64=("https://downloads.cursor.com/production/${_commit}/linux/arm64/Cursor-${pkgver}-aarch64.AppImage")
source_x86_64=("https://downloads.cursor.com/production/${_commit}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
sha512sums=('937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')
sha512sums_aarch64=('0b390b810e21fd8e1c5c89ec6e82e30433ba19a177af86b715fae239a307fcbeb5489dea885a9958cc7db01db065e81f0c7ca7e03521e19a62270cb71dfc3a39')
sha512sums_x86_64=('0604893f6f8f9ac15d93cb109876916a11bff790110315354da0efdaf0ac51a385fd4f6e027da27e50b08bedb572c805b29a2b27352ada1028a54f3d5bc3047b')
options=(!strip) # for ext?
prepare() { # Create cp -r friendly layout with FHS
  _api='https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=latest'
  echo pkgver=$pkgver
  echo latest=$(curl -Ls "$_api"|grep -oP '"version":"\K[^"]+'), commit=$(curl -Ls "$_api"|grep -oP '"commitSha":"\K[^"]+')

  sed -e "s|code-flags|cursor-flags|" -e "s|lib/code|lib/cursor|" -e "s|/usr/lib/code/code.mjs|--app=/usr/lib/cursor|" code.sh > run.sh
  rm -rf squashfs-root # for unclean build
  chmod +x Cursor-${pkgver}-${CARCH}.AppImage; ./Cursor-${pkgver}-${CARCH}.AppImage --appimage-extract > /dev/null
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
  ln -svf /usr/bin/rg       lib/cursor/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open lib/cursor/node_modules/open/xdg-open
  # Provide exts to code-oss
  install -d lib/code/extensions
  for f in lib/cursor/extensions/cursor-*;do
    ln -sv /usr/$f lib/code/extensions/
  done
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
