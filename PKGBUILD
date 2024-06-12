# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=cryptsetup-vault
pkgver=1.1.1
pkgrel=3
pkgdesc="A cli tool and initcpio hook to unlock a cryptdevice via HashiCorp Vault unattended"
arch=(x86_64)
url="https://gitlab.com/T4cC0re/cryptsetup-vault"
license=('Apache-2.0')
makedepends=('go>=1.11.1')
depends=('cryptsetup' 'mkinitcpio-netconf' 'ca-certificates-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/cryptsetup-vault-v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")

build(){
  export CGO_ENABLED=0
  tar -xvf ${pkgname}-${pkgver}.tar.gz --strip 1 >/dev/null
  go build -trimpath -ldflags="-w -s -X main.version=v${pkgver} -extldflags=-Wl,-z,now,-z,relro" -buildmode=pie -o $pkgname .
}

package() {
  install -Dm755 $pkgname                              "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "initcpio/hooks/cryptsetupvault"      "$pkgdir/usr/lib/initcpio/hooks/cryptsetupvault"
  install -Dm644 "initcpio/install/cryptsetupvault"    "$pkgdir/usr/lib/initcpio/install/cryptsetupvault"
}
sha512sums=('c23432c7dcc8592e94f9571cd2cd1e5fb5273068b28dc1abc24a8a9f603b5b4c6868c7c25d542953bad966341357c196f3c90ec4bbc95268c2bcd2f0f5624c83')
