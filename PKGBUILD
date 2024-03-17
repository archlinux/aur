# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=seahorse-nautilus-ext
pkgver=3.11.92+r96+gbd57374
pkgrel=1
epoch=1
pkgdesc="PGP encryption and signing for nautilus with configurable extension for encrypted files"
url="https://gitlab.gnome.org/Archive/seahorse-nautilus"
arch=(x86_64)
license=(GPL)
depends=(libnautilus-extension gtk3 gcr libcryptui libnotify)
makedepends=(meson git)
provides=(seahorse-nautilus)
conflicts=(seahorse-nautilus)
options=(debug)
_commit=bd573742e4272e72cd2150ccb82a514c69f20f44  # master
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd seahorse-nautilus
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd seahorse-nautilus
  git apply ../../0001-Make-file-extension-for-encrypted-files-configurable.patch
  git apply ../../0001-gpgme-config-is-not-available-anymore.patch
}

build() {
  arch-meson seahorse-nautilus build
  meson compile -C build
}

package() {
  depends+=(libnautilus-extension.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
