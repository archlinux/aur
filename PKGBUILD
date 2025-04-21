# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name='flake8-polyfill'
pkgname="python-${_name}"
pkgver=1.0.2.r18.gb98e6f4
pkgrel=5
pkgdesc='Polyfill package for Flake8 plugins'
url="https://github.com/PyCQA/${_name}"
depends=('flake8')
checkdepends=('python-pytest')
makedepends=(git python-build python-installer python-setuptools)
license=('MIT')
arch=('any')
source=("$pkgname::git+$url" fix-tests.patch)
sha256sums=('SKIP'
            '33a28897eda38828c197a6f31e0415a8804209c40f698ca5b5201b7660b65985')

pkgver() {
    cd "${srcdir}/$pkgname"

    git describe --long --tags --abbrev=7 \
        | sed -E 's/^[^0-9]*//;s/-([^-]*-g)/.r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/$pkgname"

    # Necessary since upstream, seemingly abandoned, has forgotten to tag the
    # 1.0.2 release it cut
    declare -A untagged_releases
    untagged_releases['1.0.2']='8664f8e3186ecb0dfdfa057787dc9a6f426ed32c'
    for v in "${!untagged_releases[@]}"; do
        git tag -f "$v" "${untagged_releases[$v]}"
    done

    patch -p1 < ../fix-tests.patch
}

build() {
    cd "${srcdir}/$pkgname"
    python -m build --wheel --no-isolation

    python -m installer --destdir=tmp_install dist/*.whl
}

check() {
    cd "${srcdir}/$pkgname"

    local _site_packages
    _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
    export PYTHONPATH="$PWD/tmp_install/$_site_packages"

    python -m pytest tests
}

package() {
    cd "${srcdir}/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

