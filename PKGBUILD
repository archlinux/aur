# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
# shellcheck disable=SC2034,SC2154,SC2164
pkgname=galene-git
pkgver=1.0.r36.g4cf2c9e
pkgrel=1
pkgdesc="A videoconferencing server"
arch=('x86_64' 'i686')
url='https://galene.org'
groups=()
license=('MIT')
depends=('go')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install='galene.install'
source=('galene::git+https://github.com/jech/galene.git'
        'galene.service'
        'galene.sysusers'
        'galene.tmpfiles')
sha256sums=('SKIP'
            'b4027e852f6e3a19a1a8dcf6a28f86c5a93fdd00bd3641b3421b18af23b25cb0'
            'a1b933ff4034cce2da2607e81df547acd7efa6f4236c18fec144047f50361f84'
            '85680da8ab202280b92b6dd32e920906570fb8070db06b2ef0275462d0f5a16d')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^galene-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p _build
}

build() {
  cd "${pkgname%-git}"
  export CGO_ENABLED=0
  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-s -w" \
     -o _build \
     ./...
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  cd "$srcdir"
  install -Dm644 galene.service "$pkgdir/usr/lib/systemd/system/galene.service"
  install -Dm644 galene.sysusers "$pkgdir/usr/lib/sysusers.d/galene.conf"
  install -Dm644 galene.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/galene.conf"

  cd "${pkgname%-git}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "_build/galene" "${pkgdir}/usr/bin"
  install -m755 "_build/galenectl" "${pkgdir}/usr/bin"

  install -dm755 "$pkgdir/usr/share/galene"
  cp -r static "$pkgdir/usr/share/galene"

  local doc="$pkgdir/usr/share/doc/galene"
  install -dm755 "$doc"
  for file in *.md; do
    install -Dm644 "$file" "$doc/$file"
  done

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
}
