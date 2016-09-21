# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgver=2.0.1
pkgname=python-path-and-address-git
pkgrel=1
pkgdesc="Functions for server CLI applications used by humans."
arch=('any')
url="https://github.com/joeyespo/path-and-address"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)

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
  cd "$_gitname"
  grep -Po "(?<=version=').*(?=',)" setup.py | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
