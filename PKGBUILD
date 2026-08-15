# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slcurl-snapshot'
_pkgname="${pkgname%-snapshot}"
pkgdesc='A cURL module for the S-Lang interpreter (development snapshot)'
_pkgver=0.2.2-18
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=1
changelog="$_pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('GPL-2.0-or-later')
depends=('glibc' 'libcurl.so' 'slang')
provides=('slcurl')
conflicts=("${provides[@]}")
url='https://jedsoft.org/snapshots/'
options=('!makeflags')
source=("${url}$_pkgname-$_prever.tar.gz")
md5sums=('e522e25e4ed6bdc18a3f2963958bb4cf')               # Taken from $url
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
sha256sums=(
  'd1b7c080d67db4642f74b829ca5b653ad33ece07399ebfba4139331f314c4696'
)

build() {
  cd "$_pkgname-$_prever"

  _opts=(
    '--prefix=/usr'
    "--docdir=/usr/share/doc/$pkgname"
  )
  ./configure "${_opts[@]}" && make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" PACKAGE="$pkgname" install

  # Install extra documentation
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    changes.txt INSTALL.txt README

  pushd "$pkgdir/usr/share/doc"
  ln -srf "$pkgname" "$_pkgname"
  popd > /dev/null
}

# eof
