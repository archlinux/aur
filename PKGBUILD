# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=python-papis-scihub-git
_plugname="${pkgname%-git}"
_plugname="${_plugname#python-}"
pkgver=1.4.0.r0.gcf099a3
pkgrel=1
pkgdesc='Papis plugin to import from Sci-Hub (incorporates upstream PR #62)'
arch=('any')
url='https://github.com/papis/scripts/tree/master/papis-scihub'
license=('GPL-3.0-only')
depends=('python')
makedepends=('git'
  'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
_url="${url%/tree/master/$_plugname}"
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP')
provides=("${pkgname%-git}")

prepare() {
    cd "$pkgname"
    git config get user.name 2>/dev/null \
        || git config set user.name "$PACKAGER"
    git config get user.email 2>/dev/null \
        || git config set user.email "$PACKAGER"
    if ! git remote add upstream "$_url" 2>/dev/null; then
        test "$(git remote get-url upstream)" != "$_url" && exit 1
    fi
    git fetch upstream pull/62/head:pr62
    git merge pr62
    git tag -f papis-scihub-1.4.0 pr62
}

pkgver() {
    cd "$pkgname"
    git describe --long --tags \
        | sed 's/^papis-scihub-//' \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}/${_plugname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
