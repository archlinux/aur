# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.3.21
pkgrel=3
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(i686 x86_64)
url="https://github.com/progrium/dokku"
license=(MIT)
depends=(
	'docker'
	'nginx'
)
makedepends=(
	'go'
)

#https://raw.githubusercontent.com/progrium/pluginhook/master/pluginhook.go
#https://raw.githubusercontent.com/progrium/sshcommand/master/sshcommand
source=(
  "git+https://github.com/progrium/dokku.git#tag=v0.3.21"
  "${pkgname}.install"
  "pluginhook.go"
  "sshcommand"
  "dokku-redeploy.service"
  "nginx-dokku.conf"
)
sha256sums=(
  'SKIP'
  '83cef09105aa419713dd32741810c95f0922d6cd5c97b7b1d36ba349c521b635'
  'a8be92d37d9e99e2f5d0b44aed2451dc590daa7e5366b5cb2ba3197fb0ae65b0'
  '610eb140386de622ea46e6144be9f6f0a130887f94005319a395aed081d95879'
  '1d0557dd1f8cb0b0f39ac011c69fc6224e287f34cc7974f3420b608829d36ff1'
  'a5c81c91f3858d2325bd60a1b63efa5b71cc42c98746bcf1dd47668ccb5eeead'
)
install=${pkgname}.install

build() {
  cd "${srcdir}/"
  export GOPATH="${srcdir}/"
  go get "golang.org/x/crypto/ssh/terminal"
  GOOS=linux go build -o pluginhook.linux
}

package() {
  cd "${srcdir}/"

  install -Dm755 sshcommand "${pkgdir}"/usr/bin/sshcommand
  install -Dm755 pluginhook.linux "${pkgdir}"/usr/bin/pluginhook
  install -Dm644 dokku-redeploy.service "$pkgdir"/usr/lib/systemd/system/dokku-redeploy.service
  install -Dm644 dokku-redeploy.service "$pkgdir"/usr/lib/systemd/system/dokku-redeploy.service
  install -Dm644 nginx-dokku.conf "$pkgdir"/etc/nginx/conf.d/dokku.conf

  sed -i 's#\$DOKKU_ROOT#/var/dokku#' "$pkgdir"/etc/nginx/conf.d/dokku.conf

  cd "$pkgname"
  PLUGINS_PATH="${pkgdir}/var/lib/dokku/plugins/"
  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"
  mkdir -p ${PLUGINS_PATH}
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do \
    rm -Rf ${PLUGINS_PATH}/$plugin && \
    cp -R plugins/$plugin ${PLUGINS_PATH} && \
    touch ${PLUGINS_PATH}/$plugin/.core; \
    rm -f ${PLUGINS_PATH}/$plugin/install
  done
}

