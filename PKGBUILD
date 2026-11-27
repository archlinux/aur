# Maintainer: raafat.turki <raafat.turki@protonmail.com>

pkgname=loom-cli-git
_name=loom
pkgver=r100.1784678
pkgrel=1
pkgdesc='TUI for finding, downloading and running GGUF models with llama.cpp'

arch=('x86_64' 'aarch64')
url='https://github.com/the-loom-project/loom'
license=('MIT')

depends=('glibc' 'llama-cpp')
makedepends=('git' 'go')
optdepends=('ggml-vulkan: Vulkan GPU backend for llama.cpp'
            'ggml-cuda: CUDA GPU backend for llama.cpp'
            'ggml-hip: ROCm GPU backend for llama.cpp'
            'wl-clipboard: copy commands on Wayland'
            'xclip: copy commands on X11'
            'xdg-utils: open model pages in the browser')
# the unrelated AUR package `loom` also ships /usr/bin/loom
conflicts=('loom')

source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_name"
  export GOPATH="$srcdir/gopath" GOFLAGS='-modcacherw'
  go mod download
}

build() {
  cd "$_name"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  go build -o "$_name" .

  # loom opens its config and store before dispatching, so keep it out of the builder's home
  HOME="$srcdir/home" XDG_CONFIG_HOME="$srcdir/home/.config" XDG_DATA_HOME="$srcdir/home/.local/share" \
    ./"$_name" completion fish > "$_name.fish"
}

package() {
  cd "$_name"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 "$_name.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
