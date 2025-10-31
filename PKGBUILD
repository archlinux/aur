# Maintainer: Taijian <taijian@posteo.de>
# Contributors: Patrick Burroughs (Celti), Abbradar, Zephyr, Christian Autermann, Biginoz, Martin Lee, Ricardo Funke,
#               PirateJonno, lh, Cilyan Olowen, Shaffer, Brcha, Lyle Putnam, Det, Boohbah,
#               Lara Maia, Padfoot, Jorge Barroso, carstene1ns, Sebastian Lau

pkgname=plymouth-git
_pkgname=plymouth
pkgver=24.004.60.r173.ge88c403b
pkgrel=1
pkgdesc='Graphical boot splash screen (git version)'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL-2.0-or-later')
depends=(
        'adwaita-fonts'
        'bash'
        'cairo'
        'filesystem'
        'fontconfig'
        'freetype2'
        'libdrm'
        'libevdev'
        'libx11'
        'libxkbcommon'
        'systemd-libs'
        )
makedepends=(
            'docbook-xsl'
            'git'
            'gtk3'
            'meson'
            )
optdepends=('gtk3: x11 renderer')
provides=('plymouth')
conflicts=('plymouth')
backup=('etc/plymouth/plymouthd.conf')
install='plymouth.install'
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git"
       'plymouth.initcpio_hook'
       'plymouth.initcpio_install'
       'plymouthd.conf.patch'
       'plymouth-shutdown.initcpio_install'
       'mkinitcpio-generate-shutdown-ramfs-plymouth.conf'
)

sha256sums=('SKIP'
            'de852646e615e06d4125eb2e646d0528d1e349bd9e9877c08c5d32c43d288b6f'
            '5d9165b7550d6f2c251dda812817528dfd10ab191a7512819eebb2b0d5472dfb'
            'cfd0c754437d582bbc8d2cbb545a777b00b5c77a6302522577e9d88b169e2f59'
            '00ae44f702b5adce9d98d2b702d94c787491a50ad322a6b0fece1f2714743e6e'
            '91df753b37fa33493a3fa4b966f5535e9694022a4ba083dcc504404ab25715b1')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname

  # Use mkinitcpio to update initrd
  sed -i 's/^dracut -f$/mkinitcpio -P/' scripts/plymouth-update-initrd

  # Switch from Cantarell to Adwaita Sans
  sed -i 's/Cantarell/Adwaita Sans/' scripts/keymap-render.py themes/*/*.plymouth.desktop

  # Patch config file
  patch -p1 -i $srcdir/plymouthd.conf.patch
}

build() {
  local meson_options=(
    -D logo=/usr/share/pixmaps/archlinux-logo.png
    -D background-color=0x000000
    -D background-start-color-stop=0x000000
    -D background-end-color-stop=0x4D4D4D
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build

  # Convert logo for the spinner theme
  rsvg-convert '/usr/share/pixmaps/archlinux-logo-text-dark.svg' -o $srcdir/archlinux-logo-text-dark.png
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -r "$pkgdir/run"

  # Install mkinitcpio hook
  install -Dm644 $srcdir/plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/$_pkgname"
  install -Dm644 $srcdir/plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/$_pkgname"
  
  # Install mkinitcpio shutdown hook and systemd drop-in snippet
  install -Dm644 plymouth-shutdown.initcpio_install "$pkgdir/usr/lib/initcpio/install/$_pkgname-shutdown"
  install -Dm644 mkinitcpio-generate-shutdown-ramfs-plymouth.conf "$pkgdir/usr/lib/systemd/system/mkinitcpio-generate-shutdown-ramfs.service.d/plymouth.conf"
  
  # Install logo for the spinner theme
  install -Dm644 $srcdir/archlinux-logo-text-dark.png "$pkgdir/usr/share/$_pkgname/themes/spinner/watermark.png"
  install -Dm644 "$pkgdir/usr/share/$_pkgname/plymouthd.defaults" "$pkgdir/etc/$_pkgname/plymouthd.conf"
}
