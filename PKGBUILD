# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor:  mrxx <mrxx at cyberhome dot at>

pkgname=krathalans-endlessh-git
_pkgname=endlessh
pkgver=r121.f063a48
pkgrel=1
pkgdesc="A tarpit to lock up SSH clients. Krathalan's fork"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/krathalan/endlessh"
license=('Unlicense')

# Sources
source=("git+${url}" '99-endlessh.hook')
sha256sums=('SKIP' 'b4519b5ba8d91b8ba670a31f0c6d9a423078b38fb5f4596c39a308e28924e712')

# Package relations
depends=()
makedepends=('git' 'meson')
conflicts=('endlessh' 'endlessh-git')

# Do not overwrite this! Users can change it
backup=('etc/endlessh.conf')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${srcdir}/${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 99-endlessh.hook "${pkgdir}/usr/share/libalpm/hooks/99-endlessh.hook"

  cd "${srcdir}/${_pkgname}"
  install -Dm644 util/endlessh "${pkgdir}/etc/apparmor.d/endlessh"
  install -Dm644 util/smf/endlessh.conf "${pkgdir}/etc/endlessh.conf"
  install -Dm644 util/endlessh.service "${pkgdir}/usr/lib/systemd/system/endlessh.service"
  install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

