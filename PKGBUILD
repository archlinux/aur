# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=beluga-git
_pkgname=beluga
pkgver=1.3.1_r1_g00f3882
pkgrel=1
pkgdesc='File manager written with plain GTK 4, a rewrite of KDE Dolphin without Qt or KDE Frameworks (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/beluga'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'glib2' 'gtk4' 'gdk-pixbuf2' 'pango' 'cairo' 'libarchive' 'ffmpeg')
makedepends=('git' 'cmake' 'pkgconf' 'gettext')
optdepends=('udisks2: drives and partitions in the Places panel'
            'tumbler: previews of videos and documents'
            'gvfs: network locations such as sftp:// and smb://'
            'xdg-desktop-portal: Beluga as the file chooser of other programs'
            'polkit: View › Act as Administrator (with a polkit agent)')
provides=('beluga')
conflicts=('beluga')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBELUGA_FFMPEG=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
