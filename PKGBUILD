# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=2.0.43
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
_electron=electron34
depends=('xdg-utils' $_electron
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip) # Don't break ext of VSCode
_commit=8e4da76ad196925accaa169efcae28c45454cce3 # sed'ded at GitHub WF
source=("https://downloads.cursor.com/production/8e4da76ad196925accaa169efcae28c45454cce3/linux/x64/deb/amd64/deb/cursor_2.0.43_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh
rg.sh)
sha512sums=('186edbc0050ab39f35c642b746b496a22869ca970d45940d96a2d8f49a4914148edafd00d03bbdce11fc0a90038d62ced2179f726c301a4a6981f4ec6e4daba2'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37' 'SKIP')

_app=usr/share/cursor/resources/app
package() {
  # Exclude electron
  tar -xf data.tar.xz -C "$pkgdir" --exclude 'usr/share/cursor/[^r]*' --exclude 'usr/share/cursor/*.pak'
  cd "$pkgdir"
  mv usr/share/zsh/{vendor-completions,site-functions}
  install -Dm755 "${srcdir}/rg.sh" ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -sf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|--app=/${_app}|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor
}
