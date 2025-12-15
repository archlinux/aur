# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: EndstoneMC <hello@endstone.dev>
pkgname=python-endstone-git
pkgver=0.10.18
pkgrel=1
pkgdesc="High-level Plugin API for Bedrock Dedicated Servers (BDS), in both Python and C++"
arch=('x86_64')
url="https://github.com/EndstoneMC/endstone"
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'clang' 'conan' 'make' 'm4' 'automake' 'autoconf' 'git' 'python' 'python-setuptools' 'python-wheel')
conflicts=('python-endstone')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')
pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    cd "$pkgname"
    if [[ -z "$(git config --get user.name)" ]]; then
        git config user.name local && git config user.email '<>' && git config commit.gpgsign false
    fi
}
build() {
    cd "$pkgname"
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr/lib/python3.11/site-packages
    make
}
package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
    cd "$pkgname/$pkgname"
    python -m build --wheel --no-isolation
    pip install --root="$pkgdir" --no-deps --find-links="dist" "$pkgname"
}
