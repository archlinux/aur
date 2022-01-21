# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=terraform-provider-lxd
pkgver=1.7.0
pkgrel=1
pkgdesc="Terraform provider to provision infrastructure with LXD"
arch=('x86_64')
url="https://github.com/terraform-lxd/terraform-provider-lxd"
license=('MPL2')
depends=('terraform')
makedepends=('go' 'git')
optdepends=('lxd: for a local instance of LXD')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d5491cda4a0b2e7acc7fd94939517952916b6e65156d3a22e5c104fc31004556147b6d7bba3b2d67b3977dfd0a438c34ced85e476a9bc84794aa70f34a99fd91')
b2sums=('da45e7e07edb2fa31e917cedf9aa18299b501c12bea5160328256e22bc89fd6e3dc35bd603f54a935140bc7afece412ec8f6b2c6d1cf4b3ad1d3cded70dd121c')

prepare() {
	cd "$pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
	cd "$pkgname-$pkgver"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
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
