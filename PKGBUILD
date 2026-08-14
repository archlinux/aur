# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname=notesmd-cli-git
pkgver=0.3.6.r5.g9a72da5
pkgrel=1
pkgdesc="Interact with Obsidian in the terminal. Open, search, create, update and move notes!"
arch=(aarch64 x86_64)
url="https://github.com/Yakitrak/notesmd-cli"
license=(MIT)
depends=(glibc)
makedepends=(git go)
provides=(notesmd-cli)
conflicts=(notesmd-cli)
replaces=(obsidian-cli-git)
install="notesmd-cli.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "$pkgname"
  go mod download -modcacherw

  mkdir -p "build" "completions"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  cd "$pkgname"
  go build -o "build/notesmd-cli" .

  for _sh in bash fish zsh powershell; do
    ./"build/notesmd-cli" completion "${_sh}" > "completions/notesmd-cli.${_sh}"
  done
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -vDm755 "build/notesmd-cli" -t "${pkgdir}/usr/bin/"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "MIGRATION.md" "${pkgdir}/usr/share/doc/${pkgname}/MIGRATION.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "notesmd-cli.bash"       "${pkgdir}/usr/share/bash-completion/completions/notesmd-cli"
  install -vDm644 "notesmd-cli.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/notesmd-cli.fish"
  install -vDm644 "notesmd-cli.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_notesmd-cli"
  install -vDm644 "notesmd-cli.powershell" "${pkgdir}/usr/share/powershell/Completions/notesmd-cli.ps1"
}

