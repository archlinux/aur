# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=dendrite-git
_gitname=dendrite
pkgver=helm.dendrite.0.11.2.r5.g6b1c9eafa
pkgrel=1
pkgdesc="A second-generation Matrix homeserver written in Go"
arch=('x86_64')
url='https://github.com/matrix-org/dendrite'
license=('Apache')
makedepends=('git' 'go')
provides=('dendrite')
conflicts=('dendrite')
source=("git+https://github.com/matrix-org/${_gitname}.git"
        "dendrite.sysusers"
        "tmpfiles-dendrite.conf"
        "dendrite.service")
sha256sums=('SKIP'
            'aba328d7a7244e82f866f9d0ead0a53e79e1590b9c449ad6d18ff2659cb5e035'
            '7d3b8e046581c70857d452eb6569ea239989c7a47f818c184773b52df8a712dc'
            '562a89c61d4f54a2558024f755497a3a59b1c85e236924131fdf58724ed25f3f')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/dendrite
  go build ./cmd/generate-config
  go build ./cmd/generate-keys
  go build ./cmd/create-account
}

check() {
  cd ${_gitname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go test ./cmd/dendrite
}

package() {
  cd ${_gitname}
  install -Dm755 ./dendrite                           "${pkgdir}/usr/bin/${_gitname}"
  install -Dm755 ./generate-config                    "${pkgdir}/usr/bin/${_gitname}-generate-config"
  install -Dm755 ./generate-keys                      "${pkgdir}/usr/bin/${_gitname}-generate-keys"
  install -Dm755 ./create-account                      "${pkgdir}/usr/bin/${_gitname}-create-account"
  install -Dm644 ./dendrite-sample.yaml               "${pkgdir}/etc/dendrite/config-sample.yaml"
  install -Dm644 "${srcdir}/dendrite.service"         "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"
  install -Dm644 "${srcdir}/${_gitname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
  install -Dm644 "${srcdir}/tmpfiles-${_gitname}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_gitname}.conf"
}
