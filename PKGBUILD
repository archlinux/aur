# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-argparse-manpager-git
pkgver=r66
pkgrel=1
pkgdesc="A generator and waf tool to make manual pages from executable python modules."
arch=('any')
url="https://github.com/dffischer/argparse-manpager"
license=('GPL3')
depends=('python')
makedepends=('waf')
optdepends=('waf: to use the corresponding waf tool')

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
  [ ${PIPESTATUS[0]} -eq 0 ] || \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	waf --prefix=/usr configure build
}

package() {
	cd "$_gitname"
	waf install --destdir="$pkgdir/"
}
