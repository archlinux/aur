# Maintainer: Taijian <taijian@posteo.de>
# Contributors: Patrick Burroughs (Celti), Abbradar, Zephyr, Christian Autermann, Biginoz, Martin Lee, Ricardo Funke,
#               PirateJonno, lh, Cilyan Olowen, Shaffer, Brcha, Lyle Putnam, Det, Boohbah,
#               Lara Maia, Padfoot, Jorge Barroso, carstene1ns, Sebastian Lau, Balló György

pkgname=plymouth-git
_pkgname=plymouth
pkgver=26.134.222.r570.g3704037f
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
  ninja
)
optdepends=('gtk3: x11 renderer')
provides=('plymouth')
conflicts=('plymouth')
backup=(
  etc/logrotate.d/bootlog
  etc/plymouth/plymouthd.conf
)
source=(
  "git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git"
  plymouth.initcpio_hook
  plymouth.initcpio_install
  plymouth-shutdown.initcpio_install
  plymouthd.conf.patch
  tests.patch
  50-plymouth.conf
)
b2sums=('SKIP'
        'afb2449b542aa3e971eab6b953c907347fdf4e499b4140a5e6736a7c99557c0d8d2fed28dbee56d84c8c619335c59bd382457d85e51145884ad0616e9095f232'
        'bd5569458817a29c300de2fb4abcd2e8cd4f57bdebca47cfed7644b548b36b48b0acc80931ae67e32b7b1feb6dad058dacb8b046ad67a734821d753af40c921e'
        '1af3f8317ac34f2c080f2624a26784019cf12bf2e08ebb5f017762bdb82e4236b469b64e0bf4bfcde27a5dfb6a90cee416af0285548dd45e6c7ba0db8af85e45'
        '9cef4b4f67389904c183352c4d71e31dbf64dc5ccffab8857b782c4c7d5189ac44e09396271921e71908b301afc6cc0b32cf6d781c57c68d96f27a473735b49f'
        'b2223fed8fb59266e19bdbef2eb8d495b7b931f3b9b94055b1f9ce01ef0728107132e309a80e4ed39778005db25d2cf297a282839d88fd9b1f3e8d15079b507f'
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
  
  # ignore tests for now, the build keeps failing...
  # need to patch tests/meson.build to add '-Wno-unused-result' to silence failing error
  patch -p1 -i $srcdir/tests.patch
  #sed -i "s/^subdir('tests')/# subdir('tests')/" ./meson.build


  # Switch from Cantarell to Adwaita Sans; set monospace font to Adwaita Mono
  sed -i 's/Cantarell/Adwaita Sans/
          /TitleFont=Adwaita/a MonospaceFont=Adwaita Mono 12' scripts/keymap-render.py themes/*/*.plymouth.desktop
}

build() {
  arch-meson $_pkgname build \
    -D logo=/usr/share/pixmaps/archlinux-logo.png \
    -D docs=false
  meson compile -C build

  # Convert logo for the spinner theme
  rsvg-convert '/usr/share/pixmaps/archlinux-logo-text-dark.svg' -o archlinux-logo-text-dark.png
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
