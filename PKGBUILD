# Maintainer: Sorah Fukumori <her@sorah.jp>
_gitname=unbound_exporter
pkgname=prometheus-unbound-exporter-git
pkgver=0.1.r20.gb7e842d
pkgrel=1
pkgdesc="A Prometheus exporter for Unbound"
arch=("x86_64" "aarch64")
url="https://github.com/kumina/unbound_exporter"
license=("Apache")
depends=()
makedepends=('go-pie' 'git')
provides=("prometheus-unbound-exporter")
conflicts=("prometheus-unbound-exporter")
source=(
  "git+https://github.com/kumina/unbound_exporter"
  "prometheus-unbound-exporter.service"
)

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//'
}

prepare(){
  mkdir -p gopath/src/github.com/kumina
  ln -rTsf $_gitname gopath/src/github.com/kumina/$_gitname
  export GOPATH="$srcdir"/gopath
  cd "gopath/src/github.com/kumina/$_gitname"
  go get -v .
}

build() {
  cd gopath/src/github.com/kumina/$_gitname
  go build -v \
      -gcflags "all=-trimpath=$GOPATH" \
      -asmflags "all=-trimpath=$GOPATH" \
      -ldflags "-extldflags $LDFLAGS" \
      -o prometheus-unbound-exporter .
}

package() {
  install -Dm0755 "${srcdir}/${_gitname}/prometheus-unbound-exporter" "${pkgdir}/usr/bin/prometheus-unbound-exporter"
  install -Dm0644 "${srcdir}/prometheus-unbound-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-unbound-exporter.service"
}
sha512sums=('SKIP'
            '3081b12ddd970e02f87aa1914f7fa92ae80fa8bda109afae7b419efed13b51dfb0e0b9afb3110599e00f9f709bca97584d76931ac0479b52e24b63d3603a16de')
sha512sums=('SKIP'
            '91fa15bc38ab490b0327e1ff88d1a48611441105e9472f6739d4dacb458850cdf7e38d82f92b7ae897782e2c0e59c431f2933593c9dc61112a4945892676a4d7')
