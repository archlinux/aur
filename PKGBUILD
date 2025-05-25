# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='slgsl-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver=0.10.0-7
_prever="pre$_pkgver"
pkgver="${_pkgver//-/.}"
pkgrel=3
pkgdesc='An S-Lang module for the GNU Scientific Library (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc' 'gsl' 'slang')
provides=('slgsl')
conflicts=("${provides[@]}")
options=('!makeflags')
source=("${url}$_pkgname-$_prever.tar.gz")
md5sums=('952ce587e0d62642ce365f230ef2c23a')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_prever"

  ./configure --prefix=/usr && make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install

  # Redundant (and in the “wrong” place)
  rm -vrf "$pkgdir/usr/share/doc/slang-gsl/"

  # Install extra documentation
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    changes.txt INSTALL.txt README doc/text/slgsl.txt

  # — and examples
  cp -vfax examples "$pkgdir/usr/share/doc/$pkgname/"

  # License
  install -vDm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

b2sums=(
  '6d19ad00dbda0d44413bd0aa78c79aae69b6b10a23a9c90d81de8e07a29abe886c975bfccfd687f8a5a382c2711d92e146332f5667d5f5694627ab54279314a4'
)

# eof
