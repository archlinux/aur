# Maintainer: Marcel Krause <feuerwinter@gmail.com>

pkgname=evebuddy-git
pkgver=0.77.0.r141.ge808d97
pkgrel=1
pkgdesc='Multi-platform companion app for EVE Online (development version)'
arch=('x86_64')
url='https://github.com/ErikKalkoken/evebuddy'
license=('MIT')
depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxxf86vm'
  'wayland'
  'xdg-utils'
)
makedepends=('git' 'go' 'pkgconf')
provides=("evebuddy=${pkgver}")
conflicts=('evebuddy')
options=('!debug')
source=('git+https://github.com/ErikKalkoken/evebuddy.git')
b2sums=('SKIP')

pkgver() {
  cd evebuddy
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd evebuddy
  export GOPATH="${srcdir}"
  export GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd evebuddy

  local app_version
  app_version=$(sed -n 's/^Version = "\([^"]*\)"/\1/p' FyneApp.toml)

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go run fyne.io/tools/cmd/fyne package \
    --os linux \
    --release \
    --tags migrated_fynedo \
    --app-version "${app_version}"
}

package() {
  cd evebuddy
  bsdtar -xf 'EVE Buddy.tar.xz' -C "${pkgdir}"

  # Fyne adds an application root and uses /usr/local. Arch packages use /usr.
  cp -a "${pkgdir}/evebuddy/usr/local/." "${pkgdir}/usr/"
  rm -rf "${pkgdir}/evebuddy"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
