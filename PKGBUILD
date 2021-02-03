# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

# NOTE: This should be rebuilt when your terminfo files change

pkgname=terminfo-italics
pkgver=6.2
pkgrel=2
pkgdesc='Common terminfo formats patched to support italics'
arch=('any')
url='http://www.gnu.org/software/ncurses/'
license=('MIT')
makedepends=("ncurses>=$pkgver")
source=('LICENSE')
sha512sums=('710b8e810862868eb3fbb2e5a63098f4303f0080b4b760931ee6ae406866aba5fe9df2387c5d0506e2d3a74864e7ccc7a81ddd7e0f671d7de8bc1ceecaa04b35')

_patch_terminfo() {
  infocmp "$1" | sed \
    -e 's/^'$1'[^|]*|[^,]*,/'$1'-it|'$1' with italics support,/' \
    -e 's/%?%p1%t;3%/%?%p1%t;7%/' \
    -e 's/smso=[^,]*,/smso=\\E[7m,/' \
    -e 's/rmso=[^,]*,/rmso=\\E[27m,/' \
    -e '$s/$/ sitm=\\E[3m, ritm=\\E[23m,/' > "$1".tmp

  tic "$1".tmp -o terminfo
  rm "$1".tmp
}

build() {
  [[ -d terminfo ]] && rm -rf terminfo

  while read -r; do
    if [[ "$REPLY" =~ ^(rxvt-unicode|screen|st-|xterm).*color ]]; then
      printf '%s\n' "Patching: $REPLY"
      _patch_terminfo "$REPLY"
    fi
  done < <(find /usr/share/terminfo -type f ! -iname '*-it' | sed 's|.*/||')
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir"/usr/share
  mv terminfo "$pkgdir"/usr/share/
}
