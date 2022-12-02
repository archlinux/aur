# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

pkgname=file-roller-pantheon
pkgver=43.0
pkgrel=1
pkgdesc="Create and modify archives (with Contractor integration)"
url="https://gitlab.gnome.org/GNOME/file-roller/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(libhandy dconf libarchive file json-glib libportal-gtk3 zip unzip)
makedepends=(yelp-tools git libnautilus-extension meson appstream-glib)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support'
            'squashfs-tools: squashfs image support')
groups=(pantheon)
provides=(file-roller)
conflicts=(file-roller)
_commit=6d57d9962efb976aa3036db965f558b96575289c  # tags/43.0^0
source=("git+https://gitlab.gnome.org/GNOME/file-roller.git#commit=$_commit"
        "contracts.patch")
sha256sums=('SKIP'
            'd04cd96655a9d6a7686fcdb22ced19680da9964b12f4943bf608fa2486fc01e8')

pkgver() {
  cd "file-roller"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "file-roller"
  patch -Np1 < ../contracts.patch
}

build() {
  arch-meson file-roller build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
