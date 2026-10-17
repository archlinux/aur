# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=ps5-payload-sdk
_repo=ps5-payload-dev/sdk
pkgname=$_pkgname-bin
pkgver=0.44
pkgrel=1
pkgdesc="An SDK for PS5 payloads that uses dynamic linking"
arch=("any")
url="https://github.com/$_repo"
license=("GPL-3.0-or-later")
makedepends=(curl jq sed)
depends=(
    bash
    clang
    lld
    wget
)
provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname-$pkgver-$pkgrel.zip::$url/releases/download/v$pkgver/ps5-payload-sdk.zip"
)
sha256sums=(
    4d06eab777bb135705b5a6816688c9132efb246093fe606ac488ab6cf65ca5b0
)

pkgver() {
  curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
    jq -r .tag_name | # Get tag name
    sed s/^v// # Remove prefix
}

package() {
    appRoot=/opt/$_pkgname
    profileRoot=$pkgdir/etc/profile.d
    profileScript=$profileRoot/$_pkgname.sh
    install -dm755 "$pkgdir/$(dirname $appRoot)"
    install -dm755 $profileRoot
    install -m644 /dev/null $profileScript
    cp -a $_pkgname "$pkgdir/$(dirname $appRoot)"

    cat <<EOF > $profileScript
        #!/bin/bash
        PS5_PAYLOAD_SDK=$appRoot
EOF
}
