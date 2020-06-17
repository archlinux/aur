# Maintainer: William Turner <willtur.will@gmail.com>

pkgname=virtualbox-guest-dkms-vmsvga
pkgver=6.1.10
pkgrel=3
_vboxsf_commit='5aba938bcabd978e4615186ad7d8617d633e6f30'
pkgdesc='VirtualBox Guest kernel modules sources (VMSVGA resize and multi-head fix)'
arch=('x86_64')
url='https://virtualbox.org/'
license=('GPL' 'custom')
depends=('dkms' 'gcc' 'make' 'virtualbox-guest-utils')
makedepends=('git')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
provides=('VIRTUALBOX-GUEST-MODULES')
conflicts=('virtualbox-archlinux-source'
           'virtualbox-guest-dkms'
           'virtualbox-guest-source')
source=("https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2"
        "git+https://github.com/jwrdegoede/vboxsf#commit=$_vboxsf_commit"
        'LocalConfig.kmk'
        'vboxvmsvga.desktop'
        'virtualbox-guest-dkms-vmsvga.conf')
sha256sums=('37d8b30c0be82a50c858f3fc70cde967882239b6212bb32e138d3615b423c477'
            'SKIP'
            '2be313b98bffde482aad93b00c419f1d5f7645fd9e6053175ffb0d925067f96a'
            '4404a95eb6f5c30683625e870fe7a26e562200c2220728d0c14151dbf9667e36'
            'edd0492f0706e03169cdf3654658ea650687c30967ca5e32fde19d43e3dd4e5e')

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
  install -d -m0755 "$pkgdir/usr/src/vboxguest-${pkgver}_OSE"
  cp -r src/{vboxguest,vboxvideo} "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/"
  cp -r "$srcdir/vboxsf" "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/"
  rm -rf "$pkgdir/usr/src/vboxguest-${pkgver}_OSE/vboxsf/.git"
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
