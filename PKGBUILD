# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=3.0.16
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
_electron=electron
depends=(xdg-utils ripgrep $_electron nodejs
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip !debug) # Don't break ext of VSCode
_commit=a80ff7dfcaa45d7750f6e30be457261379c29b06
source=("cursor_${pkgver}_amd64.deb::https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.0"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.mjs rg.sh)
sha512sums=('5ced36d531d7f118f636bbbd8aa0d46a5eb11455516f1a7537361e953ef1c888bd9c0e47c350eca4c6e585f2683cf90448c0be87fe2870ea983b3bf3aaf34294'
            '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37'
            '793f9ff6306e3992ac89802d98110cba288ea1181a901467333293b7d76182ef9792c2a39ff49d9347a18a174b1f42bc58862091dff583f4146c2704eea28033'
            'e79fe7659f59d1ae02fc68816399bfd31587315df6cdb6ccf1d0ca76f7cdc692c2a42b30591c0091147bd97ef14b1c7745dc26bd7cb3ea6bba45698e5044fa2a')
noextract=(cursor_${pkgver}_amd64.deb) # avoid double tarball
_app=usr/share/cursor/resources/app
package() {
  # Exclude electron
  bsdtar -xOf ${noextract[0]} data.tar.xz | tar -xJf - -C "$pkgdir" \
    --exclude 'usr/share/cursor/[^r]*' --exclude 'usr/share/cursor/*.pak'
  cd "$pkgdir"
  mv usr/share/zsh/{vendor-completions,site-functions}
  ln -sf /usr/bin/node ${_app}/resources/helpers/node
  install -Dm755 "${srcdir}/rg.sh" ${_app}/node_modules/@vscode/ripgrep/bin/rg
  ln -sf /usr/bin/xdg-open ${_app}/node_modules/open/xdg-open
  sed -e "s|code-oss|cursor|g" -e "s|code.mjs|cursor.mjs|g" \
    "${srcdir}"/code.mjs | install -Dm644 /dev/stdin "${pkgdir}/${_app}/cursor.mjs"
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|/${_app}/cursor.mjs|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor
}
