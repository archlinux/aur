# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Original Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=bionic
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.27

pkgname=gsettings-desktop-schemas-ubuntu
_ubuntu_ver=42.0
_ubuntu_rel=1ubuntu1
pkgver=42.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://git.gnome.org/browse/gsettings-desktop-schemas"
license=(GPL)
depends=(glib2 dconf)
makedepends=(git gobject-introspection meson)
provides=(gsettings-desktop-schemas=$pkgver)
conflicts=(gsettings-desktop-schemas)
_commit=a1f3cd8de0e3d67c826aebce35cc53f760836dca  # 42.0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('SKIP'
            'c5b7c095b252419313ec151d68f6e41a3ca59b68d5c43f27ecff5230b90517305166b432cc20b3ab9dd013cde6230423cd1353c588029a7b866c0bc3a38964cd')

pkgver(){
  cd ${pkgname%-*}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname%-*}

    # Apply Ubuntu's patches

    for i in $(grep -v '#' ../debian/patches/series); do
        msg "Applying ${i} ..."
        patch -p1 -i "../debian/patches/${i}"
    done
}

build() {
    arch-meson ${pkgname%-*} build
    ninja -C build

}
package() {

    DESTDIR="${pkgdir}" ninja -C build install
}

