# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=castblock-git
_pkgname=castblock
_branch=main
pkgver=101.9f9b57c
pkgrel=1
pkgdesc="CastBlock skips integrated youtube sponsors on all chromecasts on the network."
arch=('any')
url="https://github.com/erdnaxeli/castblock"
license=('MIT')
depends=('go-chromecast-git')
makedepends=('git' 'crystal' 'shards')
provides=('castblock')
conflicts=('castblock')
source=("$_pkgname::git+${url}.git#branch=$_branch" "update-ameba.patch")
sha512sums=('SKIP'
            '160156a0b2cbb3a5804baf46f4f181714bbaf407408b3acc8905883119b8469fa506f8c96f62701a43dd532ff5cea0af31a2d5449cea8e5d3dda01a10eb1bd7a')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count "$_branch").$(git rev-parse --short "$_branch")
}

prepare() {
  patch -Nd "$srcdir/$_pkgname" < update-ameba.patch
}

build() {
  cd "$srcdir/$_pkgname"
  shards build --release
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 ./bin/castblock "${pkgdir}/usr/bin/castblock"
  install -Dm644 contrib/castblock.service "$pkgdir"/usr/lib/systemd/system/castblock.service
}
