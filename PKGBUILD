# Maintainer: Lili1228 <aur at gramywpsl dot pl>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TankMissile <alecfeldman@disroot.org>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>

_pkgname=plymouth
pkgname="${_pkgname}-nosystemd"
pkgver=22.02.122
pkgrel=7
pkgdesc='Graphical boot splash screen for non-systemd setups'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/Plymouth/'
license=('GPL2')
depends=('bash' 'cairo' 'cantarell-fonts' 'filesystem' 'glib2' 'glibc' 'libdrm' 'libpng' 'pango' 'elogind')
makedepends=('gtk3' 'docbook-xsl')
optdepends=('gtk3: x11 renderer')
provides=('plymouth')
conflicts=('plymouth')
backup=('etc/plymouth/plymouthd.conf')
install='plymouth.install'
source=("https://www.freedesktop.org/software/${_pkgname}/releases/${_pkgname}-$pkgver.tar.xz"
        'plymouth.initcpio_hook'
        'plymouth.initcpio_install'
        'artix-logo.png')
sha256sums=('100551442221033ce868c447ad6c74d831d209c18ae232b98ae0207e34eadaeb'
            'de852646e615e06d4125eb2e646d0528d1e349bd9e9877c08c5d32c43d288b6f'
            'ed2730171d537486986792090874084d78500e702fd355b8b8fed030baddacc4'
            '2a218ad4f7c202f0164eeccf02263b88b6c93c21301f346270e8bdd40463132c')

prepare() {
  cd "${_pkgname}-$pkgver"

  # systemd
  # Add mkinitcpio support to plymouth-switch-root-initramfs.service
  # https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/202
  # patch -Np1 -i ../plymouth-shutdown.patch

  # Use mkinitcpio to update initrd
  sed -i 's/dracut -f/mkinitcpio -P/' scripts/plymouth-update-initrd

  # Change default theme
  sed -i 's/^Theme=spinner$/Theme=bgrt/' src/plymouthd.defaults
}

build() {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib --sysconfdir=/etc \
              --localstatedir=/var --runstatedir=/run --with-runtimedir=/run \
              --with-logo=/usr/share/plymouth/artix-logo.png --enable-systemd-integration=no
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/var/run"

  # Install mkinitcpio hook
  install -Dm644 ../plymouth.initcpio_hook "$pkgdir/usr/lib/initcpio/hooks/${_pkgname}"
  install -Dm644 ../plymouth.initcpio_install "$pkgdir/usr/lib/initcpio/install/${_pkgname}"
  
  # Install logo for the spinner theme
  install -Dm644 ../artix-logo.png "$pkgdir/usr/share/${_pkgname}/themes/spinner/watermark.png"
  install -Dm644 ../artix-logo.png "$pkgdir/usr/share/${_pkgname}/artix-logo.png"
}

