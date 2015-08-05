# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Harley Laue <losinggeneration@gmail.com>
# Contributer: Zachary W. (hi117) <zacharyw09264@gmail.com>
# Contributer: J. W. Birdsong <jwbirdsong AT gamil DOT com>

pkgname=abraca-git
pkgver=0.8.2
pkgrel=1
pkgdesc="A GTK3 client for the XMMS2 music player, with a focus on collections. Written in Vala"
url="http://abraca.xmms.se"
_giturl="git+https://github.com/Abraca/Abraca"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3' 'libgee' 'xmms2')
makedepends=('vala>=0.24' 'waf')
install=abraca.install
source=('https://github.com/Abraca/Abraca/pull/31.patch')
md5sums=('c5457f441eb6cbf91ce8ea424bc46e38')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=($_gitname)
conflicts+=($_gitname)
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
  patch -p1 < ../31.patch
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
      install -Dm644 "$file" "$icondir/hicolor/${width}x${width}/apps/abraca.png"
  done
  rm "$icondir"/../abraca*
}

