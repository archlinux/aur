# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Michael Taboada <michael@2mb.solutions>
                                                                                                                                                                
pkgname="barnard-git"
pkgver=r98.c16cc73
pkgrel=1
epoch=1
pkgdesc="A command line mumble client."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://git.2mb.codes/~cmb/barnard"
license=('GPL2')
depends=('openal' 'opus' 'opusfile')
makedepends=('git' 'go')
source=("barnard::git+https://git.2mb.codes/~cmb/barnard")
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
  go build -o build
}
                                                                                                                                                                
package() {
  cd "${pkgname%-git}"
  install -Dm755 build/barnard "$pkgdir"/usr/bin/barnard
  install -m755 "$srcdir/barnard/barnard-ui" "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/barnard/extras/barnard-sound.sh" "$pkgdir/usr/share/barnard/barnard-sound.sh"
  install -Dm644 "$srcdir/barnard/README.md" "$pkgdir/usr/share/doc/barnard"
}
                                                                                                                                                                
# vim:set ts=2 sw=2 et:
