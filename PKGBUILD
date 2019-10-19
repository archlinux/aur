# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('aee-git' 'xae-git')
pkgver=2.2.21.r4.ed7aa90
pkgrel=1
pkgdesc="Classic text editor with both curses and X11 interfaces."
arch=('i686' 'x86_64')
url="https://github.com/xenji/aee.git"
license=('PerlArtistic')
makedepends=('git')
source=("git+$url" fix_help_and_init_file.patch)
sha256sums=('SKIP'
            '328ba28c07512c7044e7438e91908af80e97685942f34be2b6426bf7df640e85')

pkgver() {
  cd ${pkgbase%-git}
  printf "%s.r%s.%s" $(awk -F\" '/AEE_VERSION/ {print $2}' aee_version.h ) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgbase%-git}
  patch -Np1 < "$srcdir"/fix_help_and_init_file.patch
}
  
build() {
  cd ${pkgbase%-git}
  make
  make xae
}

package_aee-git() {
  depends=('glibc')
  provides=('aee')
  conflicts=('aee')

  cd ${pkgbase%-git}
  install -Dpm644 aee.1 "$pkgdir"/usr/share/man/man1/aee.1
  install -Dpm644 help.ae "$pkgdir"/usr/share/$pkgname/help.ae
  install -Dpm644 README.aee "$pkgdir"/usr/share/doc/$pkgname/README.aee
  install -Dpm644 Changes "$pkgdir"/usr/share/doc/$pkgname/Changes
  install -Dpm644 aee.1.ps "$pkgdir"/usr/share/doc/$pkgname/aee.1.ps
  install -Dpm755 aee "$pkgdir"/usr/bin/aee
}

package_xae-git() {
  depends=('libx11' 'aee-git')
  provides=('xae')
  cd ${pkgbase%-git}
  install -Dpm755 xae "$pkgdir"/usr/bin/xae
}
