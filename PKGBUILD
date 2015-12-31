# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=wily
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.18

pkgname=gsettings-desktop-schemas-ubuntu
_ubuntu_rel=0ubuntu1
_ubuntu_ver=3.18.0
pkgver=3.18.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=(any)
url="http://live.gnome.org/"
license=(GPL)
depends=(glib2)
makedepends=(intltool gobject-introspection)
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz"
        git_revert_background_key_removal.patch
        git_revert_menu_icon_key_removal.patch
        git_revert_notifications_key_removal.patch
        ubuntu_lock-on-suspend.patch)
sha512sums=('8dc3c9890f979860f06efa949c92c699e40f25eedc24eae087d9c70555ec9ef513a873f9a787f10b34208bf11c7be903cbaeecc95a4d93b4e556640be1c21b15'
            '1ff419ad9819b7b9a6d7bab98be51df5fa91f9dc7372e012d1a4be9e6688d7ec6a873194868b028560be457f719eb43b6bad5f1e19e69b9ecc793873ee48672b'
            '423c81fefb2eb1580d703499baee449e0dfe88b0d8bb3cbc5815c2668e859f0334bb352d0f58ba312c7fc3257fd8a78f0935c834429b3c7d3986ee5996b5ae5a'
            'cae6c01833043d9d7d889561a6afb7bae5f9186603552e1277b6a8f792148bd585ac19aac41253223cdeeba4d031f51984ac126fae9c02ceca396cb69e4db75f'
            '2af269c096d9f15a7e91440a97ee69d08e778b498fd835194d5abca02630bc7a5dcb2c8a2ad3ae21e95b40cbcf0cd6773f34aeb9a2655d25f4b59d231f478b1d'
            '301830b3f9c9f2aac9e44ea2e2305cfc9d4864f3bd6ac4c5824ce12de45c72329ddca303adfb7948063acbb7ff892b0970767b1b552aff00834c517f25af2c8c')

prepare() {
  cd "${pkgname%-*}-${pkgver}"

  # Apply Ubuntu's patches

  sed -i '/git_revert_notifications_key_removal.patch/d' ../debian/patches/series

#  for i in $(grep -v '#' ../debian/patches/series); do
#    msg "Applying ${i} ..."
#    patch -p1 -i "../debian/patches/${i}"
#  done

  patch -p1 -i ../git_revert_background_key_removal.patch
  patch -p1 -i ../git_revert_menu_icon_key_removal.patch
  patch -p1 -i ../git_revert_notifications_key_removal.patch
  patch -p1 -i ../ubuntu_lock-on-suspend.patch
}

build() {
  cd "${pkgname%-*}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd "${pkgname%-*}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
