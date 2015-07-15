# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_name=audacious
pkgname=${_name}2
pkgver=3.2.4
pkgrel=2
pkgdesc='Lightweight, GTK-based advanced audio player focused on audio quality. Gtk2 version.'
arch=('i686' 'x86_64')
url='http://audacious-media-player.org/'
license=('GPL3')
depends=('gtk2' 'libmcs' 'dbus-glib' 'libguess' 'libsm'
         'desktop-file-utils' 'hicolor-icon-theme')
optdepends=("$pkgname-plugins: required for all"
            'unzip: zipped skins support')
install="$pkgname.install"
source=("http://distfiles.audacious-media-player.org/$_name-$pkgver.tar.gz")
md5sums=('2d8e262ea6ffee704d4d0d72b49b13bc')

build() {
  cd "$srcdir/$_name-$pkgver"

  # Patch to let this coexist with audacious
  for _i in acious client core gui tag tool; do
    msg "Processing aud$_i .."
    sed -i "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g" `grep -rl "[aA]ud$_i" .`
    for _d in `find . -depth -type d -name "*[aA]ud$_i*"`; do
      _n="$(echo $_d | sed "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g")"
      msg "Moving $_d -> $_n" && mv "$_d" "$_n"
    done
    for _f in `find . -depth -type f -name "*[aA]ud$_i*"`; do
      _n="$(echo $_f | sed "s|\([aA]\)\(ud${_i}2\{0,1\}\)|\1ud${_i}2|g")"
      msg "Renaming $_f -> $_n" && mv "$_f" "$_n"
    done
  done

  ./configure --prefix=/usr \
              --disable-gtk3
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"

  make DESTDIR="$pkgdir/" install
}
