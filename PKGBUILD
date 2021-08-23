# Maintainer: Bao <qubidt at gmail dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta
_pkgname=zotero-beta
pkgver=5.0.97beta.38
pkgrel=2
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64' 'i686')
url="https://www.zotero.org/support/dev_builds"
conflicts=('zotero')
provides=('zotero')
license=('AGPL3')
depends=(
	'aarch64-linux-gnu-gcc'
	'atk'
	'cairo'
	'dbus'
	'dbus-glib'
	'desktop-file-utils'
	'fontconfig'
	'freetype2'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gnupg'
	'gtk3'
	'harfbuzz'
	'hicolor-icon-theme'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxcursor'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxi'
	'libxrender'
	'libxt'
	'nss'
)
source=('zotero-absolute-path-fix.patch'
        'zotero-disable-update.patch'
        'zotero-desktop-mimetype-fix.patch')
source_x86_64=("Zotero-${pkgver}_linux_x86_64.tar.bz2::https://www.zotero.org/download/client/dl?channel=beta&platform=linux-x86_64")
source_i686=("Zotero-${pkgver}_linux_i686.tar.bz2::https://www.zotero.org/download/client/dl?channel=beta&platform=linux-i686")
sha256sums=('7b23d5238430701c1f5cc6f81dfd9b9f67cc643d506e42aa0e62aba5a58191fa'
            '94211568bbd206d10f1c1e0a2565905fcd27c8586835b7aef6458e657caa8213'
            '09752d833320d195ce5f8a65ef900edcda85816c3de210a572871fdfbb92e97a')
sha256sums_x86_64=('72f16491fb311f1da9a7b9ed47b96463a629efb6ef28a9f603a17ee4f8b0b618')
sha256sums_i686=('00a92288922e129dc5fffb6716c35394165a2d4c171e0750949222c1186c74ee')

prepare() {
  patch --directory="Zotero_linux-$CARCH" --forward --strip=1 --input="${srcdir}/zotero-absolute-path-fix.patch"
  patch --directory="Zotero_linux-$CARCH" --forward --strip=1 --input="${srcdir}/zotero-desktop-mimetype-fix.patch"
  patch --directory="Zotero_linux-$CARCH" --forward --strip=1 --input="${srcdir}/zotero-disable-update.patch"
}

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/zotero,share/applications}
  mv "${srcdir}/Zotero_linux-${CARCH}"/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  ln -s /usr/lib/zotero/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop

  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
}
