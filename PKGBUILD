pkgname=idlehack-git
pkgver=0.r4
pkgrel=1
pkgdesc="Monitor dbus and inhibit swayidle when Firefox or Chromium request it "
arch=('i686' 'x86_64')
url="https://github.com/loops/idlehack"
license=('custom:ICS')
provides=('idlehack')
source=("$pkgname::git+https://github.com/loops/idlehack.git")
sha256sums=('SKIP')

pkgver() {
    cd "idlehack-git" || return 1
    rev="$(git rev-list --count HEAD)"
    echo -n "0.r${rev}"
}

build() {
  cd "$srcdir/$pkgname" || return 1

  make || return 1

  sed -i 's/libexec/bin/' idlehack.service
}

package() {
  cd "$srcdir/$pkgname" || return 1

  mkdir -p "$pkgdir/usr/bin"
  cp idlehack "$pkgdir/usr/bin/"
  cp swayidle-inhibit "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp idlehack.service "$pkgdir/usr/lib/systemd/user/"
}
