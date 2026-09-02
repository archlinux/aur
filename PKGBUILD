# Maintainer: Jon Kinney
#
# Source of truth for the AUR `mousehop-git` package — tracks main.
# The pkgver() function regenerates the version from `git describe`
# at build time; the static pkgver= line below is metadata only (for
# AUR display). aur-publish.yml bumps that line on each release.
pkgname=mousehop-git
_pkgname=mousehop
pkgver=0.17.0
pkgrel=1
pkgdesc='Software KVM Switch / mouse & keyboard sharing software for Local Area Networks (latest main)'
arch=('x86_64' 'aarch64')
url='https://github.com/jondkinney/mousehop'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtk4' 'libx11' 'libxtst' 'glib2' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('rust' 'git')
options=('!lto')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+https://github.com/jondkinney/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # <last-tag>.r<commits-since>.g<short-hash> — sortable + uniquely
  # identifies the commit. Strip the `v` prefix; rewrite the
  # `-N-g<sha>` git-describe suffix to `.rN.g<sha>` for pacman.
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/mousehop "$pkgdir/usr/bin/mousehop"
  install -Dm644 mousehop/com.mousehop.Mousehop.desktop \
    "$pkgdir/usr/share/applications/com.mousehop.Mousehop.desktop"
  install -Dm644 mousehop-gtk/resources/com.mousehop.Mousehop.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.mousehop.Mousehop.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
