# Maintainer: Ludovic Bellier <aur at zyrianes.net>

_gitname=check-soa
pkgname="${_gitname}-git"
_gitauthor=bortzmeyer # Stéphane Bortzmeyer
pkgver=r74.ead071c
pkgrel=1
pkgdesc="A simple command-line DNS testing tool for having rapidly an idea of the health of a DNS."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://www.bortzmeyer.org/check-soa-go.html'
license=('custom')
conflicts=("${_gitname}" "${_gitname}-bin")
provides=("${_gitname}")
depends=('glibc')
makedepends=('git' 'go' 'godns')
source=("git+https://framagit.org/${_gitauthor}/${_gitname}/"
  "LICENSE")                    # license file extracted from the git README.md
sha256sums=('SKIP'
  'c13767fa780d56b981f4bc6eea82263bdc77bf974b5d356293e608ca6b37776b')

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # follow https://wiki.archlinux.org/title/Arch_package_guidelines/Security#Golang
  export GOFLAGS='-buildmode=pie'
  export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
  export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
  
  cd "${srcdir}/${_gitname}"
  go build -trimpath -ldflags "-X \"main.lVersion=check-soa: ${pkgver}\""
}

package() {
  install -Dm 755 "${srcdir}/${_gitname}"/check-soa "${pkgdir}"/usr/bin/check-soa
  install -Dm 644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 "${srcdir}/${_gitname}"/README.md "${pkgdir}"/usr/share/doc/${pkgname}/README
}
