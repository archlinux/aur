# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=cryptsetup-vault
pkgver=1.1.1
pkgrel=1
pkgdesc="A cli tool and initcpio hook to unlock a cryptdevice via HashiCorp Vault unattended"
arch=(x86_64)
url="https://gitlab.com/T4cC0re/cryptsetup-vault"
license=('Apache-2.0')
makedepends=('go>=1.11.1')
depends=('cryptsetup' 'mkinitcpio-netconf' 'ca-certificates-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/master/cryptsetup-vault-v${pkgver}.tar.gz")
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
sha512sums=('ad2a4912a94f91def40e400204624e47c6f8538169ecc26ef8262c587cf5c5867b9fdccadece27649ec2e92e80474d7ef5d24e557c5892ca4f69168f1be75e69')
