## Maintainer: khanhas <xuankhanh963@gmail.com>, itsmeow <itsmeow@itsmeow.dev>
pkgname=spicetify-cli
pkgver=2.42.5
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client'
arch=('x86_64' 'i686')
url='https://github.com/spicetify/cli'
license=('LGPL-2.1-only')
makedepends=('go')
depends=('glibc' 'bash')
optdepends=('xdg-utils: Allows for opening directories in default file manager')
source=("cli-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d04d1f465da7a2972f6bf5a9ba99b4a4efcb8c57068b862b2f63d4eaa032f64c')


build() {
  cd "cli-${pkgver}"
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
  cd "cli-${pkgver}"
  test "v$(./spicetify -v)" = "v${pkgver}" || exit 1
}

package() {
  cd "cli-${pkgver}"
  
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
