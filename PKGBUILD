# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=repman-git
_pkgname=repman
pkgver=0.7.14
pkgrel=1
pkgdesc="Manage (remote) custom repositories for Arch Linux packages"
arch=(
  aarch64
  x86_64
)
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
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
  clang 
  git
  make
  asciidoctor
)
options=(
  !debug
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

build() {
  cd "$_pkgname" || return
  make
}

package() {
  cd "$_pkgname" || return
  make DESTDIR="$pkgdir" install
}
