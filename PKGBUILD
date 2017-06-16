# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: openfbt
# Contributor: Werecat
# Contributor: Xyne

_pkgname=cjdns
pkgname=$_pkgname-git
pkgver=19.1.r121.g66b60035
pkgrel=1
pkgdesc='A routing engine designed for security, scalability, speed and ease of use'
url='https://github.com/cjdelisle/cjdns'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
options=('!distcc' '!strip' '!buildflags')
depends=('bash')
makedepends=('git' 'nodejs' 'python2')

optdepends=(
  'cjdnsify: allows you to run some programs bound to your cjdns address'
  'cjdns-git-sysvinit: support for sysvinit (rc.d)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "git+$url#branch=crashey"
  'build-fix.patch'
)

sha512sums=(
  'SKIP'
  'f8effe23cde89aed048a796bc181fac0a5dc272132d819d91b7c777ec30e00cf7682e4f7e50413d6b2ecab366d5eb8925fb91f6b2ab063faebf5604004f3ec09'
)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

prepare() {
  cd $_pkgname
  patch -p1 < ../build-fix.patch
}

build() {
  cd $_pkgname
  bash 'do'
}

package() {
  cd $_pkgname
  install -Dm755 cjdroute "$pkgdir/usr/bin/cjdroute"
  install -Dm755 contrib/sh/run-cjdroute.sh "$pkgdir/usr/bin/run-cjdroute"
  install -Dm644 contrib/systemd/$_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 contrib/systemd/$_pkgname-resume.service "$pkgdir/usr/lib/systemd/system/$_pkgname-resume.service"
  install -Dm644 doc/man/cjdroute.conf.5 "$pkgdir/usr/share/man/man5/cjdroute.conf.5"
}
