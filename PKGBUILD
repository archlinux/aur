# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

set -u
pkgname=libpaper
pkgver=2.2.8
pkgrel=1
pkgdesc="Library for handling paper characteristics"
pkgdesc+=" (32-bit)"
arch=('x86_64')
url="https://github.com/rrthomas/libpaper"
# https://github.com/rrthomas/libpaper/pull/37
# libpaper is LGPL-2.1+
# bundled libgnu is LGPL-2.1+, LGPL-2+ and GPL-3+
# paperspecs is Public Domain
# localepaper.c is FSFAP
# paper.c is GPL-3.0-or-later
# paperconf.c is GPL 2.0 only
# localepaper.c is FSFAP (except it is missing the warranty disclaimer... but the intent is clear)
license=(
    LGPL-2.1-or-later
    LicenseRef-Public-Domain
    GPL-3.0-or-later
    LGPL-2.0-or-later
    FSFAP
    MIT
)
depends=('glibc')
depends=("${depends[@]/#/lib32-}")
depends+=("${pkgname}>=${pkgver}")
provides=('lib32-paper' "${pkgname}.so")
conflicts=('lib32-paper')
replaces=('lib32-paper')
_pkgsrc="${pkgname}-${pkgver}"
source=(https://github.com/rrthomas/libpaper/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        localepaper.c)
sha256sums=('1e330571690191874eca415ec76889dd11bab9887a2302d6a3665cd081c4d77b'
            '7e49c6ce67fbaea77929ab5849026412d0f91f692a902805c0134a071cccde22')

_name="${pkgname}"
pkgname="lib32-${pkgname}"

prepare() {
  cd "${_pkgsrc}"
  cp ../localepaper.c src/
}

build() {
  cd "${_pkgsrc}"

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix=/usr \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
  # localepaper
  pushd src
  gcc $CFLAGS $LDFLAGS -I.. -Ilibgnu -o localepaper localepaper.c libgnu/.libs/libgnupaper.a
  popd
}

check_disabled() {
  cd "${_pkgsrc}"
  make -k check
}

package() {
  cd "${_pkgsrc}"
  make DESTDIR="$pkgdir" install

  # localepaper
  install -Dt "$pkgdir/usr/lib32" -m0755 src/localepaper

  cd "${pkgdir}"
  rm -r 'usr/bin' 'etc' 'usr/include' 'usr/share'
}
set +u
