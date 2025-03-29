# Contributor: robertfoster

pkgname=local-ai-vulkan-openblas
pkgver=2.26.0
pkgrel=2
pkgdesc="The free, Open Source alternative to OpenAI, Claude and others. (Vulkan acceleration and openblas as fallback)"
provides=(local-ai local-ai-vulkan)
conflicts=(local-ai local-ai-vulkan)
arch=(x86_64)
url=https://localai.io
license=(MIT)
depends=(glibc gcc-libs grpc protobuf abseil-cpp zlib openblas vulkan-icd-loader)
makedepends=(git cmake go protoc-gen-go protoc-gen-go-grpc upx blas-openblas blas64-openblas
             vulkan-headers shaderc)
source=("git+https://github.com/mudler/LocalAI.git#tag=v$pkgver"
        "local-ai.service")
sha256sums=('ef5e3a6403e50feb4d16bfd9af958ab6e63eb9c567d9babed524ac7fc0785bb1'
            'e85dd9d74e0b28ee2d47f618cf3ea57099b0f2aa020e64d6494af466a0177d0a')

prepare() {
    cd "$srcdir/LocalAI"
    make prepare-sources
    sed -i "s/-lfmt -lspdlog -lucd//" \
        sources/go-piper/Makefile
}

build() {
    cd "$srcdir/LocalAI"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    MAKE_COMMON_ARGS=(CGO_LDFLAGS_WHISPER="${LDFLAGS}"
                      GO_TAGS="stablediffusion,tts,p2p")
    echo "Building llama.cpp-fallback with openblas..."
    make "${MAKE_COMMON_ARGS[@]}" BUILD_TYPE=openblas backend-assets/grpc/llama-cpp-fallback
    echo "Building other parts with vulkan..."
    make "${MAKE_COMMON_ARGS[@]}" BUILD_TYPE=vulkan SKIP_GRPC_BACKEND=backend-assets/grpc/llama-cpp-fallback build
}

package() {
    cd "$srcdir/LocalAI"
    install -Dm755 local-ai "$pkgdir/usr/bin/local-ai"
    install -Dm644 "$srcdir/local-ai.service" "$pkgdir/usr/lib/systemd/system/local-ai.service"
    install -Dm644 .env "$pkgdir/usr/share/doc/local-ai/localai.env"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LISENSE"
}
