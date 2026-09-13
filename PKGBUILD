# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Ainola
# Contributor: Ethan Schoonover

# shellcheck disable=SC2034

pkgname=gam
pkgver=7.48.07
pkgrel=2
pkgdesc="command line management for Google Workspace"
arch=('any')
url="https://github.com/GAM-team/GAM"
license=('Apache-2.0')
replaces=('gamadv-xtd3')
conflicts=('gam-git')
depends=(
    'python>=3.10'
    'python-arrow'
    'python-dateutil'
    'python-distro'
    'python-chardet'
    'python-cryptography'
    'python-dnspython'
    'python-filelock'
    'python-google-api-python-client'
    'python-google-auth-httplib2'
    'python-google-auth-oauthlib'
    'python-google-auth'
    'python-httplib2'
    'python-lxml'
    'python-passlib'
    'python-pathvalidate'
    'python-pysocks'
)
optdepends=('yubikey-manager: For Yubikey support')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=(
  "${pkgname^^}-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "gam.sh"
)

sha256sums=('1f375e491e8adf6486c2da72bc308a142fb9849630c57b10ddb610e5ccaf2817'
            'f8613546b8d4a51f05342d3680553c20a2e0995c3be90e469f1da3bb83ca172e')

prepare() {
  cd "${pkgname^^}-$pkgver"
  sed -i 's/hatchling<1.30.0/hatchling/g' pyproject.toml
}

build() {
  cd "${pkgname^^}-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname^^}-$pkgver"

  install -d -m 0755 "$pkgdir/usr/share/$pkgname"
  install -d -m 0755 "$pkgdir/usr/share/doc/$pkgname"

  cp -a src/gam src/tools "$pkgdir/usr/share/$pkgname/"
  cp -a wiki "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm755 \
    src/gam.py -t "$pkgdir/usr/share/$pkgname"

  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 \
    src/gam.spec \
    src/gam.wxs \
    src/GamCommands.txt \
    src/GamUpdate.txt -t "$pkgdir/usr/share/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md src/callgam.py "$pkgdir/usr/share/doc/$pkgname"

  install -Dm755 ../gam.sh "$pkgdir/usr/bin/gam"

}
