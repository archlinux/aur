# Maintainer: Kushagra Sharma <tda@thedarkartist.in>
pkgname=tda-dsc-signer
pkgver=0.1.0   # keep equal to `version` in pyproject.toml
pkgrel=1
pkgdesc='Sign PDFs with Indian DSC USB tokens: GTK4 app and CLI with MCA form-field signing'
arch=(any)
_repo=https://github.com/TheDarkArtist/tda-dsc-signer
url=$_repo
license=(GPL-3.0-or-later)
depends=(
  python
  python-cairo
  python-gobject
  gtk4
  poppler-glib
  python-pyhanko              # AUR; pulls python-python-pkcs11, python-asn1crypto, python-uharfbuzz, python-fonttools, python-pillow
  python-python-pkcs11
  python-asn1crypto
  pcsclite
  ccid
  p11-kit
  nss                         # certutil, for `trust install`
  usbutils                    # lsusb, for `doctor`
)
makedepends=(python-build python-installer python-uv-build)
optdepends=(
  'opensc: fallback PKCS#11 module for generic tokens'
  'poppler: pdfsig, to check signatures against the dedicated trust database'
  'epass2003-sdk-linux: ePass2003 token driver (AUR, proprietary)'
  'sac-core: SafeNet Authentication Client driver (AUR, proprietary)'
  'libgtop11dotnet: GTOP11 token driver (AUR, proprietary)'
)
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$_repo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('4b5c9905383e2ff87ccbfa89a36a198726ef6571ff07815c1c2c419660ee7ce8' 'SKIP')   # tag archive; the .asc is checked by gpg
validpgpkeys=('0AD355085DF79157D5CD05C3F871B76C837E1BC4')   # Kushagra Sharma (AUR Package Signing Key)
install=$pkgname.install

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 data/in.tdacorp.DscSigner.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 data/in.tdacorp.DscSigner.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 data/in.tdacorp.DscSigner.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 docs/tda-dsc-signer.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 src/tda_dsc_signer/fonts/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL-NotoSans.txt"
}
