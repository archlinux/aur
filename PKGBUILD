# Maintainer: fitu996 <fitu996 at gmail dot com>
pkgname=python-minio-git
pkgver=r728.f1130fd
pkgrel=1
pkgdesc="Minio Python Library for Amazon S3 Compatible Cloud Storage"
arch=('any')
url="https://github.com/minio/minio-py"
license=('APACHE')
depends=('python' 'python-certifi' 'python-nose')
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
}
