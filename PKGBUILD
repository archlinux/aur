# Maintainer: Vaultdraw contributors <https://github.com/Vaultdraw/vaultdraw>
pkgname=vaultdraw-bin
_name=vaultdraw
pkgver=0.2.0
pkgrel=1
pkgdesc='Offline vault for Excalidraw drawings: your drawings in a folder you own'
arch=('x86_64')
url='https://vaultdraw.vercel.app'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'poppler-glib')
optdepends=('xdg-utils: open links and reveal files in the file manager')
provides=("$_name")
conflicts=("$_name")
options=('!strip' '!debug')
# LOCAL_DEB_DIR is for testing a package built on your machine; the AUR copy leaves it unset.
_base="${LOCAL_DEB_DIR:+file://$LOCAL_DEB_DIR}"
_base="${_base:-https://github.com/Vaultdraw/vaultdraw/releases/download/v${pkgver}}"
source_x86_64=("${_name}-${pkgver}-amd64.deb::${_base}/Vaultdraw_${pkgver}_amd64.deb")
# Filled by update.sh from the release's SHA256SUMS.
sha256sums_x86_64=('51e8a95bd33aa3a8128b047e6cf442a9283e88d65f333c3f88f6c59d753624d4')
noextract=("${_name}-${pkgver}-amd64.deb")

package() {
  local deb="${_name}-${pkgver}-amd64.deb"
  # A .deb is an ar archive; its data.tar.* holds the files that go to /.
  bsdtar -xOf "$srcdir/$deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
  # The bundler writes the desktop file as Vaultdraw.desktop; use the usual lowercase id.
  if [[ -f "$pkgdir/usr/share/applications/Vaultdraw.desktop" ]]; then
    mv "$pkgdir/usr/share/applications/Vaultdraw.desktop" "$pkgdir/usr/share/applications/vaultdraw.desktop"
  fi
  install -Dm644 "$pkgdir/usr/lib/Vaultdraw/licenses/Excalidraw-MIT.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
