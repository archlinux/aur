# Maintainer: efindus <aur at efindus dot com>

pkgname=power-profiles-daemon-patched-amd-git
_pkgname=power-profiles-daemon
_commit=05867e84a46c17b81fc8316d0080ba65ccf756e4
pkgver=0.21
pkgrel=2
pkgdesc="[new!] Makes power profiles handling available over D-Bus (with AMD patches by Mario Limonciello)"
url='https://gitlab.freedesktop.org/upower/power-profiles-daemon'
license=(GPL-3.0-only)
arch=(x86_64)
depends=(gcc-libs
         glib2
         glibc
         libgudev
         polkit
         upower
         glib2-devel)
optdepends=('python-gobject: for powerprofilesctl')
makedepends=(meson)
checkdepends=(python-dbusmock
              python-isort
              python-mccabe
              umockdev)
provides=('power-profiles-daemon')
conflicts=('power-profiles-daemon')
# I am using webarchive to freeze the patch file in order to prevent future breakage
source=(https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/archive/$_commit/power-profiles-daemon-$_commit.tar.gz https://web.archive.org/web/20240729220102/https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/merge_requests/198.patch)
sha256sums=('c3e760331ac046b938c0689d92f0681c6832b652874a0347c8ce69fa929220af' '92459b12d29d91f7b1a5a10f1290bb73dbceeabbb11325c3899685f6fd736036')

build() {
  patch --forward --strip 1 -d $_pkgname-$_commit --input=../198.patch
  meson $_pkgname-$_commit build \
    --prefix /usr \
    --libexec lib \
    --sysconfdir /usr/share
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
