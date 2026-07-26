# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r535.g46c35064
pkgrel=2
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
  #mv "$pkgdir"/usr/bin/pev{,.plc}

  # Remove setuid from all binaries
  #
  # Some of them can send or capture arbitrary Ether frames (edsu/edru,
  # ef[rsbe]u) and shouldn't be accessible to anyone but root by default.
  #
  # Other tools likely have untested ways to read/write arbitrary files, or
  # buffer overflow exploits, so in general they should not have setuid when
  # all they need is cap_net_raw.
  chmod -c u-s "$pkgdir"/usr/bin/*

  # Grant cap_net_raw to a few "Probably Fine" user-facing binaries
  # Don't grant it to binaries that can reboot/reset/reflash the hardware
  # (i.e. not bin/{int6k,amptool,plctool} nor bin/*boot)
  for file in "$pkgdir"/usr/bin/{amp,plc,int6k}{stat,wait}; do
    setcap cap_net_raw=ep "$file"
    echo "capabilities of '$file' added"
  done

  # Move some junk hardware-devel tools out of $PATH
  mkdir -p "$pkgdir"/usr/lib/$pkgname
  mv -v -t "$pkgdir"/usr/lib/$pkgname/ \
    "$pkgdir"/usr/bin/e[df]?? \
    "$pkgdir"/usr/bin/CMEncrypt \
    "$pkgdir"/usr/bin/{sada,sdram,weeder,int6kuart} \
    "$pkgdir"/usr/bin/{pev,evse} \
    "$pkgdir"/usr/bin/mdio* \
    "$pkgdir"/usr/bin/tty* \
    ;
}

# vim: ts=2:sw=2:et:
