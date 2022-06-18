# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=terraform-provider-lxd
pkgver=1.7.2
pkgrel=1
pkgdesc='Terraform provider to provision infrastructure with LXD'
arch=('x86_64')
url='https://github.com/terraform-lxd/terraform-provider-lxd'
license=('MPL2')
depends=('terraform')
makedepends=('git' 'go')
optdepends=('lxd: for a local instance of LXD')
options=('!lto')
_commit='aeb3f7fe6de28f260a3b84567c56b9916b0ef8ed'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
	cd "$pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
	cd "$pkgname"

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
	cd "$pkgname"
  go test -v ./lxd
}

package() {
	cd "$pkgname"

  # terraform unfortunately only accepts non-FHS compliant directories for plugins :(
  # https://www.hashicorp.com/blog/automatic-installation-of-third-party-providers-with-terraform-0-13
  # tl;dr $PLUGIN_DIRECTORY/$SOURCEHOSTNAME/$SOURCENAMESPACE/$NAME/$VERSION/$OS_$ARCH/
  install -vDm755 "build/$pkgname" \
    -t "$pkgdir/usr/share/terraform/plugins/registry.terraform.io/terraform-lxd/lxd/$pkgver/linux_amd64"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
}
