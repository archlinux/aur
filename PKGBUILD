# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief-git
_name=modern_colorthief
pkgver=0.1.9.r0.g0000001
pkgrel=1
pkgdesc="A modern color thief (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python' 'python-color-thief' 'python-image' 'python-itertools') # Check dependencies?
# Actually it compiles a rust module, runtime deps are minimal usually if it's all in the module.
# pyproject.toml says: requires-python. Dependencies: None listed in project.dependencies explicitly, 
# but Cargo.toml has dependencies. Rust deps are compiled in.
# python deps: none listed in pyproject.toml [project.dependencies]?
# Let's check pyproject.toml again.
# [project] -> no dependencies key. 
# [dependency-groups] -> docs, test.
# So runtime deps are 0?
# Cargo.toml: pyo3, color-thief, image, itertools. These are RUST dependencies, compiled INTO the binary.
# So python runtime deps are: python.

depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'maturin' 'cargo' 'git')
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/baseplate-admin/modern_colorthief.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl

}
