# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('fail2rest')
conflicts=('fail2rest')
pkgver=r52.42cfa41
pkgname=fail2rest-git
pkgrel=2
pkgdesc="REST server for fail2ban"
arch=('any')
depends=('fail2ban')
makedepends=('go')
url="https://github.com/Sean-Der/fail2rest"
options=()
license=('MIT')
source=('fail2rest::git+https://github.com/Sean-Der/fail2rest')
sha512sums=('SKIP')

pkgver() {
  cd fail2rest
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"

  msg2 "Creating compilation structure..."
  mkdir -p gopath/src/github.com/Sean-Der
  rm -rf gopath/src/github.com/Sean-Der/fail2rest
  ln -rTsf fail2rest gopath/src/github.com/Sean-Der/fail2rest

  msg2 "Downloading dependencies..."
  cd gopath/src/github.com/Sean-Der/fail2rest
  GOPATH="${srcdir}/gopath" go get
}

build() {
  msg2 "Compiling..."
  cd gopath/src/github.com/Sean-Der/fail2rest
  GOPATH="${srcdir}/gopath" go build \
    -trimpath \
    -gcflags "-trimpath $srcdir" \
    -asmflags "-trimpath $srcdir" \
    -ldflags "-extldflags $LDFLAGS" \
    -o fail2rest
  
  msg2 "Customizing SystemD unit service..."
  cat "${srcdir}"/fail2rest/init-scripts/systemd |\
    sed 's/fail2rest\.json/fail2rest\/config.json/g' |\
    tee "${srcdir}"/fail2rest.service
}

package() {
  cd "${pkgdir}"
  mkdir -p "${pkgdir}"/usr/bin
  ln -s /usr/share/webapps/fail2rest/bin/fail2rest "${pkgdir}"/usr/bin/fail2rest

  install -Dm755  "${srcdir}"/gopath/bin/fail2rest "${pkgdir}"/usr/share/webapps/fail2rest/bin/fail2rest

  install -Dm644 "${srcdir}"/fail2rest.service "${pkgdir}"/usr/lib/systemd/system/fail2rest.service
  install -Dm644 "${srcdir}"/fail2rest/fail2rest.1 "${pkgdir}"/usr/share/man/man1/fail2rest.1
  install -Dm644 "${srcdir}"/fail2rest/config.json "${pkgdir}"/etc/fail2rest/config.json

}
