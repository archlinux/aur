# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# shellcheck disable=SC2034,SC2154,SC2164

pkgbase=apparmor.d
pkgname=(apparmor.d apparmor.d.enforced)
pkgver=0.4908.0
pkgrel=2
pkgdesc="Full set of apparmor profiles"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/roddhjav/apparmor.d"
license=('GPL-2.0-only')
depends=('apparmor>=4.1.3' 'apparmor<5.0.0')
makedepends=('go' 'git' 'just')
source=("https://github.com/roddhjav/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz.asc")
sha512sums=('7889defd5802073292e6329fb060848d7bc8c948285083af68de2b35e760279d18d7750dd743f0c257e59153ce59ff20abefe90441e7d39267eb31aa912cedec'
            'SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=dev"
  export DISTRIBUTION=arch
  local -A modes=(
    # Mapping of modes to just build target
    [default]=complain
    [enforced]=enforce
  )
  for mode in "${!modes[@]}"; do
    just build=".build/$mode" "${modes[$mode]}"
  done
}

_conflicts() {
  local mode="$1"
  local pattern=".$mode"
  if [[ "$mode" == "default" ]]; then
    pattern=""
  else
    echo "$pkgbase"
  fi
  for pkg in "${pkgname[@]}"; do
    if [[ "$pkg" == "${pkgbase}${pattern}" ]]; then
      continue
    fi
    echo "$pkg"
  done
}

_install() {
  local mode="${1:?}"
  cd "$srcdir/$pkgbase-$pkgver"
  just build=".build/$mode" destdir="$pkgdir" install
}

package_apparmor.d() {
  mode=default
  pkgdesc="$pkgdesc (complain mode)"
  mapfile -t conflicts < <(_conflicts $mode)
  _install $mode
}

package_apparmor.d.enforced() {
  mode=enforced
  pkgdesc="$pkgdesc (enforced mode)"
  mapfile -t conflicts < <(_conflicts $mode)
  _install $mode
}
