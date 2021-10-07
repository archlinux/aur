# PKGBUILD copied from Chocobo1
# edited by cuzrawr
# Maintainer: cuzrawr

pkgname=busybox-alpinevariant-git
pkgver=1.34.0.r71.g56f0e886d
pkgrel=1
pkgdesc="This variant of busybox primary focus on ash shell and optimized for everyday use as an light alternative to bash."
arch=('x86_64')
url="https://www.busybox.net/"
license=('GPL')
makedepends=('git' 'ncurses')
provides=('busybox')
conflicts=("busybox" "busybox-custom" "busybox-git")
source=("git+https://git.busybox.net/busybox"
        "config::https://git.alpinelinux.org/aports/plain/main/busybox/busyboxconfig")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "busybox"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "busybox"

  # If you want pure alpine busybox config then uncoment this line:
  # cp "$srcdir/../config" "$srcdir/busybox/.config"
  yes "" | make oldconfig

  cp "$srcdir/../config-example-latest" "$srcdir/busybox/.config"
  # This patch made by myself 
  # it just removes line numbers in history command
  # and made history more readable 
  cp "$srcdir/../show_history-patch.lineedit.c.patch" "$srcdir/busybox/lineedit.c.patch"

  # Uncoment to make custom changes
  #make menuconfig
  # Apply fancy show_history output patch
  patch -p0 < lineedit.c.patch
  
  export KCONFIG_NOTIMESTAMP=1  # reproducible build
  make

  #
  printf "================================note==================================\n"
  printf "Please use \e[1;34mchsh\e[0m to change your default shell.\n"
  printf "And do not forget to add: \n"
  printf "    \e[1;34m /bin/ash \e[0m   to your \e[1;34m /etc/shells \e[0m  \n"
  printf "You may also want relinking by: \n"
  printf "    \e[1;34m ln -sfT ash /usr/bin/sh \e[0m  \n"
  printf "==============================note-EOF================================\n"




}

check() {
  cd "busybox"

  #make check
}

package() {
  cd "busybox"

  install -Dm755 "busybox" -t "$pkgdir/usr/bin"

  install -Dm644 "docs/busybox.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "docs"/BusyBox.{html,txt} -t "$pkgdir/usr/share/doc/busybox"
}
