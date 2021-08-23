# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-git
_gitname=gdu
pkgver=v5.6.0.r2.gb6f6584
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
provides=(gdu)
conflicts=(gdu)
depends=('glibc')
makedepends=('go' 'pandoc')
arch=('x86_64')
url="https://github.com/dundee/gdu"
source=("$_gitname::git+https://github.com/Dundee/gdu")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_gitname"
  mkdir -p dist/
}

build() {
  cd "$_gitname"
  local _BUILDINFO="-X 'github.com/dundee/gdu/v5/build.Version=${pkgver}' \
                    -X 'github.com/dundee/gdu/v5/build.User=${PACKAGER}' \
                    -X 'github.com/dundee/gdu/v5/build.Time=$(date)'"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o dist/gdu \
    github.com/dundee/gdu/v5/cmd/gdu
  pandoc gdu.1.md -s -t man > dist/gdu.1
}

package() {
  cd "$_gitname"
  install -Dm755 dist/$_gitname "${pkgdir}"/usr/bin/gdu
  install -Dm644 dist/gdu.1     "${pkgdir}"/usr/share/man/man1/gdu.1
  install -D -m644 LICENSE.md   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

