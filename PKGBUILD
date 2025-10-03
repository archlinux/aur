# Maintainer: asciimoth
pkgname=version-git
pkgver=0.1.0.0.g1abcef7.g1abcef7
pkgrel=1
pkgdesc="Multi-source semantic version management tool"
arch=('x86_64')
url="https://github.com/asciimoth/version"
license=('Apache-2.0' 'MIT')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/asciimoth/version.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/version" || return 1

  # get a human-friendly description (may contain hyphens)
  local desc short
  desc=$(git describe --tags --long --always 2>/dev/null || true)
  desc=${desc#v}            # drop leading 'v' if present
  desc=${desc//-/.}         # replace hyphens with dots

  short=$(git rev-parse --short HEAD)

  # ensure result contains only allowed characters (letters, digits, dot, underscore, plus, tilde)
  # remove any other char just in case
  desc=$(printf "%s" "$desc" | tr -cd 'A-Za-z0-9._+~')

  # fallback if empty
  if [[ -z "$desc" ]]; then
    desc=$(date -u +%Y%m%d)
  fi

  printf "%s.g%s" "$desc" "$short"
}

build() {
  cd "${srcdir}/version" || return 1
  export GOPROXY="https://proxy.golang.org,direct"
  go build -trimpath -ldflags "-s -w" -o version .
}

package() {
  cd "${srcdir}/version" || return 1

  install -Dm755 version "${pkgdir}/usr/bin/version"

  # install licenses upstream supplies
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # install man
  install -Dm644 man/version.1 "${pkgdir}/usr/share/man/man1/version.1"
}
