# Maintainer: babaynux <your-email@example.com>
pkgname=bigwebapp-manager
_pkgname=biglinux-webapps
pkgver=r100.g1234567
pkgrel=1
pkgdesc="BigLinux WebApps - Web applications manager with automatic icon fetching"
arch=('x86_64')
url="https://github.com/biglinux/biglinux-webapps"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'gettext' 'openssl')
makedepends=('git' 'rust' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/biglinux/biglinux-webapps.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  cargo build --release --workspace --locked
}

package() {
  cd "$_pkgname"

  # Compiled binaries
  install -Dm755 target/release/big-webapps-gui    "$pkgdir/usr/bin/big-webapps-gui"
  install -Dm755 target/release/big-webapps-viewer  "$pkgdir/usr/bin/big-webapps-viewer"
  install -Dm755 target/release/big-webapps-exec    "$pkgdir/usr/bin/big-webapps-exec"

  # Desktop files, icons, polkit policy etc.
  if [ -d "usr" ]; then
    cp -r "usr/." "$pkgdir/usr/"
  fi

  # Compiled translations
  if [ -d "../po" ]; then
    for po in ../po/*.po; do
      lang=$(basename "$po" .po)
      msgfmt -o "$srcdir/${lang}.mo" "$po"
      install -Dm644 "$srcdir/${lang}.mo" "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/biglinux-webapps.mo"
    done
  fi
}
