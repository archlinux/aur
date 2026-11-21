# Maintainer: agony <27015 at riseup dot net>

pkgname=openkermit
pkgver=11.1.519
pkgrel=1
pkgdesc='Portable network and serial communication and automation software'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/OpenKermit/ckermit'
license=('BSD-3-Clause')
depends=('glibc' 'ncurses' 'openssl' 'pam')
checkdepends=('check')
conflicts=('ckermit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6239cb015812706a13cf604a68be154613ee5011519fef4c0a4309ecf0a90549')

build() {
  cd "ckermit-${pkgver}"
  make linux+ssl KFLAGS="${CPPFLAGS} ${CFLAGS}" LNKFLAGS="${LDFLAGS}" SSLLIB= SSLINC=
}

check() {
  cd "ckermit-${pkgver}"
  make -s check
  [[ "$(./wermit -H -Y -C 'echo \v(fullversion), quit' < /dev/null)" == "${pkgver}" ]]
  [[ "$(printf 'echo name demo\n' | ./wermit -H -Y)" == 'name demo' ]]
  [[ "$(printf 'echo \\freplace(name demo,demo,kermit)\n' | ./wermit -H -Y)" == 'name kermit' ]]
}

package() {
  cd "ckermit-${pkgver}"
  install -Dm755 wermit "${pkgdir}/usr/bin/kermit"
  ln -s kermit "${pkgdir}/usr/bin/kermit-sshsub"
  install -Dm644 ckuker.nr "${pkgdir}/usr/share/man/man1/kermit.1"
  install -Dm644 COPYING.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
