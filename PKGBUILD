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
_ubuntu_ver=44.0
_ubuntu_rel=1ubuntu1
pkgver=44.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://git.gnome.org/browse/gsettings-desktop-schemas"
license=(GPL)
depends=(glib2 dconf)
makedepends=(git gobject-introspection meson)
provides=(gsettings-desktop-schemas=$pkgver)
conflicts=(gsettings-desktop-schemas)
_commit=eff0b3609ff745fcb58cba7198397c642702736e  # 44.0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('SKIP'
            '8d1b35c333831de7143b910d855d7050a755abda9f8c0c30718af9978680fa7a2bb93eb82a1e3107e6dd418ee6d81a5732fbdea856cd9fc1547a0865caac9d26')

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

