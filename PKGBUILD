# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>
# https://aur.archlinux.org/packages/file-roller-tmp/

pkgname=file-roller-tmp
pkgver=3.30.1
pkgrel=1
pkgdesc="Create and modify archives. SSD-friendly version (stores temporary files in /tmp)."
url="https://wiki.gnome.org/Apps/FileRoller"
arch=(x86_64)
license=(GPL)
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
_commit=7962fbaf86db77ec6c0713491920341487be1681  # tags/3.30.1^0
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
