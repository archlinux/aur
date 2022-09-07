# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgbase=regclient
pkgname=(
  regclient-regctl
  regclient-regsync
  regclient-regbot
)
pkgver=0.4.4
pkgrel=0
pkgdesc='Docker and OCI Registry tooling - regctl / regsync / regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
# how to build git tag from github
#source=("$pkgbase-$pkgver.tar.gz::https://github.com/regclient/regclient/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd47ec7f276a11d28767b606a52ad41ea6dcc8d05725cdab304aac8dd4d207db')
_bins=('regctl' 'regsync' 'regbot')

build() {
  local _commit
  _commit="$(bsdcat "$pkgbase-$pkgver.tar.gz" | git get-tar-commit-id)"
  mkdir -p build/ && cd build/
  # we want "clean" go binaries
  export CGO_ENABLED=0

  ( cd "../$pkgbase-$pkgver" && echo "{\"VCSRef\": \"${_commit}\", \"VCSTag\": \"${pkgver}\"}" >./embed/version.json )

  for i in "${_bins[@]}"; do
    (
      cd "../$pkgbase-$pkgver"
      cp ./embed/version.json "cmd/$i/embed/"
      go build -ldflags "-s -w -extldflags -static" -tags nolegacy -trimpath -o ../build ./cmd/$i
    )

    ./$i completion bash >$i.bash
    ./$i completion zsh >$i.zsh
  done
}

check() {
	cd "${pkgbase}-${pkgver}"
	# ignore relative path errors because credhelper_test.go in regclient tests requires it
	GODEBUG=execerrdot=0 go test -mod=readonly ./...
}

_pkgcommon() {
  _pkg="$1"
  cd build/
  install -Dm755 "$_pkg" -t   "$pkgdir/usr/bin"
  install -Dm644 "$_pkg.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkg"
  install -Dm644 "$_pkg.zsh"  "$pkgdir/usr/share/zsh/site-functions/_$_pkg"
}

package_regclient-regctl() {
  pkgdesc="Utility for accessing docker registries"
  _pkgcommon "regctl"
}

package_regclient-regsync() {
  pkgdesc="Utility for mirroring docker repositories"
  _pkgcommon "regsync"
}

package_regclient-regbot() {
  pkgdesc="Utility for automating repository actions"
  _pkgcommon "regbot"
}
