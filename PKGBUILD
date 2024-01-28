# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>

pkgname=ollama-cuda
pkgdesc='Create, run and share large language models (LLMs) with CUDA'
pkgver=0.1.22
pkgrel=1
arch=(x86_64)
url='https://github.com/jmorganca/ollama'
license=(MIT)
_ollamacommit=a47d8b2557259ffc9881817df97fbf6d6824e89e # tag: v0.1.22
# The llama.cpp git submodule commit hash can be found here:
# https://github.com/jmorganca/ollama/tree/v0.1.22/llm
_llama_cpp_commit=cd4fddb29f81d6a1f6d51a0c016bc6b486d68def
makedepends=(cmake cuda git go)
provides=(ollama)
conflicts=(ollama)
source=(git+$url#tag=v$pkgver
        llama.cpp::git+https://github.com/ggerganov/llama.cpp#commit=$_llama_cpp_commit
        sysusers.conf
        tmpfiles.d
        ollama.service)
b2sums=('SKIP'
        'SKIP'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed'
        'a773bbf16cf5ccc2ee505ad77c3f9275346ddf412be283cfeaee7c2e4c41b8637a31aaff8766ed769524ebddc0c03cf924724452639b62208e578d98b9176124')

prepare() {
  cd ${pkgname/-cuda}

  rm -frv llm/llama.cpp

  # Copy git submodule files instead of symlinking because the build process is sensitive to symlinks.
  cp -r "$srcdir/llama.cpp" llm/llama.cpp

  # Turn LTO on and set the build type to Release
  sed -i 's,T_CODE=on,T_CODE=on -D LLAMA_LTO=on -D CMAKE_BUILD_TYPE=Release,g' llm/generate/gen_linux.sh
}

build() {
  cd ${pkgname/-cuda}
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  go generate ./...
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external \
    -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=$pkgver"
}

check() {
  cd ${pkgname/-cuda}
  go test ./api ./format
  ./ollama --version > /dev/null
}

package() {
  install -Dm755 ${pkgname/-cuda}/${pkgname/-cuda} "$pkgdir/usr/bin/${pkgname/-cuda}"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ${pkgname/-cuda}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
