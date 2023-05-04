# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libsrtp
pkgname=lib32-libsrtp
pkgver=2.5.0
pkgrel=1
epoch=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol) (32-bit)"
url="https://github.com/cisco/libsrtp"
arch=('x86_64')
license=(BSD)
depends=('lib32-glibc' 'lib32-nss' 'libsrtp')
makedepends=('git' 'lib32-libpcap' 'meson')
checkdepends=('procps-ng')
_commit=a566a9cfcd619e8327784aa7cff4a1276dc1e895 # tags/v2
source=("git+https://github.com/cisco/libsrtp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
    cd $_basename

    # Fixup pkgver: There are proper tags like v2.4.4
    # but also "moving tags" like v2 and v2.4 that aren't stable
    git tag | grep -Pv '^v\d+\.\d+\.\d+$' | xargs git tag -d
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    local meson_options=(
        --libdir=lib32 \
        --buildtype release \
        -D crypto-library=nss \
        -D crypto-library-kdf=disabled \
        -D doc=disabled
    )

    arch-meson libsrtp build "${meson_options[@]}"

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_basename/LICENSE

    cd "$pkgdir"/usr

    rm -r include
}
