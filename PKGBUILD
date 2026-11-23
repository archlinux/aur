# Maintainer: agony <27015 at riseup dot net>

pkgname=openkermit-git
pkgver=r807.77ebfe4
pkgrel=1
pkgdesc='Portable network and serial communication and automation software (git version)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/OpenKermit/ckermit'
license=('BSD-3-Clause')
depends=('glibc' 'ncurses' 'openssl' 'pam')
makedepends=('git')
checkdepends=('check')
provides=('openkermit')
conflicts=('openkermit' 'ckermit')
source=("openkermit::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd openkermit
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd openkermit
  make linux+ssl KFLAGS="${CPPFLAGS} ${CFLAGS}" LNKFLAGS="${LDFLAGS}" SSLLIB= SSLINC=
}

check() {
  cd openkermit
  make -s check
  [[ "$(./wermit -H -Y -C 'echo \v(fullversion), quit' < /dev/null)" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
  [[ "$(printf 'echo name demo\n' | ./wermit -H -Y)" == 'name demo' ]]
  [[ "$(printf 'echo \\freplace(name demo,demo,kermit)\n' | ./wermit -H -Y)" == 'name kermit' ]]
}

package() {
  cd openkermit
  install -Dm755 wermit "${pkgdir}/usr/bin/kermit"
  ln -s kermit "${pkgdir}/usr/bin/kermit-sshsub"
  install -Dm644 ckuker.nr "${pkgdir}/usr/share/man/man1/kermit.1"
  install -Dm644 COPYING.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
