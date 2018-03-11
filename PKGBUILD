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
_ubuntu_ver=3.27.90
_ubuntu_rel=1ubuntu1
pkgver=3.27.90
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="https://git.gnome.org/browse/gsettings-desktop-schemas"
license=(GPL)
depends=(glib2 dconf)
makedepends=(git gobject-introspection intltool)
provides=(gsettings-desktop-schemas)
conflicts=(gsettings-desktop-schemas)
_commit=b452abef71429f92e43a9ce2fb14d50c9edce964  # 3.27.90
source=("git+https://git.gnome.org/browse/gsettings-desktop-schemas#commit=$_commit"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('SKIP'
            'a2a2799409be1098f5abe852affbc1cc28b1716c18f38cad7cf4dcf0bb2c97910ec4eb8969298b8f7dab86f093bb527198807ca48f5e2db4c8d7b765829a199d')

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

  intltoolize
  autoreconf -fvi
}

build() {
    cd ${pkgname%-*}

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-schemas-compile
    make
}

package() {
    cd ${pkgname%-*}

    make DESTDIR="${pkgdir}" install
}

