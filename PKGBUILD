# Maintainer: cuzrawr
# original PKGBUILD copied from Chocobo1 ( pkg busybox-git ) ( thanks )

pkgname=busybox-alpinevariant-git
pkgver=1.35.0.r133.g8d67007a4
pkgrel=1
pkgdesc="This variant of busybox primary focus on ash shell and optimized for everyday use as an light alternative to bash."
arch=('x86_64')
url="https://www.busybox.net/"
license=('GPL')
makedepends=('git' 'ncurses')
provides=('busybox-alpinevariant-git')
conflicts=("busybox" "busybox-custom" "busybox-custom-git" "mindi-busybox" "busybox-norootreboot" "busybox-git")
source=("git+https://git.busybox.net/busybox"
        "config::https://git.alpinelinux.org/aports/plain/main/busybox/busyboxconfig")
sha256sums=('SKIP'
            'SKIP')
install='busybox-alpinevariant-git.install'

pkgver() {
  cd "busybox"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "busybox"


  # .config: ( check readme.md )
  # cp "$srcdir/../config-example-latest" "$srcdir/busybox/.config"
  #
  # patch:
  # This patch just removes line numbers in history command
  # and making history output more readable and grepable.

  cp "$srcdir/../show_history-patch.lineedit.c.patch" "$srcdir/busybox/lineedit.c.patch"

  # For pure alpine busybox config uncoment this line:
  cp "$srcdir/../config" "$srcdir/busybox/.config"
  yes "" | make oldconfig

  # Uncomment to make custom changes
  #
   #make menuconfig

  # Apply fancy "show history output" patch
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

   # uncomment next lines for installing docs and manpages:
  #install -Dm644 "docs/busybox.1" -t "$pkgdir/usr/share/man/man1"
  #install -Dm644 "docs"/BusyBox.{html,txt} -t "$pkgdir/usr/share/doc/busybox"
}
