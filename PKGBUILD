# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=1.5.9
pkgrel=18
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
# electron* is added at package()
depends=('ripgrep' 'xdg-utils'
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_commit=de327274300c6f38ec9f4240d11e82c3b0660b29 # sed'ded at GitHub WF
source=("https://downloads.cursor.com/production/de327274300c6f38ec9f4240d11e82c3b0660b29/linux/x64/deb/amd64/deb/cursor_1.5.9_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('3d30150e4868b80ef6aeb012ffdb5e281ed41e3651f2b32f3d92baa284d990c11932df5c483d2eafc7ef48a1dd1047f888503bbe1f8906c8087fe1452dbe2e3b'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')

_app=usr/share/cursor/resources/app
package() {
  # Exclude electron
  bsdtar -xf data.tar.xz --exclude 	'usr/share/cursor/[^r]*' --exclude 'usr/share/windsurf/*.pak'
  mv usr/share/zsh/{vendor-completions,site-functions}
  ln -svf /usr/bin/rg ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open

  # Electron version determined during build process
  _electron=electron34
  echo $_electron
  depends+=($_electron)
  mv usr "${pkgdir}"/usr
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|--app=/${_app}|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor

  # Fix native title bar
  # https://github.com/cursor/cursor/issues/3108
  sed -i 's|l\.frame=!1|(!On(o, i?.forceNativeTitlebar ? "native" : void 0) \&\& (l.frame = !1))|g' "${pkgdir}"/usr/share/cursor/resources/app/out/main.js
}
