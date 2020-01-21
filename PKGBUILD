# Maintainer: Jingbei Li <i@jingbei.li>
pkgname=devtools-qemu
pkgver=14.0298784
pkgrel=1
pkgdesc='QEMU based cross-build tools for Arch Linux ARM package maintainers'
arch=('x86_64')
url='https://github.com/arch4edu/devtools-qemu'
license=('GPL')
depends=('archlinuxarm-keyring' 'binfmt-qemu-static' 'devtools-alarm>=20191227' 'qemu-user-static-bin')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd $srcdir/$pkgname

  cp /usr/bin/archbuild qemu_archbuild
  patch qemu_archbuild < qemu.patch

  for i in armv6h armv7h aarch64
  do
    cp /usr/share/devtools/pacman-extra.conf pacman-extra-$i.conf
    cp /usr/share/devtools/makepkg-x86_64.conf makepkg-$i.conf
    patch pacman-extra-$i.conf < pacman-extra-$i.conf.patch
    patch makepkg-$i.conf < makepkg-$i.conf.patch
  done
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/devtools

  cp $srcdir/$pkgname/qemu_archbuild $pkgdir/usr/bin
  cp $srcdir/$pkgname/mirrorlist $pkgdir/usr/share/devtools/qemu_mirrorlist
  cp $srcdir/$pkgname/qemu_archbuild.sh $pkgdir/usr/share/devtools/qemu_archbuild.sh

  for i in armv6h armv7h aarch64
  do
    cp $srcdir/$pkgname/pacman-extra-$i.conf $pkgdir/usr/share/devtools/
    cp $srcdir/$pkgname/makepkg-$i.conf $pkgdir/usr/share/devtools/
    ln -sf /usr/bin/qemu_archbuild $pkgdir/usr/bin/extra-$i-build
  done
}
