# Maintainer : Kresimir Pripuzic <kpripuzic@gmail.com>
# Contributor: Andrey Vetrov <vetrov@mail.ru>
# https://aur.archlinux.org/packages/file-roller-tmp/

pkgname=file-roller-tmp
pkgver=3.36.0
pkgrel=1
pkgdesc="Create and modify archives. SSD-friendly version (stores temporary files in /tmp)."
url="https://gitlab.gnome.org/GNOME/file-roller"
arch=(x86_64)
license=(GPL2)
provides=("file-roller=$pkgver")
conflicts=('file-roller')
replaces=('file-roller')
depends=('gtk3' 'dconf' 'libarchive' 'file' 'json-glib' 'libnotify' 'zip' 'unzip')
makedepends=('yelp-tools' 'git' 'libnautilus-extension' 'meson' 'appstream-glib')
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support')
groups=(gnome)
_commit=448229e786ca0aa8392d796ce2a195c94888971e  # tags/3.36.0^0
source=("git+https://gitlab.gnome.org/GNOME/file-roller.git#commit=$_commit"
        'tmp-as-temp.patch')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname:0:11}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname:0:11}
  #patch
  cd $srcdir/${pkgname:0:11}
  patch -Np0 -i ../tmp-as-temp.patch
}

build() {
  arch-meson ${pkgname:0:11} build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
