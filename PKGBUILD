# Maintainer: Eskil Queseth <eskilq at kth dot se>
# Maintainer: Gustav Sörnäs <gustav at sornas dot net>

pkgname=mum-git
pkgver=r698.fe7f460
pkgrel=1
pkgdesc="A mumble client/daemon pair"
arch=('x86_64')
url="https://github.com/mum-rs/mum.git"
license=('MIT')
sha256sums=('SKIP')
depends=('alsa-lib' 'libnotify' 'opus' 'openssl')
optdepends=('bash: for tab completions'
            'fish: for tab completions'
            'zsh: for tab completions')
makedepends=('git' 'cargo')
conflicts=('mum')
provides=('mum')
source=("git+$url")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo +stable build --locked --release --target-dir=target

    ./target/release/mumctl completions bash > mumctl.bash
    ./target/release/mumctl completions fish > mumctl.fish
    ./target/release/mumctl completions zsh > mumctl.zsh
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo +stable test --locked --release --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm 644 mumctl.bash "${pkgdir}/usr/share/bash-completion/completions/mumctl"
    install -Dm 644 mumctl.fish "${pkgdir}/usr/share/fish/completions/mumctl.fish"
    install -Dm 644 mumctl.zsh "${pkgdir}/usr/share/zsh/site-functions/_mumctl"

    install -Dm 644 documentation/mumctl.1 "${pkgdir}/usr/share/man/man1/mumctl.1"
    install -Dm 644 documentation/mumd.1 "${pkgdir}/usr/share/man/man1/mumd.1"
    install -Dm 644 documentation/mumdrc.5 "${pkgdir}/usr/share/man/man5/mumdrc.5"

    install -Dm 755 target/release/mumctl "${pkgdir}/usr/bin/mumctl"
    install -Dm 755 target/release/mumd "${pkgdir}/usr/bin/mumd"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
