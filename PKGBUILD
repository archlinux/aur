# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-secure
pkgver=2.0.2
_commit=bc2c33a
pkgrel=1
pkgdesc="A small, focused library for adding modern security headers to Python web applications"
url="https://github.com/TypeError/secure.py"
arch=(any)
license=(MIT)
depends=(python)
makedepends=(git openssh python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#commit=$_commit"
        cak.keys)
sha256sums=('75cf85c71868390142d742ef9cdf50927e06db0c817baa86224ee53071941b65'
            'd89159c1914232c1c6d5b5fe6263a0eb6ac85a0122bbb73d18a52e493a5eb249')

# Release 2.0.2 does not sign with the ssh key
# prepare() {
#     git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/cak.keys" verify-commit "$_commit"
# }

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    pytest -x -o addopts=""
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$site_packages/secure-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
