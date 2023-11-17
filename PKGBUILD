# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Vincent.Ducamps <aur@ducamps.win>
pkgname=gnome-shell-extension-pop-shell
pkgver=1.2.0+299+gaafc945
pkgrel=1
pkgdesc="GNOME Shell extension for advanced tiling window management"
arch=('any')
url="https://github.com/pop-os/shell"
license=('GPL3')
depends=('fd' 'gnome-shell' 'pop-launcher' 'pop-shell-shortcuts' 'xorg-xprop')
makedepends=('typescript' 'git')
optdepends=('gnome-control-center: keybinding categories'
            'gnome-shell-extensions: for Native Window Placment extension')
_commit=aafc9458a47a68c396933c637de00421f5198a2a  # branch/master_mantic
source=("git+https://github.com/pop-os/shell.git#commit=${_commit}"
        '0001-Remove-schema-handling-from-transpile.sh.patch'
        '0002-fix-check-if-extension-local-schemas-dir-exists-before-use.patch'
        '50_org.gnome.desktop.wm.keybindings.pop-shell.gschema.override'
        '50_org.gnome.mutter.pop-shell.gschema.override'
        '50_org.gnome.mutter.wayland.pop-shell.gschema.override'
        '50_org.gnome.settings-daemon.plugins.media-keys.pop-shell.gschema.override'
        '50_org.gnome.shell.pop-shell.gschema.override')
sha256sums=('SKIP'
            '84b5132edab34ca1af33e310838ad1e430e2ed796da4ec9d3ab646b9f61a71cf'
            'aafdc3eac6ed9cb40b248cfa8e7d45c2a2ea018d09a7734a57181659773421ab'
            '6801f3e12a539167a0c2b64c7deccc1726b51e681b0bc932e8a5f628f86e69df'
            'fcddff7a7689ea0f9ac3d983d224d347e093d5eda1c7c1d875133248f8b812c0'
            'd3a4ac86303c9065fd76dace64283573079c3bdce4b9a2ca18be5f103eb6fd4c'
            '77f854c2f4509ed83d3d99a40018914f031f61f945e1acbf527fcc65adb5f252'
            '7b729a10fe29f2af7bac3022d87fece43ed4094b3ad2a9ac3a61ffc465dadde1')

pkgver() {
  cd shell
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd shell
  patch -Np1 -i ../0001-Remove-schema-handling-from-transpile.sh.patch

  # https://github.com/pop-os/shell/pull/1676
  patch -Np1 -i ../0002-fix-check-if-extension-local-schemas-dir-exists-before-use.patch

  # Fix the title bar showing/hiding
  git cherry-pick -n 3386f426b1750a166c767c583dcb69ed2997234f
}

build() {
  cd shell
  make
}

package() {
  cd shell
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

