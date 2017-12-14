# Maintainer: fitu996 <fitu996 at gmail dot com>
pkgname=python-crate-git
pkgver=r547.d752d9d
pkgrel=1
pkgdesc="A Python client library for CrateDB."
arch=('any')
url="https://github.com/crate/crate-python"
license=('custom:APACHE')
depends=('python' 'python-urllib3')
makedepends=('python-setuptools')

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
  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  cp LICENSE $pkgdir/usr/share/doc/$pkgname/LICENSE
  cp NOTICE $pkgdir/usr/share/doc/$pkgname/NOTICE
  cp CHANGES.txt $pkgdir/usr/share/doc/$pkgname/CHANGES
}
