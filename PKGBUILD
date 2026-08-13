# Maintainer: ChHsiching <https://aur.archlinux.org/account/ChHsich>
# Prebuilt binary package. Downloads the official .deb from GitHub Releases.
# CI (update-packaging.yml) rewrites pkgver/sha256sums on each release.
#
# Pattern follows the upstream bongo-cat AUR package (and md-tauri-bin):
# makepkg auto-extracts the .deb via bsdtar (libarchive reads the ar container),
# leaving data.tar.* in $srcdir; build() then unpacks data.tar.* into a staging
# dir, and package() installs from there.

pkgname=bongo-cat-todo-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Tauri 2 desktop pet cat with a todo list and mail notifier (fork of BongoCat, prebuilt binary)"
arch=(x86_64 aarch64)
url="https://github.com/ChHsiching/bongocat-todo"
license=(MIT)
depends=(
  webkit2gtk-4.1
  gtk3
  gdk-pixbuf2
  libsoup3
  hicolor-icon-theme
)
provides=(bongo-cat-todo)
conflicts=(bongo-cat-todo bongo-cat-todo-git)
options=(!strip)

# Source filename MUST end in .deb so makepkg's bsdtar auto-extracts it.
#   x86_64  -> BongoCat.Todo_${pkgver}_amd64.deb
#   aarch64 -> BongoCat.Todo_${pkgver}_arm64.deb
source_x86_64=("$pkgname-$pkgver-amd64.deb::$url/releases/download/v$pkgver/BongoCat.Todo_${pkgver}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-arm64.deb::$url/releases/download/v$pkgver/BongoCat.Todo_${pkgver}_arm64.deb")
# sha256sums rewritten by CI at release time.
sha256sums_x86_64=('414a432dbf80e428b7fa60c1b8192059e2a0b85ce85de48120f1c52b5abd8984')
sha256sums_aarch64=('2be5a609bc15b93598d1d306407910528732679fc6305ad6a3e6c6d869649cf4')

build() {
  # After makepkg auto-extracted the .deb, $srcdir contains data.tar.*
  # (compression is .xz/.gz/.zst depending on the Tauri bundler version).
  # Unpack the data payload into a staging dir; bsdtar auto-detects compression.
  mkdir -p "$srcdir/build"
  bsdtar -xf "$srcdir/data.tar."* -C "$srcdir/build"
}

package() {
  cd "$srcdir/build"

  # Binary
  install -Dm755 usr/bin/* -t "$pkgdir/usr/bin/"

  # .desktop
  install -Dm644 usr/share/applications/*.desktop -t "$pkgdir/usr/share/applications/"

  # Icons (install every resolution shipped in the .deb)
  find usr/share/icons -type f -exec install -Dm644 {} "$pkgdir/{}" \;
}
