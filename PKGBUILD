# Maintainer: Cyrrrt <cyrrrt@cyrrrt.me>
pkgname=git-auto-sync
pkgver=1.5
pkgrel=1
pkgdesc="Automatically sync git repositories"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/GitJournal/git-auto-sync"
license=('Apache-2.0')
depends=('git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GitJournal/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  
  export CGO_ENABLED=0
  export GOFLAGS="-mod=readonly -modcacherw -trimpath"
  
  go build -ldflags="-s -w" -o git-auto-sync .
  
  cd daemon
  go build -ldflags="-s -w" -o git-auto-sync-daemon .
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -Dm755 git-auto-sync -t "${pkgdir}/usr/bin/"
  install -Dm755 daemon/git-auto-sync-daemon -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
