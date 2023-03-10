# Maintainer: Michael Gebetsroither <m.gebetsr@gmail.com>
pkgbase=regclient
pkgname=(
  regclient-regctl
  regclient-regsync
  regclient-regbot
)
pkgver=0.4.7
pkgrel=0
pkgdesc='Docker and OCI Registry tooling - regctl / regsync / regbot'
arch=('x86_64' 'aarch64')
url='https://github.com/regclient/regclient'
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/regclient/regclient/archive/v$pkgver/$pkgbase-$pkgver.tar.gz")
# how to build git tag from github
#source=("$pkgbase-$pkgver.tar.gz::https://github.com/regclient/regclient/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bfdc0ab0e194f9ed4bf9b7aefe15853445046dcf9708ed252473783c204aa9a8')
_bins=('regctl' 'regsync' 'regbot')

build() {
  local _commit
  _commit="$(bsdcat "$pkgbase-$pkgver.tar.gz" | git get-tar-commit-id)"
  mkdir -p build/ && cd build/
  # we want "clean" go binaries
  export CGO_ENABLED=0

  # FIXME - what is the correct version here? the aur repo it's build from or the upstream repo?
  # currently the "real" program version is not shown beacuse it's implicitely taken from the git tag from repo...
  #( cd "../$pkgbase-$pkgver" && echo "{\"VCSRef\": \"${_commit}\", \"VCSTag\": \"${pkgver}\"}" >./embed/version.json )

  for i in "${_bins[@]}"; do
    (
      cd "../$pkgbase-$pkgver"
      #cp ./embed/version.json "cmd/$i/embed/"
      go build -ldflags "-s -w -extldflags -static" -tags nolegacy -trimpath -o ../build ./cmd/$i
    )

    ./$i completion bash >$i.bash
    ./$i completion zsh >$i.zsh
  done
}

check() {
    echo '# go test'
    (
        cd "${pkgbase}-${pkgver}"
        go test -mod=readonly ./...
    )
    echo '# Check for unclean build'
    # yea it's annoying for dev builds because it trips every time when git repo has uncommited changes
    (
        cd build/
        for i in "${_bins[@]}"; do
            echo "#  $i"
            ./$i version |grep '^VCSState:\s*clean$'
        done
    )
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
