# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# from: git

pkgname=netcat-cpi-dkms-git
_pkgname=netcat-cpi
pkgver=r86.c8798d6
pkgrel=2
pkgdesc="netcats 'cycles per instruction' album as a dkms kernel module."
arch=('i686' 'x86_64')
url="http://netcat.co"
license=('unknown')
depends=('dkms')
makedepends=('git' 'linux-headers')
optdepends=('vorbis-tools: contains a convenient player (ogg123)')
provides=("netcat-cpi-git=$pkgver-$pkgrel")
conflicts=(netcat-cpi-git)
install="cpi.install"
source=("$_pkgname::git+https://github.com/usrbinnc/netcat-cpi-kernel-module.git"
        "cpi.install"
        "dkms.conf"
        "dkms.patch")

sha256sums=('SKIP'
            'db486069143f3925549b491000d93137c12e392ca500f209de52b2e4b791ad3e'
            'f7cfa00f55f88ef76dec88f3a750f5ddc4e6d0f21a40a8b2a887438e4a6c637c'
            '6c5031ba4355fc1cfcba973b5f88ba21a1a0877c4155eebb661a61686f3b302a')

build() {
  sed -e "s/#MODULE_VERSION#/${pkgver}/" -i "dkms.conf"
  cd $_pkgname
  patch -p1 < "$srcdir/dkms.patch"
}

pkgver()
{
  cd "$srcdir/${_pkgname}"
  (
    set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"
  install -Dt "$pkgdir/usr/src/${_pkgname}-$pkgver" -m644 Makefile netcat.h netcat_main.c "$srcdir/dkms.conf"
  install -Dt "$pkgdir/usr/src/${_pkgname}-$pkgver/tracks" tracks/*
}

# vim:set ts=2 sw=2 et:
