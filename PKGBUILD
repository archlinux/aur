# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=1.7.38
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
_electron=electron34
depends=('ripgrep' 'xdg-utils' $_electron
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_commit=fe5d1728063e86edeeda5bebd2c8e14bf4d0f96a # sed'ded at GitHub WF
source=("https://downloads.cursor.com/production/fe5d1728063e86edeeda5bebd2c8e14bf4d0f96a/linux/x64/deb/amd64/deb/cursor_1.7.38_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh)
sha512sums=('25bda2f65aca106b4ed7b311974441446917af0828826c25ee3b6d26e57cb8e8d4730b766beb326bcdb09e68a6bc072da9e3446c4baf7eebcdf15e5e44032b6f'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37')

_app=usr/share/cursor/resources/app
package() {
  # Exclude electron
  tar -xf data.tar.xz -C "$pkgdir" --exclude 'usr/share/cursor/[^r]*' --exclude 'usr/share/cursor/*.pak'
  cd "$pkgdir"
  mv usr/share/zsh/{vendor-completions,site-functions}
  echo -e '#!/bin/bash\nexec /usr/bin/rg "${@/--cursor-ignore/--ignore-file}"' \
    | install -Dm755 /dev/stdin ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -sf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|--app=/${_app}|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor
}
