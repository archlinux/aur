# Maintainer: Scott Hansen (firecat53) tech at firecat53 dot net
pkgname=goobook-git
_gitname=goobook
pkgver=3.5.1
pkgrel=3
pkgdesc="Search your google contacts from the command-line or mutt."
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL')
conflicts=('goobook')
provides=('goobook')
depends=('python' 'python-simplejson' 'python-google-api-core'
         'python-google-api-python-client' 'python-googleapis-common-protos'
         'python-oauth2client' 'python-pyxdg')
makedepends=('git' 'python-installer' 'python-build' 'python-docutils'
             'python-poetry')
source=("git+https://gitlab.com/goobook/goobook.git")
md5sums=('SKIP')
install=goobook.install

pkgver() {
  cd "$_gitname"
  git describe --tags --always | sed 's|-|.|g'
}

build() {
  cd "$_gitname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_gitname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rst2man.py --strict "$_gitname.1.rst" "$_gitname.1"
  install -Dm644 -Dt "$pkgdir/usr/share/man/man1" "$_gitname.1"
  install -Dm644 -Dt "$pkgdir/usr/share/doc/$_gitname" "README.rst" "CHANGES.rst"
}
