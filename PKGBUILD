# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.5
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('any')
url="https://gitlab.com/T4cC0re/gitlab-cli"
license=('GPLv3')
makedepends=('go>=1.12' 'git')
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
sha512sums=(a0cf5ea1ccd610c2bb0cd702700dd521e90e4c1503e3b8d64c51cc7fe88ee72fe9f7f45aebbe6e0fb8e6bf3b8a37d8f9925cd642743b7859894aee321d7f71aa)
