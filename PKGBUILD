# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gnome-remote-desktop
pkgver=0.1.2
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('libvncserver' 'dconf' 'pipewire')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(https://gitlab.gnome.org/jadahl/gnome-remote-desktop/uploads/7d3cc32efb12ca84284532f947487067/gnome-remote-desktop-0.1.2.tar.xz
        0001-fix-meson-0-43-option.patch)
sha256sums=('5da1df950ab3363d40a7f9a0a0f9b4eb960de429bc31751749a6d77148148008'
            '3566d83083fec116a51db6457d2ee3e98eef57f9537993304b7577c0227126b4')

build() {
  patch -d "$pkgname-$pkgver" < 0001-fix-meson-0-43-option.patch
  rm -rf build
  meson \
    -Dsystemd-user-unit-dir="/usr/lib/systemd/user" \
    --libexecdir=/usr/lib/$pkgname \
    --prefix=/usr \
    --buildtype=plain \
    --strip \
    "$pkgname-$pkgver" \
    build
  ninja -v -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
