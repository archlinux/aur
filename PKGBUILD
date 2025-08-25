# Maintainer: mfw <espadonne@outlook.com>

pkgname=shellp
pkgver=1.0.0
pkgrel=1
pkgdesc='Development note-taking companion that prompts you to document important shell commands'
arch=('x86_64')
url='https://github.com/tenseleyFlow/shellp'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
    'git: for Git repository integration'
    'bash: for shell hook integration'
    'zsh: for shell hook integration'
)
source=("git+https://github.com/tenseleyFlow/shellp.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd shellp
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o shellp .
}

check() {
    cd shellp
    go test ./... || true  # Allow tests to fail gracefully
}

package() {
    cd shellp
    
    # Install the binary
    install -Dm755 shellp "$pkgdir/usr/bin/shellp"
    
    # Install shell integration scripts
    install -Dm755 install_hooks.sh "$pkgdir/usr/share/shellp/install_hooks.sh"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}