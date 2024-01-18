# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: David Herrmann <dh.herrmann@gmail.com>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD does not build a variant for dbus-broker-units, as there is nothing specific to SELinux there

pkgbase=dbus-broker-selinux
pkgname=(
  dbus-broker-selinux
)
pkgver=35
pkgrel=2
pkgdesc="Linux D-Bus Message Broker with SELinux support"
url="https://github.com/bus1/dbus-broker/wiki"
arch=(x86_64)
license=("Apache-2.0")
groups=(selinux)
depends=(
  audit
  libcap-ng
  expat
  systemd-libs
  libselinux
)
makedepends=(
  meson
  python-docutils
  systemd
)
source=(
  https://github.com/bus1/dbus-broker/releases/download/v$pkgver/${pkgbase/-selinux}-$pkgver.tar.xz{,.asc}
  0001-units-Enable-statically.patch
)
b2sums=('2c270197d76ec157bf2fd8eb561b49cea2739d656fac8129c4ecdd0bbd5804f8e4e427414cb5f209eef4c22cf9559fc409170476d8df0e1d252c0b5aa2288e01'
        'SKIP'
        'c6ad58146a76dbb62548029cf84403ccba355a9ce74b8e081a27a6e3bf4535809741f0621b8a1396cbcb5be55434a90c169829c9b443952477e838c1036b84af')
validpgpkeys=(
  BE5FBC8C9C1C9F60A4F0AEAE7A4F3A09EBDEFF26  # David Herrmann <dh.herrmann@gmail.com>
)

# https://github.com/bus1/dbus-broker/releases
sha256sums=('d50daa31ff33f48693194596ea2aeb1a925183b59cdc82a550774e5c43982252'
            'SKIP'
            'a37cedf7fef8f513f4a79c9893c677ff68dd5184b3918a57c3ec0b0383ea6cb5')

prepare() {
  cd ${pkgbase/-selinux}-$pkgver
  patch -Np1 -i ../0001-units-Enable-statically.patch
}

build() {
  local meson_options=(
    -D audit=true
    -D docs=true
    -D linux-4-17=true
    -D system-console-users=gdm,sddm,lightdm,lxdm
    -D selinux=true
  )

  arch-meson ${pkgbase/-selinux}-$pkgver build "${meson_options[@]}"
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

package_dbus-broker-selinux() {
  depends+=(
    libaudit.so
    libcap-ng.so
    libexpat.so
    libsystemd.so
  )
  provides=("${pkgname/-selinux}")
  conflicts=("${pkgname/-selinux}")

  meson install -C build --destdir "$pkgdir"

  _pick unit "$pkgdir"/usr/lib/systemd/{system,user}/dbus.service
}

# vim:set sw=2 sts=-1 et:
