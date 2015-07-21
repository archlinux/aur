# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku
pkgver=0.3.21
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(i686 x86_64)
url="https://github.com/progrium/dokku"
license=(MIT)
depends=(
	'docker'
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
)
sha256sums=(
  'SKIP'
  'd59d82c65583b571b0f9645425a10f7fcb888aedd6aecd0e39d2a3fdb6c1fe8d'
  'a8be92d37d9e99e2f5d0b44aed2451dc590daa7e5366b5cb2ba3197fb0ae65b0'
  '610eb140386de622ea46e6144be9f6f0a130887f94005319a395aed081d95879'
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

  cd "$pkgname"
  PLUGINS_PATH="${pkgdir}/var/lib/dokku/plugins/"
  install -Dm755 dokku "${pkgdir}/usr/bin/dokku"
  mkdir -p ${PLUGINS_PATH}
  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do \
    rm -Rf ${PLUGINS_PATH}/$plugin && \
    cp -R plugins/$plugin ${PLUGINS_PATH} && \
    touch ${PLUGINS_PATH}/$plugin/.core; \
  done
}

