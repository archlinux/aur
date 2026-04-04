# Maintainer: Campbell Jones <serebit at archlinux dot org>

pkgname=vkcheck-git
pkgver=r41.d1784dc
pkgrel=1
pkgdesc='Display extensions supported by Vulkan implementations'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/serebit/waycheck"
license=('Apache-2.0')
depends=()
makedepends=(
    'git'
    'cmake'
    'glfw'
    'meson'
    'vulkan-headers'
    'vulkan-icd-loader'
    'vulkan-profiles'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
source=("$pkgname"::'git+https://codeberg.org/serebit/vkcheck.git')
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$pkgname" build \
	    -Dimgui-backend='glfw' \
	    --wrap-mode default

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
