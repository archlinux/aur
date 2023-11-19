# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>

pkgname=ollama-cuda
pkgdesc='Create, run and share large language models (LLMs) with CUDA'
pkgver=0.1.10
pkgrel=1
arch=(x86_64)
url='https://github.com/jmorganca/ollama'
license=(MIT)
provides=(ollama)
conflicts=(ollama)
makedepends=(cmake cuda git go setconf)
_ollamacommit=41434a7cdcf33918ae2d37eb23d819ef7361e843 # tag: v0.1.10
# The git submodule commit hashes are here:
# https://github.com/jmorganca/ollama/tree/v0.1.10/llm/llama.cpp
_ggmlcommit=9e232f0234073358e7031c1b8d7aa45020469a3b
_ggufcommit=9e70cc03229df19ca2d28ce23cc817198f897278
source=(git+$url#commit=$_ollamacommit
        ggml::git+https://github.com/ggerganov/llama.cpp#commit=$_ggmlcommit
        gguf::git+https://github.com/ggerganov/llama.cpp#commit=$_ggufcommit)
b2sums=('SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd ${pkgname/-cuda}

  rm -frv llm/llama.cpp/gg{ml,uf}

  # Copy git submodule files instead of symlinking because the build process is sensitive to symlinks.
  cp -r "$srcdir/ggml" llm/llama.cpp/ggml
  cp -r "$srcdir/gguf" llm/llama.cpp/gguf

  # Do not git clone when "go generate" is being run.
  sed -i 's,git submodule,true,g' llm/llama.cpp/generate_linux.go

  # Set the version number
  setconf version/version.go 'var Version string' "\"$pkgver\""
}

build() {
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  cd ${pkgname/-cuda}
  go generate ./...
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid=''
}

check() {
  cd ${pkgname/-cuda}
  go test ./...
}

package() {
  cd ${pkgname/-cuda}
  install -Dm755 ${pkgname/-cuda} "$pkgdir/usr/bin/${pkgname/-cuda}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
