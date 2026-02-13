# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=valent
pkgver=1.0.0.alpha.49
pkgrel=1
pkgdesc="Connect, control and sync devices"
arch=('x86_64' 'aarch64')
url="https://valent.andyholmes.ca"
license=(
  'CC0-1.0'
  'CC-BY-SA-3.0'
  'GPL-2.0-or-later'
  'GPL-3.0-or-later'
  'LGPL-2.1-or-later'
)
depends=(
  'evolution-data-server'
  'glycin'
  'gnutls'
  'gstreamer'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libpeas-2'
  'libpipewire'
  'libportal'
  'libportal-gtk4'
  'libpulse'
  'python-dbus'
  'python-gobject'
  'tinysparql'
)
makedepends=(
#  'gi-docgen'  ## -Ddocumentation=true
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)
checkdepends=(
  'python-dbusmock'
  'walbottle'
  'xorg-server-xvfb'
)
optdepends=('bluez: BlueTooth networking')
provides=("${pkgname%-git}" 'libvalent-1.so')
conflicts=("${pkgname%-git}")
source=("git+https://github.com/andyholmes/valent.git#tag=v$pkgver"
        'git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git')
sha256sums=('5d0026475397ddab363db694d671a6a3426614bb396b02ad6349677089a7a213'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$pkgname" build \
    -Dtests=true \
    -Dfuzz_tests=false \
    -Dinstalled_tests=false
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # No, really. Don't install the tests
  rm -rfv "$pkgdir/usr/lib/installed-tests/"
}
