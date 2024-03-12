# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Ersei <samb at disroot dot org>

_pkgname='woodpecker-agent'
pkgname=$_pkgname-sudo
pkgver=2.3.0
pkgrel=2
pkgdesc='A simple CI engine with great extensibility (agent), patched to use sudo to run local pipelines'
arch=('x86_64')
url='https://woodpecker-ci.org'
license=('Apache')
depends=('glibc' 'sudo')
optdepends=(
  'docker: Docker backend'
  'podman: Podman backend'
)
makedepends=('git' 'go')
options=('!lto')
_commit='ee56a6ad01726311bce9cf71ea37e7cc4bbdb35c'
replaces=($_pkgname)
conflicts=($_pkgname)
backup=('etc/woodpecker/agent.env')
source=(
  "woodpecker::git+https://github.com/woodpecker-ci/woodpecker#commit=$_commit"
  'agent-systemd.service'
  'agent-sysusers.conf'
  'agent-tmpfiles.conf'
  'agent.env'
  'sudo.patch'
  'sudoers'
)
b2sums=('SKIP'
        '6f5833c1d4db8f287f5a9877687fb0d8d66c91e80e9bbb0a78910f315e6dd4cba01131dfca20bcceaeb828833187ee6161b33272050967e3e1cea4cb2665cf57'
        '373a5889c899445c4b583a48e6d0ff67d4572e30e0dfd0842b389e9338712771ec053ee3771202fe2874ee8bbfb7cb5965a04cf10d4071100c4f7c89cf2a14f3'
        'b6479a7f3b3cf1ecaf0fc4e0653de10176af29b780ff716bf038077d70b0440e45a649ccd5ad9a12d5f52c9eecf9b5d8b5a01510a53eec7b664162c8bb9153ab'
        '9d64fa22d5fcfb8634926220aeb89b0fa914d8e04ee39fe14abf3f170292ab2dc875fe3fe14b054ca8173c167cec4d93518d15d5f08698bd70d86dec7728dee8'
        '1e586f4ef03c0928a9371c24c222b3dbe08cf11fd3ea912eff86103085faf04b5c19391d16bfb6d5ec67e5cb5556485825b3bee8124359bbaa89c6e6ea3357b8'
        '86cbff1c5554c4426b3de872696cae6eed093987ccec940283e340e6cc23d226d268b38f0843b19d2706167f13ac4e20d9340f47ce5dc8ad3cbdb80d501c4fc4')

pkgver() {
  cd woodpecker

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd woodpecker

  patch -p1 < ../sudo.patch

  # create directory for build output
  mkdir -p build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd woodpecker

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  # build agent
  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}'" \
    -o build \
    ./cmd/agent

    go clean -modcache
}

package() {
  # systemd integration
  install -vDm644 agent-systemd.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -vDm644 agent-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 agent-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -vDm644 agent.env -t "$pkgdir/etc/woodpecker"
  install -vDm644 sudoers "$pkgdir/etc/sudoers.d/99_woodpecker"

  cd woodpecker

  # binary
  install -vDm755 build/agent "$pkgdir/usr/bin/$_pkgname"
}
