# Maintainer: Bryn Edwards <bryn.edwards@gmail.com>
pkgname=supysonic-git
_pkgname=supysonic
pkgver=0.3.495.g92fed40
pkgrel=2
pkgdesc="A Python implementation of the Subsonic server API."
arch=('any')
url="https://github.com/spl0k/$_pkgname"
license=('AGPL')
depends=( 
  'python-flask'
  'python-pony'
  'python-pillow'
  'python-requests'
  'python-mutagen'
  'python-zipstream-ng'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-pip'
)
optdepends=('python-watchdog: Watch for library changes using supysonic-watcher'
            'ffmpeg: transcoder support')
source=("${_pkgname}::git+https://github.com/spl0k/$_pkgname"
        "$_pkgname.ini"
        "$_pkgname.sysusers"
        "$_pkgname.tmpfiles")
sha256sums=('SKIP'
            '8f52e93cd4f13e2e555b5ac4e456020b4395bf311b0226d9d50b13444721872d'
            'b4b723d30fb45f86a15ec218910cd3935aac4546d5e2f9a1e1bc79cccfb98480'
            '430eba10de5381a425074b89d0a46fb770be5112b26e81ac6a2b55765675cb13')
backup=("etc/$_pkgname")

pkgver() {
  cd $_pkgname
  echo "$(grep '^VERSION =' $_pkgname/__init__.py|head -n1|cut -d\' -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

prepare() {
  cd $_pkgname
  cp cgi-bin/server.py $_pkgname
  cp "cgi-bin/$_pkgname.wsgi" $_pkgname/wsgi.py
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm664 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm664 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -m664 -t "$pkgdir/usr/share/doc/$_pkgname" docs/*
  install -dm644 "$pkgdir/var/lib/$_pkgname"

  cd $srcdir
  install -Dm664 "$_pkgname.ini" "$pkgdir/etc/$_pkgname"
  install -Dm664 "$srcdir/$_pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm664 "$srcdir/$_pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
