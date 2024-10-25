# Maintainer: Sébastien Luttringer
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

_pkgname=dkms
pkgname=${_pkgname}-git
pkgver=3.1.1.r3.g8a8a9d1
pkgrel=1
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
pkgdesc='Dynamic Kernel Modules System (upstream Git version)'
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
backup=('etc/dkms/framework.conf')
install=$_pkgname.install
source=("git+https://github.com/dell/dkms.git"
        'hook.install'
        'hook.remove'
        'hook.upgrade'
        'hook.sh')
sha256sums=('SKIP'
            'da2dd53bdb427c3ffbe793fd05f898d8a0545e6dbd346c85fad1717b0f838c62'
            '497422e72b2f10a71caae40c44a07b215425d393acb365700e38944e09f9a554'
            'cc04280e8eb095f4950f5e3c6b2997fbc8d5862d79c5ae29d5943b8ac204d0d4'
            'c1b4a4e2e4e0e0e59ee0887403e79d60b209f3878dbbec6612573f13b90cce01')

checksums=('SKIP'
           aa
           aa
           aa
           aa)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
}

# vim:set ts=2 sw=2 et:
