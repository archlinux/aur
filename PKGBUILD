# Maintainer: Gunther Schulz <dev@guntherschulz.de>

pkgname=cursor-bin
pkgver=2.5.22
pkgrel=1
pkgdesc='AI-first coding environment'
arch=('x86_64')
url="https://www.cursor.com"
license=('LicenseRef-Cursor_EULA')
_electron=electron
depends=(xdg-utils ripgrep $_electron nodejs
  'gcc-libs' 'hicolor-icon-theme' 'libxkbfile')
options=(!strip !debug) # Don't break ext of VSCode
_commit=0eda506a36f70f8dc866c1ea642fcaf620090083
source=("https://downloads.cursor.com/production/${_commit}/linux/x64/deb/amd64/deb/cursor_${pkgver}_amd64.deb"
https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh rg.sh)
sha512sums=('SKIP'
  '937299c6cb6be2f8d25f7dbc95cf77423875c5f8353b8bd6cd7cc8e5603cbf8405b14dbf8bd615db2e3b36ed680fc8e1909410815f7f8587b7267a699e00ab37'
  'e79fe7659f59d1ae02fc68816399bfd31587315df6cdb6ccf1d0ca76f7cdc692c2a42b30591c0091147bd97ef14b1c7745dc26bd7cb3ea6bba45698e5044fa2a')
sha512sums[0]=c77cac3c2fa807a1932a258399ad01e8a34d15cd473fa88ab579d9e4714be65dd5347fc3d7955b411fb5627c85633fdf6aacd6921740513f4ae9999ec2072ea5
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
  sed -e "s|code-flags|cursor-flags|" -e "s|/usr/lib/code|/${_app}|" -e "s|/usr/lib/code/code.mjs|--app=/${_app}|" \
    -e "s|name=electron|name=${_electron}|" "${srcdir}"/code.sh | install -Dm755 /dev/stdin "${pkgdir}"/usr/share/cursor/cursor
  install -d "$pkgdir"/usr/bin
  ln -sf /usr/share/cursor/cursor "$pkgdir"/usr/bin/cursor
}
