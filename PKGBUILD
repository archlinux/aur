# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=cryptsetup-vault
pkgver=1.0.3
pkgrel=1
pkgdesc="A cli tool and initcpio hook to unlock a cryptdevice via HashiCorp Vault unattended"
arch=('any')
url="https://gitlab.com/T4cC0re/cryptsetup-vault"
license=('Apache-2.0')
makedepends=('go>=1.11.1')
depends=('cryptsetup' 'mkinitcpio-netconf' 'ca-certificates-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/master/cryptsetup-vault-v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")

build(){
  export CGO_ENABLED=0
  echo "Extracting sources..."
  tar -xvf ${pkgname}-${pkgver}.tar.gz --strip 1 >/dev/null
  echo "Downloading go modules..."
  go mod download
  echo "Verifying go modules..."
  go mod verify
  echo "Compiling..."
  go build -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow -ldflags=-extldflags=-static -ldflags='-w -s' -o $pkgname .
  if hash upx &>/dev/null ; then
    echo "UPX found. Making extra small..."
    upx --lzma --best --all-filters --exact $pkgname
  else
    echo "Pro tip: Install the package 'upx' to compress $pkgname and save space"
  fi
}

package() {
  install -Dm755 $pkgname                              "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md"                           "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm644 "initcpio/hooks/cryptsetupvault"      "$pkgdir/usr/lib/initcpio/hooks/cryptsetupvault"
  install -Dm644 "initcpio/install/cryptsetupvault"    "$pkgdir/usr/lib/initcpio/install/cryptsetupvault"
}
sha512sums=(0674534e18b6116210f19257a47af7de5c8a5f650880403771bfce56bdb0a7157e450b98aaff7ac4eca9ae040339971966eae4f123bf1d6fb8ec9cf1174e9dc7)
