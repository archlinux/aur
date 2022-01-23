# Maintainer: Alexander Sieg <aur at xanderio dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
_pkgname=pika-backup
pkgname=$_pkgname-git
pkgver=0.3.0.beta.2.r231.g50956d7
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/org.gnome.World.PikaBackup"
license=('GPL')
depends=('borg' 'gtk4' 'libadwaita' 'python-llfuse')
makedepends=('cargo' 'meson' 'itstool')
provides=('pika-backup')
conflicts=('pika-backup')
source=("$_pkgname::git+https://gitlab.gnome.org/World/$_pkgname.git"
	'remove-install_script.patch')
sha256sums=('SKIP'
 	    '92f89123e206a02f614faab838ca5bc4524f72283275630c07c8fa9f3aa4f3f6')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # Disable update-desktop-database & gtk-update-icon-cache
  patch --strip=1 data/meson.build $srcdir/remove-install_script.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$_pkgname" build
  meson compile -C build
}

# check() {
#   export RUSTUP_TOOLCHAIN=stable
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "$pkgdir"
}
