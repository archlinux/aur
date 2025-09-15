# Maintainer: Jeremy Hibiki <JeremyJiang430@outlook.com>

pkgname=cursor-beta-bin
pkgver=1.6.22
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
_commit=0cc5b2dcee887155094cc3d879718855ac5414aa
source=("${_appimage}::https://downloads.cursor.com/production/0cc5b2dcee887155094cc3d879718855ac5414aa/linux/x64/Cursor-1.6.22-x86_64.AppImage"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('61ab7120c9ca12687fb313099ceaaa0f63fd20d84ac1a5bdda4e8894fc4f1c596919b969b9b662e052533fe5e759d7dcdcc1141e0370177fc2dca8167461f759'
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
