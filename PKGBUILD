# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: openfbt
# Contributor: Werecat
# Contributor: Xyne

_pkgname=cjdns
pkgname=$_pkgname-git
pkgver=22.r4.g6271719f
pkgrel=1
pkgdesc='A routing engine designed for security, scalability, speed and ease of use'
url='https://github.com/cjdelisle/cjdns'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
options=('!distcc' '!strip' '!buildflags')
depends=('bash')
makedepends=('cargo' 'git' 'nodejs' 'python' 'binutils' 'llvm')

optdepends=(
  'cjdnsify: allows you to run some programs bound to your cjdns address'
  'cjdns-git-sysvinit: support for sysvinit (rc.d)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

build() {
  cd $_pkgname
  CJDNS_RELEASE_VERSION="${pkgver}" ./do
}

package() {
  cd $_pkgname
  install -Dm755 cjdroute "$pkgdir/usr/bin/cjdroute"
  install -Dm755 contrib/sh/run-cjdroute.sh "$pkgdir/usr/bin/run-cjdroute"
  install -Dm644 contrib/systemd/$_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 contrib/systemd/$_pkgname-resume.service "$pkgdir/usr/lib/systemd/system/$_pkgname-resume.service"
  install -Dm644 doc/man/cjdroute.conf.5 "$pkgdir/usr/share/man/man5/cjdroute.conf.5"
}
