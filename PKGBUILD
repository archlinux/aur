# Maintainer: Storm Dragon <storm_dragon@stormux.org>
# Maintainer: Michael Taboada <michael@2mb.solutions>
                                                                                                                                                                
pkgname="barnard-git"
pkgver=r297.c1722c2
pkgrel=1
epoch=2
pkgdesc="A command line mumble client."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://git.stormux.org/storm/barnard"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('openal' 'opus' 'opusfile' 'rnnoise')
optdepends=(
  'openssl: certificate management from barnard-ui'
  'magic-wormhole: send logs from barnard-ui'
  'sox: sound effects from barnard-sound.sh'
  'socat: Fenrir notifications from barnard-sound.sh'
  'speech-dispatcher: fallback speech notifications from barnard-sound.sh'
  'espeak-ng: alternate fallback speech notifications from barnard-sound.sh'
  'libnotify: desktop notifications from barnard-sound.sh'
)
makedepends=('git' 'go')
source=("barnard::git+https://git.stormux.org/storm/barnard")
install="${pkgname}.install"
sha512sums=('SKIP')

prepare(){
  cd "${pkgname%-git}"
  mkdir -p build/
}

pkgver() {
    cd "${srcdir}/barnard"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/ . ./cmd/barnard-ui
}
                                                                                                                                                                
package() {
  cd "${pkgname%-git}"
  install -Dm755 build/barnard "$pkgdir"/usr/bin/barnard
  install -Dm755 build/barnard-ui "$pkgdir"/usr/bin/barnard-ui
  install -Dm755 "$srcdir/barnard/extras/barnard-sound.sh" "$pkgdir/usr/share/barnard/barnard-sound.sh"
  install -Dm644 "$srcdir/barnard/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
                                                                                                                                                                
# vim:set ts=2 sw=2 et:
