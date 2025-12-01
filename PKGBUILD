# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='ftr-site-config-git'
_pkgname="${pkgname/-git/}"
pkgver=2025.12.1.r3746.g44ec894
pkgrel=1
pkgdesc='Full-Text RSS: Site-specific article extraction rules (development version)'
arch=('any')
url='https://github.com/fivefilters/ftr-site-config'
license=('CC0-1.0')  # SPDX-License-Identifier: CC0-1.0
makedepends=('findutils' 'git')
depends=()
optdepends=()
source=(
  "$_pkgname::git+$url.git"
  'CC0-1.0.txt::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt'
)
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP' 'SKIP')
options=('!strip')

pkgver() {
  cd "$_pkgname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || {
      _today=''; _today=$(printf '%(%Y.%-m.%-d)T')
      printf '%s.r%s.g%s' "$_today" \
        "$(git rev-list  --count HEAD)" \
	"$(git rev-parse --short=7 HEAD)"
    }
  )
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
}

build() {
  cd "$_pkgname"

  : pass
}

package() {
  cd "$_pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/CC0-1.0.txt"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  find . -maxdepth 1 -type f -name '\.*.txt' -print0 \
  | xargs -r0 install -Dm0644 -t "$pkgdir/usr/share/$_pkgname"

  find . -maxdepth 1 -type f -name   '*.txt' -print0 \
  | xargs -r0 install -Dm0644 -t "$pkgdir/usr/share/$_pkgname"

  rm -f "$pkgdir/usr/share/$_pkgname/LICENSE.txt"

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof
