# Maintainer: David Rheinsberg <david@readahead.eu>

pkgbase="dbus-broker-git"
pkgname=(
  "dbus-broker-git"
  "dbus-broker-units-git"
)

pkgdesc="Linux D-Bus Message Broker"
pkgver=35.0.gb71a541
pkgrel=1

arch=("x86_64")
license=("Apache-2.0")
url="https://github.com/bus1/dbus-broker/wiki"

depends=(
  'audit>=3.0'
  'expat>=2.2'
  'libcap-ng>=0.6'
  'linux>=4.17'
  'systemd-libs>=230'
)
makedepends=(
  'git'
  'meson>=0.60.0'
  'systemd'
  'python-docutils'
)

source=(
  "$pkgbase::git+https://github.com/bus1/dbus-broker"
  "c-dvar-1::git+https://github.com/c-util/c-dvar#branch=v1"
  "c-ini-1::git+https://github.com/c-util/c-ini#branch=v1"
  "c-list-3::git+https://github.com/c-util/c-list#branch=v3"
  "c-rbtree-3::git+https://github.com/c-util/c-rbtree#branch=v3"
  "c-shquote-1::git+https://github.com/c-util/c-shquote#branch=v1"
  "c-stdaux-1::git+https://github.com/c-util/c-stdaux#branch=v1"
  "c-utf8-1::git+https://github.com/c-util/c-utf8#branch=v1"
  "0001-units-Enable-statically.patch"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$pkgbase"

  local sp
  for sp in {dvar-1,ini-1,list-3,rbtree-3,shquote-1,stdaux-1,utf8-1}; do
    ln -fs "$(realpath --relative-to "subprojects" "$srcdir/c-$sp")" "subprojects/libc$sp"
  done

  patch -Np1 -i "../0001-units-Enable-statically.patch"
}

build() {
  local meson_options=(
    -D audit=true
    -D docs=true
    -D linux-4-17=true
    -D system-console-users=gdm,sddm,lightdm,lxdm
  )

  arch-meson "$pkgbase" build "${meson_options[@]}"
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

package_dbus-broker-git() {
  depends+=(
    "libaudit.so"
    "libcap-ng.so"
    "libexpat.so"
    "libsystemd.so"
  )
  provides=("dbus-broker")
  conflicts=("dbus-broker")

  meson install -C build --destdir "$pkgdir"

  _pick unit "$pkgdir"/usr/lib/systemd/{system,user}/dbus.service
}

package_dbus-broker-units-git() {
  pkgdesc+=" - Service units"
  depends=("dbus-broker")
  provides=(
    "dbus-broker-units"
    "dbus-units"
  )
  conflicts=(
    "dbus-broker-units"
    "dbus-daemon-units"
  )

  mv unit/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
