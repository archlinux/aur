# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=shell-utils-git
pkgver=r194.0d9663f # This gets auto-updated by the pkgver() function
pkgrel=1
pkgdesc="An attempt to be a shell-agnostic custom utilities tool."
arch=('x86_64')
url="https://github.com/vncsmyrnk/shell-utils"
license=('GPL-3.0')
depends=()
makedepends=('git' 'go')
provides=('util')
conflicts=('util')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}" || return
  CGO_ENABLED=0 go build \
    -ldflags="-s -w -X 'shellutils/internal.BaseDefaultScriptsPath=/usr/share/shell-utils/scripts'" \
    -trimpath \
    -o ./dist/util \
    ./cmd/runner/main.go
  CGO_ENABLED=0 go build \
    -ldflags="-s -w" \
    -trimpath \
    -o ./dist/config \
    ./cmd/config/main.go
  CGO_ENABLED=0 go build \
    -ldflags="-s -w -X 'shellutils/internal.BaseDefaultScriptsPath=/usr/share/shell-utils/scripts'" \
    -trimpath \
    -o ./dist/util-complete \
    ./cmd/completion/main.go
}

package() {
  cd "${pkgname%-git}" || return
  install -d -m755 "${pkgdir}/usr/share/shell-utils/scripts/"
  install -d -m755 "${pkgdir}/usr/share/man/man1"
  install -Dm755 ./dist/util "${pkgdir}/usr/bin/util"
  install -Dm755 ./dist/util-complete "${pkgdir}/usr/bin/util-complete"
  install -Dm755 ./dist/config "${pkgdir}/usr/share/shell-utils/scripts/"
  install -Dm644 ./completions/zsh/_util "${pkgdir}/usr/share/zsh/site-functions/_util"
  install -Dm644 ./completions/zsh/*.completions.zsh "${pkgdir}/usr/share/zsh/site-functions/"
  install -m644 ./man/* "${pkgdir}/usr/share/man/man1/"

  (cd ./extra && find . -type d) |
    sed 's/^\.\///' |
    xargs -I{} install -d -m0755 "${pkgdir}/usr/share/shell-utils/scripts/{}"
  (cd ./extra && find . -type f) |
    sed 's/^\.\///' |
    xargs -I{} install -Dm755 ./extra/{} "${pkgdir}/usr/share/shell-utils/scripts/{}"
}
