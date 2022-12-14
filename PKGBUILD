# Maintainer: Jef Roosens
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Ersei <samb at disroot dot org>
# Contributor: Anthony Wang <ta180m@pm.me>

# This PKGBUILD is very heavily taken from the official Woodpecker package and
# I take no credit for it. I've solely modified it to work with the master
# branch.

_pkgbase=woodpecker
pkgbase=woodpecker-git
pkgname=(
  'woodpecker-server-git'
  'woodpecker-agent-git'
  'woodpecker-cli-git'
)
pkgver=0.15.0.r406.ga3f4f3056
pkgrel=1
_pkgdesc='A simple CI engine with great extensibility'
pkgdesc="${_pkgdesc} (development version)"
arch=('x86_64')
url='https://woodpecker-ci.org'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'yarn')
options=('!lto')
source=(
  "${_pkgbase}::git+https://github.com/woodpecker-ci/woodpecker"
  'server-systemd.service'
  'server-sysusers.conf'
  'server-tmpfiles.conf'
  'server.env'
  'agent-systemd.service'
  'agent-sysusers.conf'
  'agent-tmpfiles.conf'
  'agent.env'
)
b2sums=('SKIP'
        '9435cd7af8128a91fc939206fedd767c719c94abd027150599d2079dbffd67f6886ef7ccb53449e09f8f3e86b0ad2bfa33b7002140c772421f5b6e936d008e6f'
        '92d4b131ac328661bc35f59904bc94bd59df8e61d16dcf13d279641fb825d75949b3da469800573e03bea407a2eb2c5b1536f6c5ae4d33db218a20fb42068f5b'
        'd28d74767a4e36a34632308449a902abcb62c3f06260bab966825d937e04862c531f2c25273186a0ca3503274560770142154f7829fc850e980455f7c902734a'
        'c2f6c3764b8dffaabc1e5583df3d5b8f9a3b731aa190b940ca57cb9f47d1d7aee94c7ffbeefc3097bd6036d465bdc8289f3d107eda1d6e96d42b45a9579e5b95'
        '6f5833c1d4db8f287f5a9877687fb0d8d66c91e80e9bbb0a78910f315e6dd4cba01131dfca20bcceaeb828833187ee6161b33272050967e3e1cea4cb2665cf57'
        '373a5889c899445c4b583a48e6d0ff67d4572e30e0dfd0842b389e9338712771ec053ee3771202fe2874ee8bbfb7cb5965a04cf10d4071100c4f7c89cf2a14f3'
        'b6479a7f3b3cf1ecaf0fc4e0653de10176af29b780ff716bf038077d70b0440e45a649ccd5ad9a12d5f52c9eecf9b5d8b5a01510a53eec7b664162c8bb9153ab'
        '9d64fa22d5fcfb8634926220aeb89b0fa914d8e04ee39fe14abf3f170292ab2dc875fe3fe14b054ca8173c167cec4d93518d15d5f08698bd70d86dec7728dee8')

pkgver() {
  git -C "${_pkgbase}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbase}"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "${_pkgbase}"

  # generate web interface to embed in woodpecker-server
  pushd web
  yarn install --frozen-lockfile
  yarn build
  popd

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # build server/agent/cli
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    ./cmd/...
}

package_woodpecker-server-git() {
  pkgdesc="${_pkgdesc} (server) (development version)"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  backup=('etc/woodpecker/server.env')

  # systemd integration
  install -vDm644 server-systemd.service "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
  install -vDm644 server-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -vDm644 server-tmpfiles.conf "${pkdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
  install -vDm644 server.env -t "${pkgdir}/etc/woodpecker"

  cd "${_pkgbase}"

  # binary
  install -vDm755 build/server "${pkgdir}/usr/bin/${pkgname%-git}"
}

package_woodpecker-agent-git() {
  pkgdesc="${_pkgdesc} (agent) (development version)"
  optdepends=(
    'docker: Docker backend'
    'podman: Podman backend'
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  backup=('etc/woodpecker/agent.env')

  # systemd integration
  install -vDm644 agent-systemd.service "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
  install -vDm644 agent-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -vDm644 agent-tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
  install -vDm644 agent.env -t "${pkgdir}/etc/woodpecker"

  cd "${_pkgbase}"

  # binary
  install -vDm755 build/agent "${pkgdir}/usr/bin/${pkgname%-git}"
}

package_woodpecker-cli-git() {
  pkgdesc="${_pkgdesc} (cli) (development version)"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${_pkgbase}"

  # binary
  install -vDm755 build/cli "${pkgdir}/usr/bin/${pkgname}"
}
