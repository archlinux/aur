# Maintainer: Jeremy Hibiki <JeremyJiang430@outlook.com>

pkgname=cursor-beta-bin
pkgver=2.0.43
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
_commit=8e4da76ad196925accaa169efcae28c45454cce3
source=("${_appimage}::https://downloads.cursor.com/production/8e4da76ad196925accaa169efcae28c45454cce3/linux/x64/Cursor-2.0.43-x86_64.AppImage"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('1af961dd9d5916ebf69af28f1a47fc30dbd4dea00acc16cecdf44b48105ec75afe99db8ae980bc535fac583c9e689f3583deb62fb6194c297ad21d6e7dbb1588'
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
