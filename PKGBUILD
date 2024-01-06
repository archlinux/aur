# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>

pkgname=ollama-cuda
pkgdesc='Create, run and share large language models (LLMs) with CUDA'
pkgver=0.1.18
pkgrel=1
arch=(x86_64)
url='https://github.com/jmorganca/ollama'
license=(MIT)
# The git submodule commit hashes are here:
# https://github.com/jmorganca/ollama/tree/v$pkgver
_llamacppcommit=328b83de23b33240e28f4e74900d1d06726f5eb1
makedepends=(cmake cuda git go)
provides=(ollama)
conflicts=(ollama)
source=(git+$url#tag=v$pkgver
        llamacpp::git+https://github.com/ggerganov/llama.cpp#commit=$_llamacppcommit
        sysusers.conf
        tmpfiles.d
        ollama.service)
b2sums=('SKIP'
        'SKIP'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'c890a741958d31375ebbd60eeeb29eff965a6e1e69f15eb17ea7d15b575a4abee176b7d407b3e1764aa7436862a764a05ad04bb9901a739ffd81968c09046bb6'
        'a773bbf16cf5ccc2ee505ad77c3f9275346ddf412be283cfeaee7c2e4c41b8637a31aaff8766ed769524ebddc0c03cf924724452639b62208e578d98b9176124')

prepare() {
  cd ${pkgname/-cuda}

  rm -frv llm/llama.cpp

  # Copy git submodule files instead of symlinking because the build process is sensitive to symlinks.
  cp -r "$srcdir/llamacpp" llm/llama.cpp

  # Do not git clone when "go generate" is being run.
  sed -i 's,git submodule,true,g' llm/generate/gen_common.sh

  # Set build mode to release
  sed -i '33s/DebugMode/ReleaseMode/;45s/DebugMode/ReleaseMode/' "$srcdir/ollama/server/routes.go"
}

build() {
  cd ${pkgname/-cuda}
  export CGO_CFLAGS="$CFLAGS" CGO_CPPFLAGS="$CPPFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  go generate ./...
  go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid=''
}

check() {
  cd ${pkgname/-cuda}
  go test ./...
}

package() {
  install -Dm755 ${pkgname/-cuda}/${pkgname/-cuda} "$pkgdir/usr/bin/${pkgname/-cuda}"
  install -dm700 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ${pkgname/-cuda}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
