# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor:  mrxx <mrxx at cyberhome dot at>

pkgname=krathalans-endlessh-git
_pkgname=endlessh
pkgver=r103.6a75976
pkgrel=2
pkgdesc="A tarpit to lock up SSH clients. Krathalan's fork"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/skeeto/endlessh"
license=('Unlicense')

# Sources
source=("git+https://github.com/krathalan/${_pkgname}" 'endlessh.conf')
sha256sums=('SKIP' 'a76cbe4b356994243632e487bd5241ecf96e0e0aa3ba1fc6968dae1958f3308b')

# Package relations
depends=()
makedepends=('git')
conflicts=('endlessh' 'endlessh-git')

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

  install -d "${pkgdir}"/etc
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/lib/systemd/system

  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" make install

  install -Dm644 util/endlessh.service "${pkgdir}/usr/lib/systemd/system/endlessh.service"
  install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

