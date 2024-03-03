# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>

pkgname=ollama-rocm-git
pkgdesc='Create, run and share large language models (LLMs) with ROCm'
pkgver=0.1.27.g076237b8
pkgrel=1
arch=(x86_64)
url='https://github.com/jmorganca/ollama'
license=(MIT)
makedepends=(cmake clblast rocblas hipblas git go)
provides=(ollama)
conflicts=(ollama ollama-cuda)
source=(git+$url
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        'a773bbf16cf5ccc2ee505ad77c3f9275346ddf412be283cfeaee7c2e4c41b8637a31aaff8766ed769524ebddc0c03cf924724452639b62208e578d98b9176124'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ${pkgname/-rocm-git}

  local _tag=$(git describe --tags --abbrev=0 | sed "s/^v//")
  local _commit=$(git describe --abbrev=8 --always)
  echo "$_tag.g$_commit"
}

prepare() {
  cd ${pkgname/-rocm-git}

  # Clone submodules (llama.cpp)
  git submodule update --init --recursive

  # Turn LTO on and set the build type to Release
  sed -i 's,T_CODE=on,T_CODE=on -D LLAMA_LTO=on -D CMAKE_BUILD_TYPE=Release,g' llm/generate/gen_linux.sh

  # Fix linking (https://github.com/ollama/ollama/issues/2473#issuecomment-1942090475)
  sed -i 's,g++,/opt/rocm/llvm/bin/clang++ -fcf-protection=none,g' llm/generate/gen_common.sh

  # Display a more helpful error message
  sed -i "s|could not connect to ollama server, run 'ollama serve' to start it|ollama is not running, try 'systemctl start ollama'|g" cmd/cmd.go
}

build() {
  cd ${pkgname/-rocm-git}
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  go generate ./...
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external \
    -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=$pkgver"
}

check() {
  cd ${pkgname/-rocm-git}
  go test ./api ./format
  ./ollama --version > /dev/null
}

package() {
  install -Dm755 ${pkgname/-rocm-git}/${pkgname/-rocm-git} "$pkgdir/usr/bin/${pkgname/-rocm-git}"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ${pkgname/-rocm-git}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
