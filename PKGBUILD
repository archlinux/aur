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
_ubuntu_ver=43.0
_ubuntu_rel=1ubuntu1
pkgver=43.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://git.gnome.org/browse/gsettings-desktop-schemas"
license=(GPL)
depends=(glib2 dconf)
makedepends=(git gobject-introspection meson)
provides=(gsettings-desktop-schemas=$pkgver)
conflicts=(gsettings-desktop-schemas)
_commit=742f0023b484bcf62f89731a2916fe3f2d30377a  # 43.0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('SKIP'
            '305eaaa04982c9a1e43713437062cb15c50c6d214e110be221a0623f9122096b34dda2010b2db0e109b45b583fb5f008c46604d56477039b6c15e72aeae6cf9d')

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

