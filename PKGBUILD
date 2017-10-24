# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=medianumbers-git
pkgver=r0
pkgrel=1
pkgdesc="tools to manipulate video and audio time codes"
arch=('any')
url="https://github.com/dffischer/medianumbers/"
license=('GPL')
depends=('bash')
optdepends=('ffmpeg: for duration and stretch'
            'grep: for duration'
            'bc: for stretch'
            'sed: for sum-time')
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
  ronn --roff *.md
}

package() {
  cd "$_gitname"
  local bindir="$pkgdir/usr/bin"
  install -d "$bindir"
  for program in *.sh
  do
    install "$program" "$bindir/${program%.sh}"
  done
  install -Dm644 -t "$pkgdir/usr/share/man/man1" *.1
}
