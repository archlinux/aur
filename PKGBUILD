# Maintainer: William Turner <willtur.will@gmail.com>

pkgname=virtualbox-guest-dkms-vmsvga
pkgver=6.1.8
pkgrel=1
pkgdesc='VirtualBox Guest kernel modules sources (VMSVGA fix)'
arch=('x86_64')
url='https://virtualbox.org/'
license=('GPL' 'custom')
depends=('dkms' 'gcc' 'make' 'virtualbox-guest-utils')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
provides=('VIRTUALBOX-GUEST-MODULES')
conflicts=('virtualbox-archlinux-source'
           'virtualbox-guest-source'
           'virtualbox-guest-dkms')
replaces=('virtualbox-archlinux-source'
          'virtualbox-guest-source'
          'virtualbox-guest-modules-lts'
          'virtualbox-guest-dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
install=virtualbox-guest-dkms-vmsvga.install
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2"
        'LocalConfig.kmk'
        'virtualbox-guest-dkms-vmsvga.conf'
        'vboxvmsvga.service')
sha256sums=('426888f83036b6b1f79c272d317a4e8ecf43781f6a266fd7209c03dca504eefc'
            '2be313b98bffde482aad93b00c419f1d5f7645fd9e6053175ffb0d925067f96a'
            'edd0492f0706e03169cdf3654658ea650687c30967ca5e32fde19d43e3dd4e5e'
            'b6da21bfbc2d452aa8e2ae5c118ec8ed8b87ad6d86000e6b27f28c098b9871ca')

prepare() {
  cd "VirtualBox-$pkgver"

  cp "$srcdir/LocalConfig.kmk" .
  echo "VBOX_GCC_OPT=$CXXFLAGS" >> LocalConfig.kmk
}

build() {
  cd "VirtualBox-$pkgver"

  echo 'Build virtualbox'
  ./configure \
    --only-additions \
    --with-makeself=/usr/bin/echo

  source ./env.sh
  kmk
}

package() {
  source "VirtualBox-$pkgver/env.sh"
  cd "VirtualBox-$pkgver/out/linux.$BUILD_PLATFORM_ARCH/release/bin/additions"

  # dkms modules
  install -d -m0755 "$pkgdir/usr/src"
  cp -r src "$pkgdir/usr/src/vboxguest-${pkgver}_OSE"
  echo 'obj-m = vboxguest/ vboxsf/ vboxvideo/' > "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/Makefile"
  sed "s/@VERSION@/$pkgver/" "$srcdir/$pkgname.conf" > "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/dkms.conf"

  # module loading
  install -d -m0755 "$pkgdir/usr/lib/depmod.d"
  printf 'override vboxguest * kernel/misc\noverride vboxsf * kernel/misc\noverride vboxvideo * kernel/misc\n' > "$pkgdir/usr/lib/depmod.d/$pkgname.conf"
  install -d -m0755 "$pkgdir/usr/lib/modules-load.d"
  printf 'vboxguest\nvboxsf\nvboxvideo\n' > "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"

  # systemd unit
  install -D -m0644 "$srcdir/vboxvmsvga.service" "$pkgdir/usr/lib/systemd/system/vboxvmsvga.service"

  # license
  install -D -m0644 "$srcdir/VirtualBox-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
