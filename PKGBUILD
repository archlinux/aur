# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Swift Geek <swiftgeek@gmail.com>

pkgname=earlyoom-git
pkgver=1.8.1.r1.ge6c7978
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('i686' 'x86_64')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
depends=('glibc')
makedepends=('git' 'pandoc')
checkdepends=('cppcheck' 'go')
optdepends=('systembus-notify: desktop notifications')
provides=("earlyoom=$pkgver")
conflicts=('earlyoom')
backup=("etc/default/earlyoom")
source=("git+https://github.com/rfjakob/earlyoom.git")
sha256sums=('SKIP')


prepare() {
  cd "earlyoom"

  sed '/systemctl|chcon/d' -ri "Makefile"
  sed '/^DynamicUser=/a SupplementaryGroups=proc' -i "earlyoom.service.in"
  sed 's;^EARLYOOM_ARGS="(.*)";EARLYOOM_ARGS="\1 -n --avoid '\''(^|/)(init|systemd|Xorg|sshd)$'\''";' -ri "earlyoom.default"
}

pkgver() {
  cd "earlyoom"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "earlyoom"

  make \
    PREFIX="/usr"
}

check() {
  cd "earlyoom"

  #make test
}

package() {
  cd "earlyoom"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    SYSTEMDUNITDIR="/usr/lib/systemd/system" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/earlyoom"
}
