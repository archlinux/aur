# Maintainer: Sameer Puri <aur at purisa dot me>
pkgname='kfreestyle2d-git'
pkgver=0.0.1.eef59af
pkgrel=2
pkgdesc='Unofficial Kinesis Freestyle 2 Userspace Linux Driver'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64' )
url=https://github.com/whereswaldon/kfreestyle2d
license=('MIT')
depends=('make' 'gcc')
provides=('kfreestyle2d')
source=('git+https://github.com/whereswaldon/kfreestyle2d.git' 'uinput.conf' 'kfreestyle2d.conf')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
   cd kfreestyle2d
   echo "0.0.1.$(git rev-parse --short @)"
}

install=$pkgname.install

group='uinput'
prefix='/usr/bin'

build() {
   cd kfreestyle2d
   make
   cat 99-kfreestyle2d.rules.template | sed "s|<<<GROUP>>>|$group|g" > 99-kfreestyle2d.rules
   cat kfreestyle2d.service.template | sed "s|<<<PREFIX>>>/kfreestyle2d|$prefix|g" \
   | sed "s|<<<GROUP>>>|$group|g" > kfreestyle2d.service
}

package() {
  cd kfreestyle2d
  install -Dm755 kfreestyle2d "${pkgdir}/usr/bin/kfreestyle2d"
  install -Dm644 99-kfreestyle2d.rules "${pkgdir}/etc/udev/rules.d/99-kfreestyle2d.rules"
  install -Dm644 kfreestyle2d.service "${pkgdir}/usr/lib/systemd/system/kfreestyle2d.service"
  install -Dm644 "${srcdir}/uinput.conf" "${pkgdir}/usr/lib/sysusers.d/uinput.conf"
  install -Dm644 "${srcdir}/kfreestyle2d.conf" "${pkgdir}/etc/modules-load.d/kfreestyle2d.conf"
}
