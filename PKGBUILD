# Maintainer: Fredrik Engstrand <fredrik@engstrand.nu>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=python-pywalfox
_name=pywalfox
pkgver=2.7.4
pkgrel=1
pkgdesc="Native app used alongside the Pywalfox browser extension"
arch=('any')
url='https://github.com/frewacom/pywalfox'
license=('MPL2')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
sha256sums=('59e73d7e27389574fb801634e03d8471f09bfe062865cad803f68c456680ed66')

prepare() {
    cd $_name-$pkgver
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    sed -i "s:<path>:$site_packages/pywalfox/bin/main.sh:" pywalfox/assets/manifest.json
}

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 pywalfox/assets/manifest.json -T "$pkgdir/usr/lib/mozilla/native-messaging-hosts/pywalfox.json"
}
