# Maintainer: Jeremy Hibiki <JeremyJiang430@outlook.com>

pkgname=cursor-beta-bin
pkgver=1.6.35
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
conflicts=('cursor-bin')
# electron* is added at package()
depends=('ripgrep' 'xdg-utils'
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_appimage="${pkgname}-${pkgver}.AppImage"
_commit=b753cece5c67c47cb5637199a5a5de2b7100c18f
source=("${_appimage}::https://downloads.cursor.com/production/b753cece5c67c47cb5637199a5a5de2b7100c18f/linux/x64/Cursor-1.6.35-x86_64.AppImage"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('bc8709e8c7b2a5ecc65275e62bc13fcfe6cc8fda26bbdfab00fc160811bacbccffcf4d0c5fbc57741e4f395832673a3154814624c63d9a028d7916a508ec9edf'
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
