# Maintainer: James An <james@jamesan.ca>

pkgname=iloot-git
_pkgname=${pkgname%-git}
pkgver=r87.9362ac9
pkgrel=1
pkgdesc='OpenSource tool for iCloud backup extraction'
arch=('any')
url='https://github.com/jamesan/$_pkgname'
license=('unknown')
depends=('python2-gevent' 'python2-protobuf' 'python2-crypto' 'python2-hurry-filesize')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/hackappcom/$_pkgname.git"
        shellscript)
md5sums=('SKIP'
         '9cf1b8a0865b80792d2c9293ab791062')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  find -iname '*.py' -type f -exec sed -ri '1{s/python/python2/}' {} \;
}

build() {
  cd "$_pkgname"
  find -iname '*.py' -type f -exec python2 -m compileall {} +
  find -iname '*.py' -type f -exec python2 -m py_compile {} +
}

package() {
  cd "$_pkgname"

  install --directory -m755 "$pkgdir/usr/lib/$_pkgname"
  install -Dm755 ../shellscript "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

  # Copy all but text files.
  cp -at "$pkgdir/usr/lib/$_pkgname" *
  rm "$pkgdir/usr/lib/$_pkgname/README.md"
  rm "$pkgdir/usr/lib/$_pkgname/requirements.txt"
}
