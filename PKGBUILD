# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r535.g46c35064
pkgrel=1
pkgdesc="Qualcomm Atheros Open Powerline Toolkit for HomePlug AV"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
makedepends=(git)
_commit=46c3506453c15b873fd6ed3e76c9872cea5e143a
source=("git+https://github.com/qca/open-plc-utils#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make \
    ROOTFS="$pkgdir" \
    BIN="$pkgdir"/usr/bin \
    MAN="$pkgdir"/usr/share/man/man1 \
    install \
    manuals

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Install additional docs
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -av docbook "$pkgdir"/usr/share/doc/$pkgname/docbook

  # Avoid conflict with bluez-utils
  mv "$pkgdir"/usr/bin/amptest{,.plc}

  # Avoid conflict with aur/pev
  mv "$pkgdir"/usr/bin/pev{,.plc}

  # Restrict binaries that send or capture arbitrary frames
  for f in "$pkgdir"/usr/bin/e[df]??; do
    chmod -c u-s "$f"
  done

  # Make the remaining binaries look less scary in `ls`
  # (I'm still on the fence about making all of them :wheel-only)
  find "$pkgdir"/usr/bin -type f -perm /u+s \
    -exec chmod -c u-s {} \; \
    -exec setcap cap_net_raw=ep {} \;
}

# vim: ts=2:sw=2:et:
