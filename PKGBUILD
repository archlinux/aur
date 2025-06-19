# Maintainer: Focshole <Focshole@contact-me-on-aur-only>
# I will not be super active, I apologize in advance
pkgname=python-bitwarden-sdk
pkgver=1.0.0
pkgrel=1
pkgdesc="Python client for the Bitwarden SDK"
arch=('any')
url="https://github.com/bitwarden/sdk-sm"
license=('custom:Bitwarden-SDK')
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-maturin' 'rust' 'cargo')
source=(
    "https://files.pythonhosted.org/packages/dd/03/11934ae9d668283895286872a7af3de25d324ec9ac86da5a56ac9dc48544/bitwarden_sdk-$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/bitwarden/sdk-sm/tags/python-v$pkgver/LICENSE"
    "fix-license.patch"
)

sha256sums=(
    '846bc84ebc29ba326211e6552e628cd7d000a986ef35552ffda9d10bde913e21'
    'bdc13b9edca6f4b4241e5a3091bf1f99c2bb1dd925f30db2bbeebf32a01dc10f'
    'e8a56ca2d5b5f6c0646ea36457f36deeefabc70669c5853dbd6058242dd21113'
)

prepare() {
  cd "$srcdir/bitwarden_sdk-$pkgver"
  # Applying fix from https://github.com/bitwarden/sdk-sm/pull/1221/files to add the license
  cp "$srcdir/LICENSE" .
  patch -p0 < "$srcdir/fix-license.patch"
}

build() {
  cd "$srcdir/bitwarden_sdk-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/bitwarden_sdk-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
