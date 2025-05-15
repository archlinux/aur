# Maintainer: Howni <honihoneyhowni at gmail dot com>

pkgname=python-pywalfox-librewolf
_name=pywalfox
pkgver=2.8.0rc1
hash=89a18e011e2d325de8e987f7c0a67222448b252fc894634bfa0d3b3728ec6dbf
path1=$(printf %s "$hash" | cut -c1-2)
path2=$(printf %s "$hash" | cut -c3-4)
path3=$(printf %s "$hash" | cut -c5-)
pkgrel=2
pkgdesc="Native app used alongside the Pywalfox browser extension with support for Librewolf"
arch=('any')
conflicts=('python-pywalfox')
url='https://github.com/Frewacom/pywalfox/issues/68'
license=('MPL2')
depends=(
    'python'
)
makedepends=(
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://test-files.pythonhosted.org/packages/$path1/$path2/$path3/$_name-$pkgver.tar.gz")
sha256sums=('89e0d7a441eb600933440c713cddbfaecda236bde7f3f655db0ec20b0ae12845')

prepare() {
    cd "$_name-$pkgver"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    sed -i "s:<path>:$site_packages/pywalfox/bin/main.sh:" pywalfox/assets/manifest.json
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 pywalfox/assets/manifest.json -T "$pkgdir/usr/lib/mozilla/native-messaging-hosts/pywalfox.json"
}
