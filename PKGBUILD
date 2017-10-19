# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=0.1.2.0.g0065a1f
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('libvncserver' 'dconf' 'pipewire')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://gitlab.gnome.org/jadahl/$_pkgname.git
        0001-fix-meson-0-43-option.patch)
sha256sums=('SKIP'
        '3566d83083fec116a51db6457d2ee3e98eef57f9537993304b7577c0227126b4')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  patch -d "$_pkgname" < 0001-fix-meson-0-43-option.patch
  rm -rf build
  meson \
    -Dsystemd-user-unit-dir="/usr/lib/systemd/user" \
    --libexecdir=/usr/lib/$_pkgname \
    --prefix=/usr \
    --buildtype=plain \
    --strip \
    "$_pkgname" \
    build
  ninja -v -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
