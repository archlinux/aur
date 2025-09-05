# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=1.5.11
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
# electron* is added at package()
depends=('ripgrep' 'xdg-utils'
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_commit=2f2737de9aa376933d975ae30290447c910fdf46 # sed'ded at GitHub WF
source=("https://downloads.cursor.com/production/2f2737de9aa376933d975ae30290447c910fdf46/linux/x64/deb/amd64/deb/cursor_1.5.11_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('7c00f358bc37bbc49150f9e12507c6903c3a550358af2690597d07f41b60c643067484f7458c23048ad9e317461cf3bd3df0d400a1c66431466c8f64ba0079f0'
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
