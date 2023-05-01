# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman-git
_pkgname=repman
pkgver=0.3.0
pkgrel=4
pkgdesc="Manage (remote) custom repositories"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
  binutils
  "pacman>=6.0.0"
)
depends_x86_64=(devtools)
depends_armv7h=(devtools-alarm)
depends_aarch64=(devtools-alarm)
optdepends=(
  "gnupg: in case packages and/or repository DB's should be signed"
  "rsync: support of SSH-accessible storage locations"
  "s3cmd: support of AWS S3"
)
makedepends=(
  bash
  cargo
  git
  make
  asciidoctor
)
provides=(repman)
conflicts=(repman)
backup=("etc/repman.conf")

pkgver() {
  cd "$srcdir/$_pkgname" || return
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname" || return
  make
}

package() {
  cd "$srcdir/$_pkgname" || return
  make DESTDIR="$pkgdir" install
}
