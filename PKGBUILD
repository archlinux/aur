# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=python-papis-scihub-git
_plugname="${pkgname%-git}"
_plugname="${_plugname#python-}"
pkgver=1.4.0.r0.gf7bb665.PR62
pkgrel=2
pkgdesc='Papis plugin to import from Sci-Hub (incorporates upstream PR #62)'
arch=('any')
url='https://github.com/papis/scripts/tree/master/papis-scihub'
license=('GPL-3.0-only')
depends=('python')
makedepends=('git'
  'python-build' 'python-installer' 'python-setuptools'
)
_url="${url%/tree/master/$_plugname}"
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP'
            '5c44e77d787bfc54f473f057777369bdcf3978d9c5a62883dcabd7a015438cca')
provides=("${pkgname%-git}")
prs=(
    62 # Update to new papis plugin framework
    )
for pr in "${prs[@]}"; do
    source+=("${pkgname}-PR$pr.patch::$_url/pull/$pr.patch")
done


prepare() {
    cd "$pkgname"
    git tag -f papis-scihub-1.4.0

    for pr in "${prs[@]}"; do
        git apply "../${pkgname}-PR$pr.patch"
    done
}

pkgver() {
    cd "$pkgname"
    git describe --long --tags --dirty=-PR"$(export IFS=+; echo "${prs[*]}")" \
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
