# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slcurl-snapshot'
_pkgname="${pkgname%-snapshot}"
pkgdesc='A cURL module for the S-Lang interpreter (development snapshot)'
_pkgver=0.2.2-16
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
md5sums=('1328e04edf0db936479a19614aa8dd12')               # Taken from $url
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
sha256sums=(
  '45050a641aa194becc302e574655b28b44e36d7f99a5a1d9464e58560f08d252'
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
    changes.txt INSTALL.txt README doc/text/curl.txt

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" \
    "$pkgdir/usr/share/doc/slang-curl/examples"/*

  rm -rf "$pkgdir/usr/share/doc/slang-curl/"

  pushd "$pkgdir/usr/share/doc"
  ln -srf "$pkgname" "$_pkgname"
  popd > /dev/null
}

# eof
