# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor:  mrxx <mrxx at cyberhome dot at>

pkgname=krathalans-endlessh-git
_pkgname=endlessh
pkgver=r116.6ce0218
pkgrel=1
pkgdesc="A tarpit to lock up SSH clients. Krathalan's fork"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/krathalan/endlessh"
license=('Unlicense')

# Sources
source=("git+${url}" 'endlessh.conf' '99-endlessh.hook')
sha256sums=('SKIP' '40a72599472e8142ea65397ac3e0e282567e7b038bb1b7132f73c62e792343b9' 'b4519b5ba8d91b8ba670a31f0c6d9a423078b38fb5f4596c39a308e28924e712')

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

