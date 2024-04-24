# Maintainer: Jakob Hellermann <jakob.hellermann@protonmail.com>
pkgname=atlas-celeste-git
pkgver=1.1.0.r33.e42ec3b
pkgrel=1
pkgdesc='Render and visualize paths for Celeste TASes'
url='https://github.com/jakobhellermann/Atlas'
makedepends=('git' 'rust' 'cargo' 'imagemagick')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs')
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
source=(
    "$pkgname::git+https://github.com/jakobhellermann/Atlas"
    "atlas.desktop"
)
sha1sums=('SKIP'
          '9921557096f013a3ef46ee24773a58e0bdb6a56e')


pkgver() {
  cd "$pkgname"
  local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
  local commits_since=$(git rev-list $tag..HEAD --count)
  echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    RUSTFLAGS="$RUSTFLAGS --remap-path-prefix $PWD=/" CARGO_TARGET_DIR=target cargo build --release --frozen
}

package() {
    install -Dm755 "$pkgname/target/release/atlas" "$pkgdir/usr/bin/atlas-celeste"
    install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
    convert "$pkgname/ui/assets/icon/icon.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/atlas.png"
    convert "$pkgname/ui/assets/icon/icon.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/atlas.png"
    convert "$pkgname/ui/assets/icon/icon.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/atlas.png"
    convert "$pkgname/ui/assets/icon/icon.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/atlas.png"

    install -Dm 644 "atlas.desktop" "${pkgdir}/usr/share/applications/atlas.desktop"
}
