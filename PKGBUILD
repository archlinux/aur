# Maintainer: envolution
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=ollama-cuda-git
_pkgbase=ollama
pkgdesc='Create, run and share large language models (LLMs) with CUDA'
pkgver=0.4.6+r3694+g5f8051180
pkgrel=1
arch=(x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
provides=(ollama ollama-cuda)
conflicts=(ollama)
depends=(cuda)
makedepends=(clblast cmake git go pigz)
optdepends=('nvidia-utils: monitor GPU usage with nvidia-smi')
source=("git+https://github.com/ollama/ollama.git#branch=main"
  # ollama-7499.patch::https://github.com/ollama/ollama/pull/7499.patch - doesn't work on latest git
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
  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd ollama
  export CFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt"
  export CXXFLAGS="$CFLAGS"
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export CFLAGS+=' -w'
  export CXXFLAGS+=' -w'

  local goflags="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  local ldflags="-linkmode=external -buildid= -X github.com/ollama/ollama/version.Version=$(git describe --tags --abbrev=0 | sed "s/^v//" | sed "s/-rc[0-9]*$//")"

  export ROCM_PATH=/disabled
  export ONEAPI_ROOT=/disabled
  export OLLAMA_CUSTOM_CPU_DEFS="-DLLAMA_AVX=on -DLLAMA_AVX2=on -DLLAMA_F16C=on -DLLAMA_FMA=on"

  go generate ./...
  go build $goflags -ldflags="$ldflags"
}

check() {
  ollama/ollama --version >/dev/null
  cd ollama
  go test .
}

package() {
  install -Dm755 ollama/ollama "$pkgdir/usr/bin/ollama"
  mkdir -p "$pkgdir"/usr/lib/ollama
  cp -r ollama/dist/linux-amd64/lib/ollama/runners "$pkgdir"/usr/lib/ollama

  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ollama-ld.conf "$pkgdir/etc/ld.so.conf.d/ollama.conf"

  install -dm755 "$pkgdir/var/lib/ollama"

  install -Dm644 ollama/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
