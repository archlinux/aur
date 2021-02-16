# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor:  mrxx <mrxx at cyberhome dot at>

pkgname=krathalans-endlessh-git
_pkgname=endlessh
pkgver=r103.6a75976
pkgrel=3
pkgdesc="A tarpit to lock up SSH clients. Krathalan's fork"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/skeeto/endlessh"
license=('Unlicense')

# Sources
source=("git+https://github.com/krathalan/${_pkgname}" 'endlessh.conf')
sha256sums=('SKIP' '800eb22c581d706fe26821e41102ce1b23836fa7b36beb89ba12bb38577a5ea8')

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

  install -d "${pkgdir}"/etc
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/lib/systemd/system

  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" make install

  install -Dm644 util/endlessh.service "${pkgdir}/usr/lib/systemd/system/endlessh.service"
  install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

