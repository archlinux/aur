
# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=wayfire-plugin-focus-request-git
pkgver=0.9.0.r0.b5c5029
pkgrel=1
pkgdesc="3D wayland compositor focus request plugin"
arch=('x86_64')
url="https://gitlab.com/wayfireplugins/focus-request.git"
license=('MIT')
depends=('wayfire-git' 'wayland-protocols')
makedepends=('git' 'meson' 'ninja' 'vulkan-headers')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://gitlab.com/wayfireplugins/focus-request.git')
sha256sums=('SKIP')
pkgver() {
        cd "$srcdir/focus-request"

# Git, latest tag
        TAG=$(git tag | sort -V | tail -n1)
        VER=$(echo -n "$TAG" | cut -d'v' -f2)
        printf "%s.r%s.%s" "$VER" "$(git rev-list --count ${TAG}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  arch-meson focus-request build
}


build() {
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
        install -Dm644 "$srcdir/focus-request/LICENSE" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
