# Maintainer: Greboid <greboid@github>
pkgname=tithon
pkgver=0.0.40
pkgrel=1
pkgdesc="Modern IRC client"
arch=('x86_64')
url="https://github.com/greboid/tithon"
license=('MIT')
depends=('electron' 'glibc')
makedepends=('go' 'npm' 'git' 'gendesk')
options=('!debug')
source=(
        "git+https://github.com/greboid/tithon.git#tag=v${pkgver}"
        "launcher.sh"
       )
sha256sums=('8d3a072a07850e2a8a41989832c6fb2db6b3b53eed1aaef6b9b4bf57a98c8fd0'
            '96f891aa77f7374c9d40689add1ec8f5402915a08a70d820725d026fa8ec0f29')

prepare() {
  cd "${srcdir}/${pkgname}"
  
  gendesk -q -f \
          --pkgname=$pkgname \
          --pkgdesc="$pkgdesc" \
          --exec="$pkgname" \
          --terminal=false \
          --icon="/usr/lib/tithon/icon.png" \
          --categories="Network;Chat;IRCClient;"
}

build() {
  cd "${srcdir}/${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  (cd backend && go build -o backend .)
  (cd frontend && npm install --omit=dev)
}

check() {
  cd "${srcdir}/${pkgname}/backend"
  go test ./...
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/backend/backend" "${pkgdir}/usr/lib/tithon/backend"
  
  install -Dm644 "${srcdir}/${pkgname}/frontend/main.js" "${pkgdir}/usr/lib/tithon/main.js"
  install -Dm644 "${srcdir}/${pkgname}/frontend/icon.png" "${pkgdir}/usr/lib/tithon/icon.png"
  install -Dm644 "${srcdir}/${pkgname}/frontend/package.json" "${pkgdir}/usr/lib/tithon/package.json"
  
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -Dm644 "${srcdir}/${pkgname}/$pkgname.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/${pkgname}"
}
