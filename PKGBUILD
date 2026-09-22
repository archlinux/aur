# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
_pkgname=alise
pkgname=${_pkgname}-git
pkgver=0.1.0.r0.gb2e0f6d
pkgrel=1
pkgdesc="Declarative Arch Linux installer in Guile Scheme"
arch=(any)
url="https://${_pkgorg}/${_pkgname}/"
license=(GPL-3.0-or-later)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
provides=(alise)
conflicts=(alise)
depends=(
  guile
  guile-ssh
)
makedepends=(
  git
  make
)

pkgver() {
  cd "$_pkgname" || return
  (
    set -o pipefail
    git describe --tags --long 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' |
      tr -d '\n' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname" || return
  make DESTDIR="$pkgdir" install
}
