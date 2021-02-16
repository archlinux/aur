# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor:  mrxx <mrxx at cyberhome dot at>

pkgname=krathalans-endlessh-git
_pkgname=endlessh
pkgver=r110.2b20b01
pkgrel=2
pkgdesc="A tarpit to lock up SSH clients. Krathalan's fork"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/krathalan/endlessh"
license=('Unlicense')

# Sources
source=("git+${url}" 'endlessh.conf' '99-endlessh.hook')
sha256sums=('SKIP' '800eb22c581d706fe26821e41102ce1b23836fa7b36beb89ba12bb38577a5ea8' '210b60c91bdabe89cb0111e8597eb61fe28542aa2abedb95ff3b175050adb20d')

# Package relations
depends=()
makedepends=('git')
conflicts=('endlessh' 'endlessh-git')

# Do not overwrite this! Users can change it
backup=('etc/endlessh.conf')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  install -Dm644 endlessh.conf "${pkgdir}/etc/endlessh.conf"
  install -Dm644 99-endlessh.hook "${pkgdir}/usr/share/libalpm/hooks/99-endlessh.hook"

  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/man/man1"
  DESTDIR="${pkgdir}/usr" make install

  install -Dm644 util/endlessh.service "${pkgdir}/usr/lib/systemd/system/endlessh.service"
  install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

