# Maintainer: k4lizen <k4lizen (awa) proton.me>

# Wiki:
# https://wiki.archlinux.org/title/AUR_submission_guidelines
# https://wiki.archlinux.org/title/VCS_package_guidelines
# Reference go -git aur package:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gdu-git

pkgname=dinit-edit-git
pkgver=v0.20.0.r46.g227df92
pkgrel=1
pkgdesc="List and edit dinit service files by name (no more scouring the folders)"
arch=(x86_64 aarch64)
url="https://github.com/davmac314/dinit"
license=(DO-WHAT-THE-FUCK-YOU-WANT-TO-PUBLIC-LICENSE)
depends=()
makedepends=(go git)
optdepends=()
provides=("dinit-edit=${pkgver}")
options=(!debug !strip)
source=("dinit::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dinit"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/dinit/contrib/dinit-edit"
  mkdir -p dist/
}

build() {
  cd "$srcdir/dinit/contrib/dinit-edit"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -o dist/dinit-edit \
    dinit-edit.go
}

package() {
  cd "$srcdir/dinit/contrib/dinit-edit"
  install -Dm755 dist/dinit-edit "${pkgdir}"/usr/bin/dinit-edit
  install -D -m644 COPYING   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
