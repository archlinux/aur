# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=somagic-easycap-smi2021-git
_altname=$(printf ${pkgname%%-git})
_gitname=smi2021
_gitbranch=master
_gitauthor=Manouchehri
pkgver=v0.0.1.r56.g5520828
pkgrel=1
pkgdesc="EasyCap driver module"
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch"
        "https://github.com/stevelacy/EasyCap/raw/master/somagic_firmware.bin"
        "4.8.patch")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums=('SKIP'
            '722128600bd982b1ff6af8e372e361d22ee872282aeab50b62d8769ad2ee08bb2c6612f59ba48736a26c2c47704a7e192af2746ac0746a074bc3aa242bffa712'
            '99f0049238b735e56ad1ffbb62a88e04d71172eb581eb99de343919f04917ea9934239b29ba0b2432a097385ebe71bd45e1b58d1ea582ccf95a20cfc5d041f95')
arch=('i686' 'x86_64')
depends=('')
makedepends=('git' 'linux-headers')
conflicts=("$_gitname" "$_altname")
provides=("$_gitname" "$_altname")
install=easycap-smi2021-modules.install

pkgver() {
  cd "$srcdir/$_gitname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 -i "$srcdir/4.8.patch"
}

build() {
  cd "$srcdir/$_gitname"
  sed -i '0,/obj/{s/$(CONFIG_VIDEO_SMI2021)/m/}' Makefile # Without this, no modules will be built.
  make -C /lib/modules/$(uname -r)/build M=$PWD modules
}

package() {
  cd "$srcdir/$_gitname"
  _major=$(pacman -Q linux | grep -Po "\d+\.\d+")
  _extramodules=extramodules-$_major-ARCH
  _kernel=$(cat /usr/lib/modules/$_extramodules/version)
  install -Dm644 "$srcdir/$_gitname/smi2021.ko" "$pkgdir/usr/lib/modules/$_extramodules/smi2021.ko"
  find "$pkgdir" -name '*.ko' -exec gzip -9 '{}' \; # Compress the module(s)
  install -Dm644 "$srcdir/somagic_firmware.bin" "$pkgdir/usr/lib/firmware/smi2021_3c.bin"
}

# vim:set sw=2 sts=2 et:
