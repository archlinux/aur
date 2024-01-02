# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Kien Dang <mail at kien dot ai>
# Contributor: Julie Shapiro <jshapiro at nvidia dot com>
pkgname=nvidia-container-toolkit
pkgver=1.14.3
pkgrel=3
pkgdesc="NVIDIA container runtime toolkit"
arch=('x86_64')
url="https://github.com/NVIDIA/nvidia-container-toolkit"
license=('Apache')
depends=("libnvidia-container-tools=$pkgver")
makedepends=('git' 'go')
conflicts=('nvidia-container-runtime-hook' 'nvidia-container-runtime<2.0.0')
replaces=('nvidia-container-runtime-hook')
backup=('etc/nvidia-container-runtime/config.toml')
options=('!lto') # flag provided but not defined: -flto
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'go-nvml-79.patch')
sha256sums=('a8dbb6a8d45fe8cb2ecbb7b5d49c332e0e7270e8988e57d2a8587ab1e004f6dd'
            '24182b216338472867bf0d597b9318281998b8f352e612c997913fa7a829f32b')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build

  # gen/nvml: add --export-dynamic linker flag
  # https://github.com/NVIDIA/go-nvml/issues/36
  cd vendor/github.com/NVIDIA/go-nvml
  git apply "$srcdir/go-nvml-79.patch"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -s -w -X github.com/NVIDIA/nvidia-container-toolkit/internal/info.version=$pkgver" \
    -o build ./...

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/nvidia-{ctk,container-runtime,container-runtime{.cdi,.legacy,-hook}} -t \
    "$pkgdir/usr/bin/"
  ln -s nvidia-container-runtime-hook "$pkgdir/usr/bin/nvidia-container-toolkit"

  # Generate the default config
  "$pkgdir"/usr/bin/nvidia-ctk --quiet config --config-file="$pkgdir"/etc/nvidia-container-runtime/config.toml --in-place
}
