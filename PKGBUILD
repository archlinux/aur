# Maintainer: Ali Yaghoubi <fakeshinigami110@gmail.com>
pkgname=custom-ime
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool for creating and managing custom Input Method Engines for fcitx5"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/fakeshinigami110/custom-IME"
license=('GPL3')
depends=(
    'fcitx5'
    'cmake'
    'gcc'           
    'make'          
    'xcb-proto'    
    'libxcb'        
    'expat'        
    'pkgconf'       
    'json-c'        
    'dbus'          
    'fmt'
    'unicode-cldr-annotations'           
)
makedepends=('go'  'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fakeshinigami110/custom-IME/archive/v$pkgver.tar.gz")
sha256sums=('48f79943cc431c713b11056212786f9fba8947f77e0d3cd77c4e1b3a8cc40372')  

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o custom-ime .
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 custom-ime "$pkgdir"/usr/bin/custom-ime
  
  # Install man page
  install -Dm644 docs/custom-ime.1 "$pkgdir"/usr/share/man/man1/custom-ime.1
  
  # Install license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  
  # Install bash completion
  install -Dm644 completions/bash/custom-ime "$pkgdir"/usr/share/bash-completion/completions/custom-ime
  
  # Install zsh completion
  install -Dm644 completions/zsh/_custom-ime "$pkgdir"/usr/share/zsh/site-functions/_custom-ime
  
  # Install fish completion
  install -Dm644 completions/fish/custom-ime.fish "$pkgdir"/usr/share/fish/vendor_completions.d/custom-ime.fish
}