# Maintainer: Taijian <taijian@posteo.de>
# Contributors: Patrick Burroughs (Celti), Abbradar, Zephyr, Christian Autermann, Biginoz, Martin Lee, Ricardo Funke,
#               PirateJonno, lh, Cilyan Olowen, Shaffer, Brcha, Lyle Putnam, Det, Boohbah,
#               Lara Maia, Padfoot, Jorge Barroso, carstene1ns, Sebastian Lau

pkgname=plymouth-git
_pkgname=plymouth
pkgver=22.02.122.r170.ge8e19371
pkgrel=3
pkgdesc='Graphical boot splash screen (git version)'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL2')
depends=('bash' 'cairo' 'cantarell-fonts' 'filesystem' 'glib2' 'glibc' 'libdrm' 'libpng' 'pango' 'systemd-libs' 'libevdev')
makedepends=('gtk3' 'docbook-xsl' 'git' 'meson')
optdepends=('gtk3: x11 renderer')
provides=('plymouth')
conflicts=('plymouth')
backup=('etc/plymouth/plymouthd.conf')
install='plymouth.install'
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git"
       'plymouth.initcpio_hook'
       'plymouth.initcpio_install'
       'plymouthd.conf.patch'
)

sha256sums=('SKIP'
            'de852646e615e06d4125eb2e646d0528d1e349bd9e9877c08c5d32c43d288b6f'
            '8397a0703339cc11c0e7304b8e7d5e798f9d76acac7a36d54b7460c0a4f19c07'
            'cfd0c754437d582bbc8d2cbb545a777b00b5c77a6302522577e9d88b169e2f59')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname

  # Use mkinitcpio to update initrd
  sed -i 's/dracut -f/mkinitcpio -P/' scripts/plymouth-update-initrd

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
  
  # Install mkinitcpio hook
  install -Dm644 $srcdir/plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/$_pkgname"
  install -Dm644 $srcdir/plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/$_pkgname"
  
  # Install logo for the spinner theme
  install -Dm644 $srcdir/archlinux-logo-text-dark.png "$pkgdir/usr/share/$_pkgname/themes/spinner/watermark.png"
  install -Dm644 "$pkgdir/usr/share/$_pkgname/plymouthd.defaults" "$pkgdir/etc/$_pkgname/plymouthd.conf"
}
