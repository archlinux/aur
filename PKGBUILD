# Maintainer: SovietReimu1228 <reimussr at protonmail dot ch>

pkgname=directx-headers-git
pkgdesc="DirectX headers for using D3D12"
pkgver=r181.34c9866
pkgrel=1
arch=('x86_64')
makedepends=('meson' 'git')
provides=('directx-headers')
conflicts=('directx-headers')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=('DirectX-Headers::git+https://github.com/microsoft/DirectX-Headers.git')
sha256sums=('SKIP')

pkgver() {
    cd DirectX-Headers
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    meson setup DirectX-Headers build \
       --prefix /usr \
       --libexecdir lib \
       --sbindir bin \
       --buildtype plain \
       --auto-features enabled \
       --wrap-mode nodownload \
       -D b_lto=false \
       -D b_pie=true \
       -D build-test=false

    meson configure --no-pager build
}

package() {
    DESTDIR="$pkgdir" meson install -C build

    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" DirectX-Headers/LICENSE
}
