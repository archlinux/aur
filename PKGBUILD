# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=lib32-libnm-glib-nosystemd
pkgver=1.18.11
pkgrel=1
pkgdesc='NetworkManager client library (legacy)'
arch=(x86_64)
url=https://wiki.gnome.org/Projects/NetworkManager
license=(
  GPL2
  LGPL2.1
)
depends=(
  lib32-dbus
  lib32-dbus-glib
  lib32-glib2
  lib32-glibc
  lib32-libgudev
  lib32-nspr
  lib32-nss
  lib32-util-linux
  libnm-glib
)
makedepends=(
  git
  intltool
  lib32-libndp
  libxslt
  meson
)
provides=(lib32-libnm-glib)
conflicts=(lib32-libnm-glib)
#_commit=a8746f48ca088b4cd3799e540b8606df1f1e8522  # nm-1-18
source=("git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#branch=nm-1-18")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager
  git describe | sed 's/-dev/dev/;s/-rc/rc/;s/-/+/g'
}

prepare() {
  cd NetworkManager
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  local meson_args=(
    --libdir=lib32

    # system paths
    -D dbus_conf_dir=/usr/share/dbus-1/system.d

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=disable
    -D polkit=false
    -D modify_system=true
    -D polkit_agent=false
    -D selinux=false
    -D libaudit=no

    # features
    -D ppp=false
    -D modem_manager=false
    -D concheck=false
    -D ovs=false
    -D libnm_glib=true
    -D nmcli=false
    -D nmtui=false
    -D ebpf=true

    # configuration plugins
    -D config_plugins_default=keyfile

    # miscellaneous
    -D introspection=false
    -D vapi=false
    -D docs=false
    -D tests=no
    -D more_asserts=no
    -D more_logging=false
    -D libpsl=false
    -D json_validation=false
    -D qt=false
    -D systemd_logind=false
    -D systemd_journal=false
    -D systemdsystemunitdir=no
    -D session_tracking=no
  )

  arch-meson NetworkManager build "${meson_args[@]}"
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="$PWD/install" meson install -C build

  local src dst
  for src in \
    install/usr/lib32/libnm-* \
    install/usr/lib32/pkgconfig/{NetworkManager,libnm-}*
  do
    dst="$pkgdir/${src#install/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
  done
}

# vim:set sw=2 et:
