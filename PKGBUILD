# Maintainer: Stas Alekseev <stas.alekseev@gmail.com>

pkgname=remco
pkgver=0.10.0
pkgrel=7
pkgdesc="remco is a lightweight configuration management tool"
arch=('x86_64' 'i686')
url="http://heavyhorst.github.io/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
backup=("etc/${pkgname}/config.toml")
source=("https://github.com/HeavyHorst/$pkgname/archive/v$pkgver.tar.gz"
        "config.toml"
        "$pkgname.service")
sha256sums=('86031786a2e274e4ea7c06b156fbd674cf89423e6558644eb943364e39240ba0'
            '4ff25d9bc79a8f363d0d66b3a820fcd389001b709a2f315288b05650fd6389e3'
            'fa44c40b7c9dad8138bf47be14939a5b6f2ef06d42fe363e139e30c05c3e9f8a')

build() {
  msg2 'Setting GOPATH'
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${srcdir}/gopath"
  export GOPATH="${srcdir}/gopath"

  msg2 'Getting go dep tool'
  go get github.com/golang/dep/cmd/dep

  mkdir -p "${GOPATH}/src/github.com/HeavyHorst"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/HeavyHorst/${pkgname}"
  cd "${GOPATH}/src/github.com/HeavyHorst/${pkgname}"

  msg2 'Fetching dependencies...'
  "$GOPATH/bin/dep" ensure

  msg2 'Compiling...'
  CGO_ENABLED=0 go build -o remco -a -tags netgo -ldflags "-w -X 'main.version=$pkgver'" "github.com/HeavyHorst/${pkgname}/cmd/remco"
}

package() {
  msg2 'Installing...'

  install -Dm644 ${srcdir}/config.toml "$pkgdir/etc/$pkgname/config.toml"
  install -dm755 "$pkgdir/etc/$pkgname/resource.d"
  install -Dm644 ${srcdir}/${pkgname}.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/var/run/$pkgname"
}

# vim:set ts=2 sw=2 et:
