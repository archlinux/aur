# Maintainer: effeffe - Filippo Falezza <filippo dot falezza at outlook dot com>
_pkgname=tuxedo-drivers-xmg
pkgname=tuxedo-drivers-xmg-dkms-git
pkgver=v4.4.2.r4.g03da958
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
license=("GPL3")
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-drivers-dkms'
          'tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms' 'tuxedo-drivers-dkms')
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=(
  ${_pkgname}::git+https://github.com/effeffe/tuxedo-drivers-XMG.git
  tuxedo_io.conf
  dkms.conf
  )
sha256sums=(
  'SKIP'
  'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
  '3ed9dc778b10d762e81215de23d9bd2075ee99f725b632a41bd3b687c24b7990'
  )
sha512sums=(
  'SKIP'
  '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81'
  '745141b7765b88e67f84b7327653f7185bcd066333349336bf6db1f0ce30b804d145caed6236fe3cd5fab643e8d11d6f48ddd936d070be2c437d63d89ab74190'
  )

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}/"
  install -Dm644 "${_pkgname%}"/Makefile -t "$pkgdir/usr/src/${_pkgname%}/"
  install -Dm644 "${_pkgname%}"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  #cp -avr "${_pkgname%}"/* "$pkgdir/usr/src/${_pkgname%}/"
  cp -avr "${_pkgname%}"/src/* "$pkgdir/usr/src/${_pkgname%}/"
  install -Dm644 "${_pkgname%}"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
}
