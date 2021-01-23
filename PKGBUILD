## PKGBUILD adapted from community/gkrellm 2.3.5-5
# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Matt Smith (Majik) <darkknight@helpdesk.zaz.net>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jozef Riha <jose1711@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

_gitname=gkrellm
pkgname=${_gitname}d-git
pkgver=20210123.13f1489
pkgrel=1
pkgdesc="Headless version of system monitor package"
arch=('x86_64' 'i686')
url="http://gkrellm.srcbox.net/"
license=('GPL3')
depends=('lm_sensors')
makedepends=('gettext' 'git' 'make')
provides=('gkrellm')
conflicts=('gkrellm')
backup=('etc/gkrellmd.conf')
options=('emptydirs')
source=('gkrellmd.service'
        'git+https://git.srcbox.net/gkrellm/gkrellm.git')
md5sums=('63c78daed61c82b933f558177f6d3721'
         'SKIP')


pkgver() {
  cd ${srcdir}/${_gitname}
  echo $(date +%Y%m%d).$(git rev-parse --short HEAD)
}

build() {
  cd ${srcdir}/${_gitname}/server
  make LOCALEDIR=/usr/share/locale SYS_LIBS+=-lgmodule-2.0
}

package() {
  cd ${srcdir}/${_gitname}/server

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "gkrellmd.conf" "$pkgdir/etc/gkrellmd.conf"
  install -Dm644 "../../gkrellmd.service" "$pkgdir/usr/lib/systemd/system/gkrellmd.service"
}

# vim:set ts=2 sw=2 et:
