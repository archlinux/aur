# Maintainer: envolution
# Contributor: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# shellcheck shell=bash disable=SC2034,SC2154
# source and patches from debian sid

pkgname=phalanx
pkgver=25.1.1
_debver=${pkgver%%.*}
_debrel=${pkgver##*.}
pkgrel=1
pkgdesc="A chess engine which understands the xboard protocol. It's suitable for beginner and intermediate players"
url="http://phalanx.sourceforge.net/"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
optdepends=('xboard: to be able to use the xboard graphical frontend')

source=("http://deb.debian.org/debian/pool/main/p/phalanx/phalanx_${_debver}.orig.tar.gz"
  "http://deb.debian.org/debian/pool/main/p/phalanx/phalanx_${_debver}-${_debrel}.debian.tar.xz")
sha256sums=('b3874d5dcd22c64626b2c955b18b27bcba3aa727855361a91eab57a6324b22dd'
            '861bdc78c6a8b8c0d69f8a830d06076eedf8192ce6b393fd4e02529d279989a0')

prepare() {
  rm -rf "$pkgname-$pkgver" && mv Phalanx-* "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  # Apply Debian patches using the series file
  if [[ -f "../debian/patches/series" ]]; then
    while read -r patch; do
      [[ -z $patch || $patch == \#* ]] && continue
      patch -Np1 <"../debian/patches/${patch}" || return 1
    done <"../debian/patches/series"
  else
    echo "Warning: patches/series file not found, skipping patching"
  fi
}

build() {
  cd "$pkgname-$pkgver"
  make prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" \
    prefix=/usr \
    bindir=/usr/bin \
    pluginsdir=/usr/share/${pkgname} \
    install
}
# vim:set ts=2 sw=2 et:
