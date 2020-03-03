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
_ubuntu_ver=3.34.0
_ubuntu_rel=1ubuntu1
pkgver=3.34.0
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://git.gnome.org/browse/gsettings-desktop-schemas"
license=(GPL)
depends=(glib2 dconf)
makedepends=(git gobject-introspection meson)
provides=(gsettings-desktop-schemas=$pkgver)
conflicts=(gsettings-desktop-schemas)
_commit=56d24d47b9699ac6c877b93ae0e863f178c17dab  # 3.34.0
source=("git+https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('SKIP'
            'e88e03a47ec9bbd176c96f701e4ad2a40eee9ac6bc32f87891f0ad6e5a5c84041af4f3211f1b28fcb203832faba3569b8477bad5cebd9ecd00ba0a0423b12940')

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

