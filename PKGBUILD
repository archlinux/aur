# Maintainer: 王德宇 <kvtodev@outlook.com>
pkgname=youtrack-git
pkgver=0.8.2.r0.g0c54ef2
pkgrel=1
pkgdesc='A command-line interface for JetBrains YouTrack'
arch=('x86_64' 'aarch64')
url='https://github.com/JetBrains/youtrack-cli'
license=('Apache-2.0')
provides=('youtrack')
conflicts=('youtrack' 'youtrack-bin')
makedepends=('git' 'go')
options=('!lto')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    desc=${desc#v}
    desc=${desc/-/.r}
    desc=${desc//-/.}
    printf '%s\n' "${desc}"
  else
    printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${pkgname}"
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false \
    -ldflags "-s -w \
      -X github.com/JetBrains/youtrack-cli/internal.Version=${pkgver} \
      -X github.com/JetBrains/youtrack-cli/internal.Commit=$(git rev-parse --short HEAD) \
      -X github.com/JetBrains/youtrack-cli/internal.Date=$(git show -s --format=%cs HEAD)" \
    -o youtrack .
}

check() {
  cd "${pkgname}"
  CGO_ENABLED=0 go test ./api/ ./internal/... -count=1
  YOUTRACK_NO_UPDATE=1 ./youtrack --version | grep -Fq "youtrack ${pkgver}"
}

package() {
  cd "${pkgname}"
  install -Dm755 youtrack "${pkgdir}/usr/bin/youtrack"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
