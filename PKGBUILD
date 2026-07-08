# Maintainer: nizne <nizne@outlook.com>
pkgname=pwdsafety
pkgver=0.4.2
pkgrel=1
pkgdesc='Command line tool that checks how much a password is safe'
arch=('x86_64' 'aarch64' 'i686') # I'm not sure if the 'arm' in the repository refers to 'armv7h.'
url='https://github.com/edoardottt/pwdsafety'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
provides=("pwdsafety")
conflicts=("pwdsafety-bin" "pwdsafety-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/edoardottt/pwdsafety/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6676f7ccc1ad32e8c68b889426b563d69080a69c1f9212b32d79fccc2e70b79f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  
  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -extldflags '${LDFLAGS}' -s -w" \
    -o "$pkgname" ./cmd/pwdsafety
}

package() {
  install -Dm755 "${srcdir}/$pkgname-$pkgver/pwdsafety" "${pkgdir}/usr/bin/pwdsafety"
  install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
