# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=1.5.5
pkgrel=3
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
# electron* is added at package()
depends=('ripgrep' 'xdg-utils'
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_appimage="${pkgname}-${pkgver}.AppImage"
_commit=823f58d4f60b795a6aefb9955933f3a2f0331d7b
source=("${_appimage}::https://downloads.cursor.com/production/823f58d4f60b795a6aefb9955933f3a2f0331d7b/linux/x64/Cursor-1.5.5-x86_64.AppImage"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('3ff6d83458f33bbebef47255654bdb82256165b8704da168fd4e22cbd93419c8b27d11d510ee0a633d69e1f149b69ce7dc887fc0bc34365e878af456fc2ec71f'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')

_app=usr/share/cursor/resources/app
package() {
  rm -rf squashfs-root
  chmod +x ${_appimage}
  # Don't use upstream's broken resources
  for _f in co.anysphere.cursor.png usr/bin usr/share/{appdata,applications,bash-completion,mime,zsh}
    do ./${_appimage} --appimage-extract $_f > /dev/null
  done
  ./${_appimage} --appimage-extract usr/share/cursor/resources/app > /dev/null
  cd squashfs-root
  mv usr/share/zsh/{vendor-completions,site-functions}
  install -Dm644 co.anysphere.cursor.png -t usr/share/pixmaps
  ln -svf /usr/bin/rg ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open

  # Electron version determined during build process
  _electron=electron34
  echo $_electron
  depends+=($_electron)
  mv usr "${pkgdir}"/usr
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|--app=/${_app}|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
}
