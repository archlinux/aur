# Maintainer: Christopher D. Degawa <ccom@randomderp.com>
# Contributor: envolution
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=ollama-cuda-git
_pkgname=ollama
pkgver=0.13.3.rc0+r4860+gd475d1f08
pkgrel=3
pkgdesc='Create, run and share large language models (LLMs) with CUDA'
arch=(x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
options=('!lto')
makedepends=(cmake ninja git go cuda)
provides=("$_pkgname=$pkgver" "$_pkgname-cuda=$pkgver")
conflicts=("$_pkgname" "$_pkgname-cuda")
source=(git+https://github.com/ollama/ollama.git
  ollama-ld.conf
  ollama.service
  sysusers.conf
  tmpfiles.d)
b2sums=('SKIP'
        '121a7854b5a7ffb60226aaf22eed1f56311ab7d0a5630579525211d5c096040edbcfd2608169a4b6d83e8b4e4855dbb22f8ebf3d52de78a34ea3d4631b7eff36'
        '031e0809a7f564de87017401c83956d43ac29bd0e988b250585af728b952a27d139b3cad0ab1e43750e2cd3b617287d3b81efc4a70ddd61709127f68bd15eabd'
        '68622ac2e20c1d4f9741c57d2567695ec7b5204ab43356d164483cd3bc9da79fad72489bb33c8a17c2e5cb3b142353ed5f466ce857b0f46965426d16fb388632'
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

  sed -i 's/PRE_INCLUDE_REGEXES.*/PRE_INCLUDE_REGEXES = ""/' CMakeLists.txt
  local cmake_options=(
    -B build
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    # Disable Vulkan/HIP
    -D CMAKE_DISABLE_FIND_PACKAGE_Vulkan=TRUE
    -D CMAKE_HIP_COMPILER=""
    # For CUDA build only
    # Sync GPU targets from CMakePresets.json
    # For CUDA 12
    # -D CMAKE_CUDA_ARCHITECTURES="50;52;53;60;61;62;70;72;75;80;86;87;89;90;90a"
    # for CUDA 13
    -D CMAKE_CUDA_ARCHITECTURES="75;80;86;87;88;89;90;100;103;110;120;121;121-virtual"
  )

  cmake "${cmake_options[@]}"
  cmake --build build
  go build .
}

check() {
  $_pkgname/$_pkgname --version >/dev/null
  cd $_pkgname
  go test .
}

package() {
  DESTDIR="$pkgdir" cmake --install ollama/build --component CPU

  install -Dm755 $_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -s /var/lib/ollama "$pkgdir/usr/share/ollama"

  DESTDIR="$pkgdir" cmake --install ollama/build --component CUDA
}
# vim:set ts=2 sw=2 et:
