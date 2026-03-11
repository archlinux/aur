# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: lucasm < luluco250 at gmail dot com >

_basename=fallout2-ce
pkgname=$_basename-git
pkgver=r1556.404236c
pkgrel=1
pkgdesc='Fallout 2 for modern operating systems'
arch=('any')
url="https://github.com/$_basename/$_basename"
license=('custom:SUL')
depends=('sdl2')
makedepends=('sdl2' 'cmake' 'git')
source=(
    "$_basename::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename" || exit 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_basename" || exit 1
    cmake -S . -B build \
        -DCMAKE_C_STANDARD="17" \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-incompatible-pointer-types" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    cd "$srcdir/$_basename" || exit 1
    install -Dm755 "build/$_basename" "$pkgdir/usr/bin/$_basename"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

