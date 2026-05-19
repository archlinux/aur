# Maintainer: Adam Bambuch <adam@bambuch.cz>
pkgname=modulejail-git
pkgver=r59.1.2.3.0.gdf4f186
pkgrel=1
pkgdesc="Shrink a Linux host's kernel-module attack surface via modprobe.d blacklist (git)"
arch=(any)
license=('GPL-3.0-only')
url="https://github.com/jnuyens/modulejail"
makedepends=('git' 'gzip')
depends=('coreutils' 'findutils' 'gawk')
optdepends=('curl: optional post-run update check'
            'wget: optional post-run update check'
            'util-linux: optional syslog logging of blocked module loads')
provides=('modulejail')
conflicts=('modulejail')
install="usage.install"
source=("git+https://github.com/jnuyens/modulejail.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --long --tags | sed 's/^v//;s/-/./g')"
}

package() {
  cd "${pkgname%-git}"

  install -Dm 0755 modulejail \
     "${pkgdir}/usr/bin/modulejail"

  # Manpage: substitute __VERSION__, then gzip
  local _version
  _version=$(awk -F"'" '/^VERSION=/ {print $2; exit}' modulejail)
  sed "s/__VERSION__/${_version}/g" man/modulejail.8.in > modulejail.8
  install -Dm 0644 modulejail.8 \
     "${pkgdir}/usr/share/man/man8/modulejail.8"
  gzip -9n "${pkgdir}/usr/share/man/man8/modulejail.8"

  install -Dm 0644 README.md \
     "${pkgdir}/usr/share/doc/modulejail/README.md"
  install -Dm 0644 LICENSE \
     "${pkgdir}/usr/share/doc/modulejail/LICENSE"
}
