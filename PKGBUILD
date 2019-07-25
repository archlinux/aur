# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.3
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('any')
url="https://gitlab.com/T4cC0re/gitlab-cli"
license=('GPLv3')
makedepends=('go>=1.12')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/master/gitlab-cli-v${pkgver}.tar.gz")
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
  go build -gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow -ldflags=-extldflags=-static -ldflags='-w -s' -ldflags="-X main.version=v${pkgver}-aur" -o $pkgname .
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
}
sha512sums=(2887eb6dff5c4356c78d0093d2b51f6fb2136184d6caf1c91e0d9914aeb4e7234f78e529f520de9ad99907a3f37832ccecf68c3bcc37103891d90087a3435170)
