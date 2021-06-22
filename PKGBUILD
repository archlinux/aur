# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=terraform-provider-lxd
pkgver=1.5.0
pkgrel=2
pkgdesc="Terraform provider to provision infrastructure with LXD"
arch=('x86_64')
url="https://github.com/terraform-lxd/terraform-provider-lxd"
license=('MPL2')
depends=('terraform')
makedepends=('go' 'git')
optdepends=('lxd: for a local instance of LXD')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9912b42622584396f4d6435f97465a9ff5cda8904fc6477a5d45bb992606e92997eb766b7b0d53e6be8e25264fd14fdb65a8e695fdbb92cd613ce5bc3ab57734')

prepare() {
	cd "$pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod vendor
}

build() {
	cd "$pkgname-$pkgver"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.version=$pkgver \
    -X main.commit=$pkgver" \
    -o build .
}

check() {
	cd "$pkgname-$pkgver"
  go test -v ./lxd
}

package() {
	cd "$pkgname-$pkgver"

  # terraform unfortunately only accepts non-FHS compliant directories for plugins :(
  # https://www.hashicorp.com/blog/automatic-installation-of-third-party-providers-with-terraform-0-13
  # tl;dr $PLUGIN_DIRECTORY/$SOURCEHOSTNAME/$SOURCENAMESPACE/$NAME/$VERSION/$OS_$ARCH/
  install -vDm755 "build/$pkgname" \
    -t "$pkgdir/usr/share/terraform/plugins/registry.terraform.io/terraform-lxd/lxd/$pkgver/linux_amd64"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
}
