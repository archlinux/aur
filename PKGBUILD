# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Vincent.Ducamps <aur@ducamps.win>
pkgname=gnome-shell-extension-pop-shell
pkgver=1.2.0+292+g0e09473
pkgrel=1
pkgdesc="GNOME Shell extension for advanced tiling window management"
arch=('any')
url="https://github.com/pop-os/shell"
license=('GPL3')
depends=('fd' 'gnome-shell' 'pop-launcher' 'pop-shell-shortcuts' 'xorg-xprop')
makedepends=('typescript' 'git')
optdepends=('gnome-control-center: keybinding categories'
            'gnome-shell-extensions: for Native Window Placment extension')
_commit=0e09473c9d8a1de7476ccf128c028188206c9bb1  # master_jammy
source=("git+${url}.git#commit=${_commit}"
        '0001-Remove-schema-handling-from-transpile.sh.patch'
        '50_org.gnome.desktop.wm.keybindings.pop-shell.gschema.override'
        '50_org.gnome.mutter.pop-shell.gschema.override'
        '50_org.gnome.mutter.wayland.pop-shell.gschema.override'
        '50_org.gnome.settings-daemon.plugins.media-keys.pop-shell.gschema.override'
        '50_org.gnome.shell.pop-shell.gschema.override')
sha256sums=('SKIP'
            'cb5d5652fc2d15bd7c60f8cb38f1ed67cd551db36fbed8603b930d6f024de167'
            '3528ecf59d625eeb83a909f3e4cd3775e2f3ef7d27dc85dc1c8dc980317fad99'
            '08f99d7b7721c25a43cd24ce71830e57256daa6995e2500cd9e6cfe219a661e1'
            '16a372347d46f9079047557ba09a7a2335e5e64d3fa40118dbc6b0d53d8e686c'
            'cb2f53c3c19ed2123373cd3183c3aad1e85d9a661c9e967c6888b7eae3bb18f0'
            '59cf3799036e22718577d0a89468605b6ca1e253d9d7133a8afd640188e2ea9d')
#validpgpkeys=('2A8CB607A1D3332C18E86652B2732D4240C9212C') # Michael Aaron Murphy <michael@system76.com>

pkgver() {
  cd "${srcdir}/shell"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/shell"
  patch -Np1 -i ../0001-Remove-schema-handling-from-transpile.sh.patch
}

build() {
  cd "${srcdir}/shell"
  make
}

package() {
  cd "${srcdir}/shell"
  make DESTDIR="${pkgdir}/" install

  # install the schema file
  install -Dm644 schemas/org.gnome.shell.extensions.pop-shell.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  # install the gnome-control-center keybindings
  install -Dm644 keybindings/*.xml -t \
    "$pkgdir/usr/share/gnome-control-center/keybindings/"

  # install the schema override files
  install -Dm644 "$srcdir"/*.pop-shell.gschema.override -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}

