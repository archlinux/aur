# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=hardsub-git
pkgver=r0
pkgrel=1
pkgdesc="burn soft subtitles into video"
arch=('any')
url="https://github.com/dffischer/hardsub"
license=('GPL')
depends=('ffmpeg' 'grep')
makedepends=('ruby-ronn')

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

build() {
  cd "$_gitname"
  sed 's|\(FONTCONFIG_FILE="\).*\(/fonts.conf"\)|\1/usr/share/'"$pkgname"'\2|' \
    -i hardsub.sh
  ronn --roff *.md
}

package() {
  cd "$_gitname"
  install -D hardsub.sh "$pkgdir/usr/bin/hardsub"
  install -D -t "$pkgdir/usr/share/$pkgname" fonts.conf
  install -Dm644 -t "$pkgdir/usr/share/man/man1" *.1
}
