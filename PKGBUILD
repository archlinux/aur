# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

_gitname=dynomite
pkgname=${_gitname}-git
pkgver=0.6.21.rc2.r0.g5398600
pkgrel=1
pkgdesc="Dynomite is a thin, distributed dynamo layer for different storage engines and protocols"
arch=('i686' 'x86_64')
url="https://github.com/Netflix/dynomite"
license=('Apache-2.0')
conflicts=('dynomite')
provides=('dynomite')
source=(
  "git+https://github.com/Netflix/dynomite.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_gitname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//' ||
    printf "%s.r%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  autoreconf -fvi
  ./configure --prefix=/usr \
    --sbindir='${exec_prefix}/bin' \
    --sysconfdir=/etc/dynomite \
    --datarootdir='${exec_prefix}/share' \
    --enable-packaging
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  HOME="${srcdir}/testhome" make -k check
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
