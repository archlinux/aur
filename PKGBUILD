# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-setuptools-git-ls-files-git
pkgver=0.1.1.r1.g2327ed6
pkgrel=23
pkgdesc='setuptools plugin to list all files tracked by git, recursing into submodules'
url='https://github.com/anthrotype/setuptools_git_ls_files'
license=('MIT')
arch=(any)
depends=(python)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel
              git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    sed -i '/^from pkg_resources import /d' setup.py
    python - <<'PY'
import re, io
p = "setup.py"
s = open(p).read()
old = '''# Bootstrap
try:
    load_entry_point(setup_params["name"], ENTRY_GROUP, ENTRY_NAME)
except (DistributionNotFound, ImportError):
    working_set.add_entry(".")'''
new = '''# Bootstrap disabled for setuptools>=81 / Python 3.14 (pkg_resources removed)
pass'''
assert old in s, "bootstrap block not found"
s = s.replace(old, new)
open(p, "w").write(s)
PY

    cat > pyproject.toml <<'EOF'
[build-system]
requires = ["setuptools>=80", "wheel", "setuptools-scm"]
build-backend = "setuptools.build_meta"
EOF
}

build() {
    cd "$pkgname"
    python -m build -wn
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

