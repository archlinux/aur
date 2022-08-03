# shellcheck disable=SC2034,SC2148,SC2154,SC2164
# Maintainer: Alessandro Cerruti
# Contributor: Alessandro Cerruti

_pkgbase=nvfand
pkgname=nvfand-git
pkgver=r44.9183dd6
pkgrel=1
pkgdesc='a daemon that sets the fan speed of your nvidia GPU(s) based on a custom curve.'
arch=('any')
url='https://gitlab.com/chrooti/nvfand'
license=('MIT')
depends=(jansson nvidia-utils)
makedepends=(git cuda ninja)
source=('nvfand::git+https://gitlab.com/chrooti/nvfand.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  ./gen_ninja_config.sh
  ninja
}

package() {
  cd "$srcdir/$_pkgbase"

  install -Dm755 out/bin/nvfand "$pkgdir"/usr/bin/nvfand
  install -Dm755 out/bin/nvsetspeed "$pkgdir"/usr/bin/nvsetspeed
  install -Dm644 nvfand.service "$pkgdir"/usr/lib/systemd/system/nvfand.service
}
