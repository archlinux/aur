# PKGBUILD copied from Chocobo1 (thanks)
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
conflicts=("busybox" "busybox-custom" "busybox-custom-git" "mindi-busybox" "busybox-norootreboot" "busybox-git")
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
