# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=terraform-provider-lxd
pkgver=1.6.0
pkgrel=1
pkgdesc="Terraform provider to provision infrastructure with LXD"
arch=('x86_64')
url="https://github.com/terraform-lxd/terraform-provider-lxd"
license=('MPL2')
depends=('terraform')
makedepends=('go' 'git')
optdepends=('lxd: for a local instance of LXD')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('61c61b8220cd9ddf2f08e02e53a77f767d0d016b8c93ffc9c816bd5b50b970fe9f3f280767abae32a633e1d763739f26cd1372e6d0a8aec61b8e4fff2331c87e')
b2sums=('9b7aa822fa1271792084c2b787eac5e520457f9c6bcc5cb4ac127f696deeea5b187796c33c38905f99fcf854e7344bebd6991469e56bfc3042cd501e59ada1e4')

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
