# Maintainer: nucularjohn <nucularjohn@gmail.com>
pkgname=open-stage-control-node-git
pkgver=0.39.6.r2.g40f89293
pkgrel=1
pkgdesc="A libre desktop OSC bi-directional control surface application"
arch=('any')
url="http://osc.ammd.net/"
license=('GPL3')
depends=('npm')
makedepends=('git')
optdepends=('python-pyrtmidi: send and receive midi messages')
provides=("${pkgname%-node-git}")
conflicts=("${pkgname%-node-git}")
source=('git+https://github.com/jean-emmanuel/open-stage-control')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-node-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${pkgname%-node-git}"
	cat > "$pkgname" << EOF
#!/bin/bash
node /usr/share/$pkgname/index.js "\$@"
EOF
}

build() {
  cd "$srcdir/${pkgname%-node-git}"
  npm install
  npm run build
}

package() {
  cd "$srcdir/${pkgname%-node-git}"

  npm run package-node

  install -d "${pkgdir}/usr/share/"
  rsync -a dist/${pkgname%-git}/ "${pkgdir}/usr/share/$pkgname"

  install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname%-git}"

}
