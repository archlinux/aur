# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=3.26.13
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
# upstream uses Electron newer than internal VSCode
_electron=electron42
depends=(xdg-utils ripgrep $_electron nodejs
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip !debug) # Don't break ext of VSCode
_commit=3bfec373749d3d4a53a151283022d49743ab50ba
source=("https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${pkgver}_amd64.deb"
"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code."{sh,mjs}
rg.sh)
sha512sums=('SKIP'
  '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37'
  '793f9ff6306e3992ac89802d98110cba288ea1181a901467333293b7d76182ef9792c2a39ff49d9347a18a174b1f42bc58862091dff583f4146c2704eea28033'
  'e79fe7659f59d1ae02fc68816399bfd31587315df6cdb6ccf1d0ca76f7cdc692c2a42b30591c0091147bd97ef14b1c7745dc26bd7cb3ea6bba45698e5044fa2a')
sha512sums[0]=b64785b2135202fda0df413ef865f9d4137a55616fc4957e3b5a53f00da53c8d1c88e1e4e0022cc641bf926fab3fde6c17c62229c2d7ad5515983db358497fbd
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
  sed -e "1s|.*|#!/usr/lib/${_electron}/electron|" \
      -e "s|code-oss|cursor|g" -e "s|code.mjs|cursor.mjs|g" \
    "${srcdir}"/code.mjs | install -Dm644 /dev/stdin "${pkgdir}/${_app}/cursor.mjs"
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|/${_app}/cursor.mjs|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor
}
