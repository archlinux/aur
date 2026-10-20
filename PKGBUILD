# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.
#
# This PKGBUILD does not build a variant for dbus-daemon-units, as there is nothing specific to SELinux there

pkgbase=dbus-selinux
pkgname=(
  dbus-selinux
  #dbus-daemon-units # Ignore for SELinux package
  dbus-docs-selinux
)
pkgver=1.16.2
pkgrel=2
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://www.freedesktop.org/wiki/Software/dbus/"
arch=(x86_64 aarch64)
license=("AFL-2.1 OR GPL-2.0-or-later")
groups=(selinux)
depends=(
  audit
  expat
  glibc
  libcap-ng
  libselinux
  'systemd-libs-selinux>=242.84-2'
)
makedepends=(
  docbook-xsl
  doxygen
  git
  glib2
  mallard-ducktype
  meson
  python
  qt5-tools
  systemd-selinux
  xmlto
  yelp-tools
)
source=(
  "git+https://gitlab.freedesktop.org/dbus/dbus.git?signed#tag=dbus-$pkgver"
  0001-Arch-Linux-tweaks.patch
  dbus-reload.hook
)
b2sums=('669cd4203fbac908db3a20c5b51355d9e84b68c9cc94f8de52e35544a636c6d5d1df8ee2bbdfd6dead53a6bd9865db547aa4af0e913bac697b138c698840d3ce'
        'fbbc5f312864d2c0e61cead42f578cf650ee8a103e9f6e21658d7406e00a9dfb2c70bc4db647f51eb959df1dad7e94ba52af078325c6a18dcd9d0d500fe15fac'
        '9ac03e4dca00b2c31dc505db4c5da5b8498da21377b01abf186800c6da00492abc6a9a2058c3e3b0f282e3b28e0e4f3318114230db0418fe9754ad2420adb4bf')
validpgpkeys=(
  DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90  # Simon McVittie <simon.mcvittie@collabora.co.uk>
)

prepare() {
  cd dbus

  # Lock user account
  git cherry-pick -n 2cb5882dda27341011a034feb6d1d2b5a7c61a3a

  git apply -3 ../0001-Arch-Linux-tweaks.patch
}

build() {
  local meson_options=(
    -D apparmor=disabled
    -D dbus_user=dbus
    -D kqueue=disabled
    -D launchd=disabled
    -D relocation=disabled
    -D selinux=enabled
    -D x11_autolaunch=disabled
  )

  arch-meson dbus build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_dbus-selinux() {
  depends+=(
    libaudit.so
    libcap-ng.so
    libexpat.so
    libsystemd.so
  )
  provides=(
    libdbus
    libdbus-1.so
    libdbus-selinux 
    "${pkgname/-selinux}=${pkgver}-${pkgrel}"
    "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}"
  )
  conflicts=(libdbus libdbus-selinux "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=(libdbus libdbus-selinux)

  meson install -C build --destdir "$pkgdir"

  _pick unit "$pkgdir"/usr/lib/systemd/{system,user}/dbus.service
  _pick docs "$pkgdir"/usr/share/doc

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus/COPYING dbus/LICENSES/AFL-2.1.txt
}

package_dbus-docs-selinux() {
  pkgdesc+=" - Documentation"
  depends=()
  conflicts=("${pkgname/-selinux}")

  mv docs/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    dbus/COPYING dbus/LICENSES/AFL-2.1.txt
}

# vim:set sw=2 sts=-1 et:
