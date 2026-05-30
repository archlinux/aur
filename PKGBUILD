# Maintainer: Taijian <taijian@posteo.de>
# Contributors: Patrick Burroughs (Celti), Abbradar, Zephyr, Christian Autermann, Biginoz, Martin Lee, Ricardo Funke,
#               PirateJonno, lh, Cilyan Olowen, Shaffer, Brcha, Lyle Putnam, Det, Boohbah,
#               Lara Maia, Padfoot, Jorge Barroso, carstene1ns, Sebastian Lau, Balló György

pkgname=plymouth-git
_pkgname=plymouth
pkgver=26.134.222.r6.g96f5c010
pkgrel=1
pkgdesc='Graphical boot splash screen (git version)'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL-2.0-or-later')
depends=(
  adwaita-fonts
  bash
  cairo
  filesystem
  fontconfig
  freetype2
  glib2
  glibc
  libdrm
  libevdev
  libpng
  libx11
  libxkbcommon
  pango
  systemd-libs
  xkeyboard-config
)
makedepends=(
  docbook-xsl
  git
  gtk3
  meson
)
optdepends=('gtk3: x11 renderer')
provides=('plymouth')
conflicts=('plymouth')
backup=(
  etc/logrotate.d/bootlog
  etc/plymouth/plymouthd.conf
)
install='plymouth.install'
source=(
  "git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git"
  plymouth.initcpio_hook
  plymouth.initcpio_install
  plymouth-shutdown.initcpio_install
  plymouthd.conf.patch
  50-plymouth.conf
)
b2sums=('SKIP'
        'afb2449b542aa3e971eab6b953c907347fdf4e499b4140a5e6736a7c99557c0d8d2fed28dbee56d84c8c619335c59bd382457d85e51145884ad0616e9095f232'
        'bd5569458817a29c300de2fb4abcd2e8cd4f57bdebca47cfed7644b548b36b48b0acc80931ae67e32b7b1feb6dad058dacb8b046ad67a734821d753af40c921e'
        '1af3f8317ac34f2c080f2624a26784019cf12bf2e08ebb5f017762bdb82e4236b469b64e0bf4bfcde27a5dfb6a90cee416af0285548dd45e6c7ba0db8af85e45'
        '401a649632fe606c0ff6cd7bd43d6dadc6df568ab810605c84fc313781dd0a827ff0fe5505a89eaa94b3ac98b5f04093bf6a382a2a9b547097b97bf48de99bee'
        '5ab47942d222c311b495d056f24bdd9d08438162fef1ca6e51982fc00018acbf0c31e4c61164b40950fe2511e17ba2a4635894d145d83a9b349e5a8a83f8c026')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname

  # Use mkinitcpio to update initrd
  sed -i 's/^dracut -f$/mkinitcpio -P/' scripts/plymouth-update-initrd

  # Patch config file
  patch -p1 -i $srcdir/plymouthd.conf.patch

  # Switch from Cantarell to Adwaita Sans; set monospace font to Adwaita Mono
  sed -i 's/Cantarell/Adwaita Sans/
          /TitleFont=Adwaita/a MonospaceFont=Adwaita Mono 12' scripts/keymap-render.py themes/*/*.plymouth.desktop
}

build() {
  arch-meson $_pkgname build \
    -D logo=/usr/share/pixmaps/archlinux-logo.png
  meson compile -C build

  # Convert logo for the spinner theme
  rsvg-convert '/usr/share/pixmaps/archlinux-logo-text-dark.svg' -o archlinux-logo-text-dark.png
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"

  # Install mkinitcpio hook
  install -Dm644 plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/$_pkgname"
  install -Dm644 plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/$_pkgname"

  # Install mkinitcpio shutdown hook and systemd drop-in snippet
  install -Dm644 plymouth-shutdown.initcpio_install "$pkgdir/usr/lib/initcpio/install/$_pkgname-shutdown"
  install -Dm644 50-plymouth.conf "$pkgdir/usr/lib/tmpfiles.d/50-plymouth.conf"
  
  # Install logo for the spinner theme
  install -Dm644 archlinux-logo-text-dark.png "$pkgdir/usr/share/$_pkgname/themes/spinner/watermark.png"
}
