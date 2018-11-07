# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

_pkgname=dispad
pkgname=$_pkgname-git
pkgver=r53.5b7528c
pkgrel=2
pkgdesc='A small (user) daemon for disabling trackpads on keyboard input for XOrg.'
license=('GPLv2')
url='https://github.com/BlueDragonX/dispad'
arch=('any')
depends=('confuse' 'libxi' 'xorg-server')
makedepends=('automake' 'git')
install=$_pkgname.install
source=("$pkgname"::"git://github.com/BlueDragonX/dispad.git"
        "$_pkgname.service"
        "$_pkgname.conf.example"
        "user-applications.target")
sha256sums=('SKIP'
            'd9ffac11d513617225a9f4c0defe61d64a7d930a35bd1666210853b204ddca19'
            '8c707e39a5a298a08babad2da4819dfa37d9895ef0131426e81f3608cfa77a88'
            '1a073eeac468fd499e3872db5a9c68e692e0a34a7ed66d3d00270fa155789431')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix="/usr"
  make -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "../$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
  install -Dm644 "../$_pkgname.conf.example" "$pkgdir/usr/share/dispad/$_pkgname.conf.example"
  install -Dm644 "../user-applications.target" "$pkgdir/usr/share/dispad/user-applications.target"
}

# vim: ts=2 sw=2 et:
