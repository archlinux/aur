# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name='flake8-polyfill'
pkgname="python-${_name}"
pkgver=1.0.2.r18.gb98e6f4
pkgrel=1
pkgdesc="Polyfill package for Flake8 plugins"
url="https://github.com/PyCQA/${_name}"
depends=('flake8')
checkdepends=('python-pytest')
makedepends=(git python-build python-installer python-wheel python-setuptools)
license=('LicenseRef-MIT')
arch=('any')
source=("$pkgname::git+$url#commit=b98e6f4f6cc90334f4d7040745aee91b4021cc42"
    fix-tests.patch
    version.sh)
sha256sums=('6fa19d5ed3629de90256046c7e848805b90745460296b3b6677b0c61a9af2744'
            '33a28897eda38828c197a6f31e0415a8804209c40f698ca5b5201b7660b65985'
            'd15fca2becb34181a422547a3fed8695f4ff8459753d087aed768d0d010bf5db')

_bumpTag() {
    cd "${srcdir}/$pkgname"
    local version oldVer verCmd

    git stash &> /dev/null
    version="$(bash "${srcdir}"/version.sh)"
    oldVer="$(git describe --abbrev=0)"
    if test "$version" != "$oldVer"; then
        verCmd="$(cat "${srcdir}"/version.sh)"
        printf 'test "$(%s)" != %s\n' "$verCmd" "$version" > bisector.sh
        chmod 755 bisector.sh
        git bisect start
        git bisect new
        git bisect old "$oldVer"
        git bisect run ./bisector.sh
        git tag -f "$version"
        git bisect reset
    fi &> /dev/null

    git describe --long --tags --abbrev=7
    git stash pop &> /dev/null
}

pkgver() {
    _bumpTag | sed -E 's/^[^0-9]*//;s/-([^-]*-g)/.r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/$pkgname"
    patch -p1 -i ../fix-tests.patch
}

build() {
    cd "${srcdir}/$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/$pkgname"
    PYTHONPATH=src:"$PYTHONPATH" python -m pytest tests
}

package() {
    cd "${srcdir}/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

