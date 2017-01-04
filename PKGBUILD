# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributer: Zachary W. (hi117) <zacharyw09264@gmail.com>
# Contributer: J. W. Birdsong <jwbirdsong AT gamil DOT com>

pkgname=abraca-git
pkgver=0.8.2
pkgrel=2
pkgdesc="A GTK3 client for the XMMS2 music player, with a focus on collections. Written in Vala"
url="http://abraca.xmms.se"
_giturl="git+https://github.com/Abraca/Abraca"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3' 'libgee' 'xmms2')
makedepends=('vala>=0.24' 'waf')
install=abraca.install
source=('https://github.com/Abraca/Abraca/pull/33.patch')
md5sums=('e2884a1a4dca92da76617334ede7e6b0')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_gitname

  # Pull in subzero.
  git submodule update --init --recursive

  # Patch to restore compilation.
  patch -p1 < ../33.patch

  # Use dynamic icon.
  sed -i 's/\(Icon=abraca\)-.*/\1/' data/*.desktop
}

build() {
  cd $_gitname

  waf configure --prefix=/usr
  waf build
}

package() {
  cd $_gitname

  waf --destdir="$pkgdir" install

  # Install icons to correct location.
  local icondir="$pkgdir/usr/share/icons/hicolor"
  install -Dm644 -t "$icondir/scalable/apps" data/abraca.svg
  find data -regex '.*/abraca-[0-9]*\.png' -print0 | \
    while read -d $'' file; do
      width=${file##*-}
      width=${width%.png}
      install -Dm644 "$file" "$icondir/${width}x${width}/apps/abraca.png"
  done
  rm "$icondir"/../abraca*
}

