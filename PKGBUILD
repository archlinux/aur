
# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Librewish <librewish@gmail.com>

pkgname=wayfire-plugin-shadows-git
pkgver=0.9.0.r1.453c217
pkgrel=1
pkgdesc="3D wayland compositor shadows plugin"
arch=('x86_64')
url="https://github.com/timgott/wayfire-shadows.git"
license=('MIT')
depends=('wayfire-git')
makedepends=('git' 'meson' 'ninja')
optdepends=('wcm: GTK3-based configuration tool for the Wayfire compositor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=('git+https://github.com/timgott/wayfire-shadows.git')
sha256sums=('SKIP')
pkgver() {
        cd "$srcdir/wayfire-shadows"

# Git, latest tag
        TAG=$(git tag | sort -V | tail -n1)
        VER=$(echo -n "$TAG" | cut -d'v' -f2)
        printf "%s.r%s.%s" "$VER" "$(git rev-list --count ${TAG}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  arch-meson wayfire-shadows build
}


build() {
  ninja -C build
}


package() {
        DESTDIR="$pkgdir/" ninja -C build install
        install -Dm644 "$srcdir/wayfire-shadows/LICENSE" \
                "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
