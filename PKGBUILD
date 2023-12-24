# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=repman-git
_pkgname=repman
pkgver=0.7.2
pkgrel=1
pkgdesc="Manage (remote) custom repositories for Arch Linux packages"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
provides=(repman)
conflicts=(repman)
backup=("etc/repman.conf")
depends=(
  binutils
  "pacman>=6.0.0"
)
depends_x86_64=(devtools)
depends_aarch64=(devtools-alarm)
optdepends=(
  "distcc: for distributed builds"
  "git: to manage packages from AUR"
  "gnupg: in case packages and/or repository DB's should be signed"
  "rsync: support of SSH-accessible remote storage locations"
  "openssh: support of SSH-accessible remote storage locations"
  "s3cmd: support of AWS S3"
  "google-cloud-cli: support of Google Cloud Platform"
)
makedepends=(
  bash
  cargo
  git
  make
  asciidoctor
)

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
