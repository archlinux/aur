# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=whatfiles-git
pkgver=r2.f3a4c0d
pkgrel=1
arch=('x86_64')
pkgdesc='Log what files are accessed by any Linux process'
url='https://github.com/spieglt/whatfiles'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
_patchfile='8069df82512455e7a1d2c7d48c55f1e6ed0220c8.patch'
source=(
  "$pkgname::git+https://github.com/spieglt/whatfiles.git#branch=master"
  "https://github.com/zapp42/whatfiles/commit/$_patchfile"
)
sha256sums=('SKIP' '4ea491ae9136072cb5e4a6389d2e710040654128713dd8dbcb709db8602e4e92')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  git apply "../$_patchfile"
  make
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "bin/whatfiles" "${pkgdir}/usr/bin/"
}
