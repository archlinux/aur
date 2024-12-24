# Maintainer: envolution
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=ollama-nogpu-git
_pkgname=ollama
pkgver=0.5.4+r3753+gffe354906
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs)'
arch=(x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
options=('!lto')
makedepends=(cmake git go)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/ollama/ollama.git
  ollama-ld.conf
  ollama.service
  sysusers.conf
  tmpfiles.d)
b2sums=('SKIP'
        '121a7854b5a7ffb60226aaf22eed1f56311ab7d0a5630579525211d5c096040edbcfd2608169a4b6d83e8b4e4855dbb22f8ebf3d52de78a34ea3d4631b7eff36'
        '031e0809a7f564de87017401c83956d43ac29bd0e988b250585af728b952a27d139b3cad0ab1e43750e2cd3b617287d3b81efc4a70ddd61709127f68bd15eabd'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-ldflags=-linkmode=external -compressdwarf=false -X=github.com/ollama/ollama/version.Version=$pkgver -X=github.com/ollama/ollama/server.mode=release'"

  cd ollama

  # Unset these otherwise somehow nvcc will try to use them.
  unset CFLAGS CXXFLAGS
  make dist
  go build .
}

check() {
  ollama/ollama --version >/dev/null
  cd $_pkgname
  go test .
}

package() {
  install -Dm755 $_pkgname/$_pkgname "$pkgdir/usr/bin/ollama"
  mkdir -p "$pkgdir"/usr/lib/ollama/runners
  cp -r ollama/dist/linux-amd64/lib/ollama/runners/cpu* "$pkgdir"/usr/lib/ollama/runners/

  install -Dm755 $_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
