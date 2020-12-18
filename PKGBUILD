# Maintainer: William Turner <willtur.will@gmail.com>

pkgname=virtualbox-guest-dkms-vmsvga
pkgver=6.1.16
pkgrel=1
pkgdesc='VirtualBox Guest kernel modules sources (VMSVGA resize and multi-head fix)'
arch=('x86_64')
url='https://virtualbox.org/'
license=('GPL' 'custom')
depends=('dkms' 'gcc' 'make' 'virtualbox-guest-utils')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
provides=('VIRTUALBOX-GUEST-MODULES')
conflicts=('virtualbox-archlinux-source'
           'virtualbox-guest-dkms'
           'virtualbox-guest-source')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2"
        'vboxvmsvga.desktop'
        'virtualbox-guest-dkms-vmsvga.conf')
sha256sums=('49c1990da16d8a3d5bda8cdb961ec8195a901e67e4c79aea44c1521a5fc2f9f1'
            '4404a95eb6f5c30683625e870fe7a26e562200c2220728d0c14151dbf9667e36'
            'edd0492f0706e03169cdf3654658ea650687c30967ca5e32fde19d43e3dd4e5e')

build() {
  cd "VirtualBox-$pkgver"

  echo 'Build virtualbox'
  ./configure \
    --only-additions \
    --disable-kmods \
    --with-makeself=/usr/bin/echo
}

package() {
  cd "VirtualBox-$pkgver"

  source ./env.sh

  # dkms modules
  src/VBox/Additions/linux/export_modules.sh --folder "$pkgdir/usr/src/vboxguest-${pkgver}_OSE"
  echo 'obj-m = vboxguest/ vboxsf/ vboxvideo/' > "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/Makefile"
  sed "s/@VERSION@/$pkgver/" "$srcdir/$pkgname.conf" > "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/dkms.conf"

  # module loading
  install -d -m0755 "$pkgdir/usr/lib/depmod.d"
  printf 'override vboxguest * kernel/misc\noverride vboxsf * kernel/misc\noverride vboxvideo * kernel/misc\n' > "$pkgdir/usr/lib/depmod.d/$pkgname.conf"
  install -d -m0755 "$pkgdir/usr/lib/modules-load.d"
  printf 'vboxguest\nvboxsf\nvboxvideo\n' > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"

  # autostart
  install -D -m0644 "$srcdir/vboxvmsvga.desktop" "$pkgdir/etc/xdg/autostart/vboxvmsvga.desktop"

  # license
  install -D -m0644 "$srcdir/VirtualBox-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
