## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.43.1
pkgrel=2
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/cli'
license=('LGPL-2.1-only')
makedepends=('go')
depends=('glibc' 'bash')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f7f577c90e9b6e502ab05891f83f657038beded57bd6d09ab4421f87bc2542dd')

prepare() {
  mv "cli-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  export GO111MODULE="auto"
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-X 'main.version=${pkgver}'" -o spicetify
}

check() {
  cd "${pkgname}-${pkgver}"
  test "v$(./spicetify -v)" = "v${pkgver}" || exit 1
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # install everything to /opt
  install -Dm755 ./spicetify "${pkgdir}/opt/${pkgname}/spicetify"
  cp -r ./CustomApps "${pkgdir}/opt/${pkgname}/CustomApps"
  cp -r ./Extensions "${pkgdir}/opt/${pkgname}/Extensions"
  cp -r ./jsHelper "${pkgdir}/opt/${pkgname}/jsHelper"
  cp -r ./Themes "${pkgdir}/opt/${pkgname}/Themes"

  install -Dm755 ./css-map.json "${pkgdir}/opt/${pkgname}/css-map.json"
  install -Dm755 ./globals.d.ts "${pkgdir}/opt/${pkgname}/globals.d.ts"

  # Make shortcut
  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/sh
exec /opt/${pkgname}/spicetify \"\$@\"" > "${pkgdir}/usr/bin/spicetify"
  chmod 755 "${pkgdir}/usr/bin/spicetify"

  # Clean up deps
  go clean -modcache
}
