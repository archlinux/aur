# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com> 

pkgname=v2ray-plugin-git
_pkgname=v2ray-plugin
pkgver=v1.0.r3.g4f8b2c5
pkgrel=1
pkgdesc='Yet another SIP003 plugin for shadowsocks, based on v2ray (git version)'
arch=('x86_64')
url='https://github.com/shadowsocks/v2ray-plugin'
license=('MIT')
#depends=('' '')
makedepends=('go' 'git')
conflicts=('v2ray-plugin')
source=("$pkgname::git+https://github.com/shadowsocks/${_pkgname}.git"
        "https://raw.githubusercontent.com/shadowsocks/v2ray-plugin/master/LICENSE")
sha256sums=('SKIP'
            'd903af2e15f43ddc5782ec20a0f1bdd090974ebea01ab02e0b015b76283ea666')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  cd $srcdir/$pkgname
  go get -u -v github.com/shadowsocks/v2ray-plugin
  go build -v \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$_pkgname
  install -vDm644 LICENSE -t ${pkgdir}/usr/share/licenses/$_pkgname
  echo "README FILE: https://github.com/shadowsocks/v2ray-plugin/blob/master/README.md"
}
