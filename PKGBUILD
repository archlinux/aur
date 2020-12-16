# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=libnm-glib-nosystemd-minimal
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
  dbus
  dbus-glib
  glib2
  glibc
  libgudev
  nspr
  nss
  util-linux
)
makedepends=(
  git
  gobject-introspection
  intltool
  libndp
  libxslt
  meson
  python-gobject
  vala
)
provides=(libnm-glib)
conflicts=(libnm-glib)
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
  local meson_args=(
    # system paths
    -D dbus_conf_dir=/usr/share/dbus-1/system.d

    # platform
    -D dist_version="$pkgver-$pkgrel"
    -D session_tracking_consolekit=false
    -D suspend_resume=auto
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
    -D introspection=true
    -D vapi=true
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
    -D config_plugin_ibft=no
    -D ifcfg_rf=no
    -D ifupdown=false
    -D config_plugins_default=no
    -D wifi=false
    -D wext=false
    -D iwd=false
    -D consolekit=no
    -D teamdctl=false
    -D bluez5_dun=false
    -D ofono=false
    -D dhcpcanon=no
    -D dhclient=no
    -D dhcpcd=no
    -D valgrind=no
    -D modem_manager_1=no
  )

  arch-meson NetworkManager build "${meson_args[@]}"
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="$PWD/install" meson install -C build

  local src dst
  for src in \
    install/usr/include/{NetworkManager,libnm-glib} \
    install/usr/lib/girepository-1.0/{NetworkManager,NMClient}-* \
    install/usr/lib/libnm-* \
    install/usr/lib/pkgconfig/{NetworkManager,libnm-}* \
    install/usr/share/gir-1.0/{NetworkManager,NMClient}-* \
    install/usr/share/vala/vapi/libnm-*
  do
    dst="$pkgdir/${src#install/}"
    mkdir -p "${dst%/*}"
    mv "$src" "$dst"
  done
}

# vim:set sw=2 et:
