# Maintainer: Stefano Capitani <stefano@manjaro.org>

_pkgbase=nautilus
pkgname=(nautilus-legacy) #libnautilus-extension-legacy pushed out we see if needed
pkgver=3.26.4
pkgrel=1
pkgdesc="Default file manager for GNOME: legacy version (3.26 series)"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs dconf tracker nautilus-sendto gnome-autoar)
makedepends=(gobject-introspection packagekit git gtk-doc meson)
options=(!emptydirs)
#_commit=51637bc0960002b811e1c0c7be8671cf9a1cc5be  # tags/3.26.2^0
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git#tag=3.26.4"
        "git+https://git.gnome.org/browse/libgd"
        0001-rename-file-popover-controller-Don-t-destroy-the-pop.patch)
sha256sums=('SKIP'
            'SKIP'
            '91af3078f0c9b1cbea45f8d8fa4dca1f00cb2c5cd85e5dbda82362b4dfe69c68')

prepare() {
  mkdir -p build libne/usr/{lib,share}
  cd $_pkgbase

  # https://gitlab.gnome.org/GNOME/nautilus/issues/25
  git cherry-pick -n d74e1a3d 9238456b

  # https://gitlab.gnome.org/GNOME/nautilus/issues/216
  patch -Np1 -i ../0001-rename-file-popover-controller-Don-t-destroy-the-pop.patch

  git submodule init
  git config --local submodule.libgd.url "$srcdir/libgd"
  git submodule update
}

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd build
  arch-meson ../$_pkgbase  \
    -Denable-exif=true \
    -Denable-xmp=true \
    -Denable-gtk-doc=true \
    -Denable-selinux=false
  ninja
}

package_nautilus-legacy() {
  depends+=(libnautilus-extension)
  conflicts=(nautilus)
  provides=(nautilus)

  cd build
  DESTDIR="$pkgdir" ninja install

### Split libnautilus-extension

  cd ../libne
  mv "$pkgdir"/usr/include usr
  mv "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig} usr/lib
  mv "$pkgdir"/usr/share/{gir-1.0,gtk-doc} usr/share
}

#Moved out we will see 

#package_libnautilus-extension-legacy() {
#  pkgdesc="Library for extending the $pkgdesc"
#  depends=(gtk3)
#  conflicts=(libnautilus-extension)
#  provides=(libnautilus-extension)
  
#  mv libne/usr "$pkgdir"
#}

