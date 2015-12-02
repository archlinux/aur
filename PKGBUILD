# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: openfbt
# Contributor: Werecat
# Contributor: Xyne

_pkgname=cjdns
pkgname=$_pkgname-git
pkgver=17.1.r72.g68693cc
pkgrel=2
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
source=("git+$url#branch=crashey" 'seccomp-bind-getsockaddr.patch')
sha512sums=('SKIP' '547db6c204c029375fa435414dc3a15d4df3cb6d73a65ad7c9476454dc1cc5ded6cf5cfca75ccd580ed98b2ca4508127572eb4bd2d4c7847015c94c014bd18a4')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

prepare() {
  cd $_pkgname
  patch -p1 < ../seccomp-bind-getsockaddr.patch
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
  install -Dm644 doc/man/cjdroute.conf.5 "$pkgdir/usr/share/man/man5/cjdroute.conf.5"
}
