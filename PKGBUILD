# Maintainer: Qaaxaap
pkgname=qp-ng-git
_pkgname=qp-ng
pkgver=0
pkgrel=2
pkgdesc='LFS package manager - fork of paru'
url='https://github.com/Qaaxaap/qp-ng'
source=("git+https://github.com/Qaaxaap/qp-ng.git")
backup=("etc/qp.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('0BSD')
makedepends=('cargo')
depends=('git' 'pacman' 'libalpm.so>=14')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru' 'qp-ng')
provides=('qp-ng')
sha256sums=(SKIP)

prepare() {
    cd "$_pkgname"
    cargo update alpm alpm-utils
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/$_pkgname"

    if pacman -T pacman-git >/dev/null; then
        _features+="git,"
    fi

    if [[ $(rustc -V) == *"nightly"* ]]; then
        _features+="backtrace,"
    fi

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    QP_VERSION=$pkgver cargo build --frozen --features "${_features:-}" --release --target-dir target
    ./scripts/mkmo locale/
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 target/release/qp "${pkgdir}/usr/bin/qp"
    install -Dm644 qp.conf "${pkgdir}/etc/qp.conf"

    install -Dm644 man/qp.8 "$pkgdir/usr/share/man/man8/qp.8"
    install -Dm644 man/qp.conf.5 "$pkgdir/usr/share/man/man5/qp.conf.5"

    install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/qp.bash"
    install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/qp.fish"
    install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_qp"

    install -d "$pkgdir/usr/share/"
    cp -r locale "$pkgdir/usr/share/"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
