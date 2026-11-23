# Maintainer: Kirill I <elephanttalk+aur@protonmail.com>

pkgname=pakku-bin
pkgver=0.18
pkgrel=1
pkgdesc='Pacman wrapper and AUR helper with a pacman-like user interface'
arch=('x86_64')
url='https://github.com/zqqw/pakku'
license=('GPL-3.0-only')
depends=('pacman' 'libcurl.so' 'git')
provides=('pakku')
conflicts=('pakku')
backup=('etc/pakku.conf')
# The prebuilt binary is already stripped; never touch it.
options=('!strip' '!debug')
source=(
  "pakku-0.18-x86_64.tar.gz::https://github.com/zqqw/pakku/releases/download/v0.18/pakku-0.18-x86_64.tar.gz"
  "COPYING-${pkgver}::https://github.com/zqqw/pakku/raw/v0.18/COPYING"
)
sha256sums=('bff014012ce57f4d0f1a86c4a9c803a20f1555329c232d698613554d70fda658' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  cp -a --no-preserve=ownership "${srcdir}/pakku-${pkgver}-x86_64/." "${pkgdir}/"
  install -Dm644 "${srcdir}/COPYING-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

check() {
  local version
  version="$("${srcdir}/pakku-${pkgver}-x86_64/usr/bin/pakku" -V |
    awk '/Pakku v/ { sub(/.*Pakku v/, ""); print $1; exit }')"
  [[ "$version" == "${pkgver}" ]] || {
    echo "version mismatch: binary $version != pkgver ${pkgver}" >&2
    return 1
  }
}
