# Maintainer: skwerlman <skw@tetrarch.co>
# Contributor: Sébastien Luttringer
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

_pkgname=dkms
pkgname=$_pkgname-fast-zstd
pkgver=3.1.1
pkgrel=1
pkgdesc='Dynamic Kernel Modules System - patched to use much faster compression settings for ZSTD'
arch=('any')
url='https://github.com/dell/dkms'
license=(GPL-2.0-or-later)
depends=(
  bash
  coreutils
  gawk
  gcc
  kmod
  make
  patch
  sed
)
makedepends=(
  git
)
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
conflicts=('dkms')
provides=('dkms')
backup=('etc/dkms/framework.conf')
install=$_pkgname.install
source=("git+https://github.com/dell/dkms.git#tag=v$pkgver"
        'hook.install'
        'hook.remove'
        'hook.upgrade'
        'hook.sh'
        'faster-zstd.patch')
sha256sums=('ddf1445405b004d8a4aab8b8a55cafe187dbeac1776e65939d23ea889cad2aa7'
            'da2dd53bdb427c3ffbe793fd05f898d8a0545e6dbd346c85fad1717b0f838c62'
            '497422e72b2f10a71caae40c44a07b215425d393acb365700e38944e09f9a554'
            'cc04280e8eb095f4950f5e3c6b2997fbc8d5862d79c5ae29d5943b8ac204d0d4'
            'c1b4a4e2e4e0e0e59ee0887403e79d60b209f3878dbbec6612573f13b90cce01'
            'cb2d4d67b2bca6b21fcf7bb425132ca2ab00ddb30c15fd8481d44f9c8d023444')

package() {
  # alpm hooks
  install -D -m 644 hook.install "$pkgdir/usr/share/libalpm/hooks/70-dkms-install.hook"
  # both upgrade and remove hooks are removing dkms modules.
  # remove always call depmod while upgrade never, as install will later.
  # upgrade is run before remove in order to have the cleanest depmod file,
  # if something goes wrong before the depmod call in install hook.
  install -D -m 644 hook.upgrade "$pkgdir/usr/share/libalpm/hooks/70-dkms-upgrade.hook"
  install -D -m 644 hook.remove "$pkgdir/usr/share/libalpm/hooks/71-dkms-remove.hook"
  # hook helper
  install -D -m 755 hook.sh "$pkgdir/usr/share/libalpm/scripts/dkms"
  # upstream installer
  cd dkms
  # we don't need kconf files and libdir is only for debian stuff, so
  # we install them outside of $pkgdir
  make \
    DESTDIR="$pkgdir" \
    SBIN=/usr/bin \
    KCONF=/../trash \
    LIBDIR=/../trash \
    MODDIR=/usr/lib/modules \
    install
  # quick fix for broken kernel-install scripts
  # see: https://gitlab.archlinux.org/archlinux/packaging/packages/dkms/-/issues/5
  rm -r "$pkgdir/usr/lib"

  cd ..
  patch $pkgdir/usr/bin/dkms faster-zstd.patch
}

# vim:set ts=2 sw=2 et:
