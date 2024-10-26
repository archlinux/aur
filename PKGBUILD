# Maintainer: Salvador Pardiñas <darkfm@vera.com.uy>
pkgname=deepcool-digital-linux-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r48.d80f346
pkgrel=1
pkgdesc="Linux version for the DeepCool Digital Windows software."
arch=(x86_64)
url="https://github.com/Nortank12/deepcool-digital-linux"
license=('GPLv3')
makedepends=(git cargo) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Nortank12/deepcool-digital-linux.git' '99-deepcool-digital.rules' 'deepcool-digital.service')
sha256sums=('SKIP'
            'a9936287d7c802ac51c72ec706ef8833c484c29821510c76e5ccfb712d5485f1'
            '6dc7fa065d44ee45e6150e184182e84399e5a41fba1385767404c521b4843268')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    cd "$srcdir"
    install -Dm0644 -t "$pkgdir/etc/udev/rules.d/" "99-deepcool-digital.rules"
    install -Dm0644 -t "$pkgdir/etc/systemd/system/" "deepcool-digital.service"
}
