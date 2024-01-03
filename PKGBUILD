# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
_name=gnome-remote-desktop
pkgname=gnome-remote-desktop-anim
pkgver=45.1
pkgrel=1
pkgdesc="GNOME Remote Desktop server - Force enable animations"
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
arch=(x86_64)
license=(GPL2)
depends=(
  cairo
  dconf
  freerdp
  fuse3
  glib2
  libdrm
  libei
  libepoxy
  libfdk-aac
  libnotify
  libpipewire
  libsecret
  libvncserver
  libxkbcommon
  pipewire
  systemd
  tpm2-tss
)
makedepends=(
  asciidoc
  ffnvcodec-headers
  git
  meson
)
checkdepends=(
  dbus-broker
  libegl
  mutter
  python-dbus
  python-gobject
  wireplumber
)
provides=(gnome-remote-desktop)
conflicts=(gnome-remote-desktop)
groups=(gnome)
_commit=df66c0e99a749058e0ee7dcee36bd97e018a3bb8  # tags/45.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-remote-desktop.git#commit=$_commit"
        "enable-animations.patch")
b2sums=('SKIP'
        '28d0d890d731699395b2d582c54287a340f574e374b9839de77a78d7de7c412f728cc03b27e4a7a52263edb3bfe930ed1122ce503cfb1d67398534bef2d9f175')

pkgver() {
  cd $_name
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_name
  patch -Np1 -i "${srcdir}/enable-animations.patch"
}

build() {
  local meson_options=(
    -D vnc=true
  )

  arch-meson $_name build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
