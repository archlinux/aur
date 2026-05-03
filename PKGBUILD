# Maintainer: Massimo Pavoni <real.damax@gmail.com>
# Contributor: Scott Hansen (firecat53) tech at firecat53 dot net

_pkgname=goobook
pkgname="$_pkgname-git"
pkgver=3.5.3.r11.g30b05c5
pkgrel=1
pkgdesc="Search your google contacts from the command-line or mutt."
arch=('any')
url="https://gitlab.com/goobook/goobook"
license=('GPL-3.0-only')
conflicts=('goobook')
provides=('goobook')
depends=('python' 'python-simplejson' 'python-google-api-core'
  'python-google-api-python-client' 'python-google-auth-oauthlib'
  'python-googleapis-common-protos' 'python-oauth2client' 'python-pyxdg')
makedepends=('git' 'python-installer' 'python-build' 'python-docutils'
  'python-pdm-backend' 'python-poetry')
_pkgsrc="goobook"
source=("git+https://gitlab.com/goobook/goobook.git")
md5sums=('SKIP')
install=goobook.install

pkgver() {
  cd "$_pkgsrc"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rst2man --strict "$_pkgsrc.1.rst" "$_pkgsrc.1"
  install -Dm644 -Dt "$pkgdir/usr/share/man/man1" "$_pkgsrc.1"
  install -Dm644 -Dt "$pkgdir/usr/share/doc/$_pkgsrc" "README.rst" "CHANGES.rst"
}
