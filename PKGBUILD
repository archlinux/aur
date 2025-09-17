# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=1.6.26
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
# electron* is added at package()
depends=('ripgrep' 'xdg-utils'
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_commit=6af2d906e8ca91654dd7c4224a73ef17900ad735 # sed'ded at GitHub WF
source=("https://downloads.cursor.com/production/6af2d906e8ca91654dd7c4224a73ef17900ad735/linux/x64/deb/amd64/deb/cursor_1.6.26_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('a6eb038ba9ac027cf2d9f05362c1bd2af7da3d88fcb1965212272a43aab72d1d2019b465393f7df1f91311db67c741b5f409d0c754ed090b0bc8f0715f8a441b'
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
