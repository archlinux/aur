# Maintainer: mfw <espadonne@outlook.com>

pkgname=gitswitcher
pkgver=1.10.0
pkgrel=1
pkgdesc='Secure Git identity and SSH/GPG key management tool for seamless account switching'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/gitswitchC'
license=('GPL-3.0-or-later')
depends=('git' 'openssh' 'gnupg' 'readline')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3628317c6dd2470707e4fcc141ab38b089892661030ccbf246fad9c2d5506d9b')

build() {
    make -C "$srcdir/gitswitchC-$pkgver" \
        BUILD_TYPE=release READLINE=1 VERSION="$pkgver" COMMIT=aur
}

check() {
    make -C "$srcdir/gitswitchC-$pkgver" release-artifact-test \
        BUILD_TYPE=release READLINE=1 VERSION="$pkgver" COMMIT=aur \
        PREFIX=/usr
    test "$("$srcdir/gitswitchC-$pkgver/build/bin/gitswitch" --version)" = \
        "gitswitch-c $pkgver (aur)"
}

package() {
    # PREFIX=/usr so the binary and shell completions land in Arch's real
    # paths (/usr/bin, /usr/share/{bash-completion,zsh/site-functions,fish})
    # rather than /usr/local, where zsh/fish completions wouldn't be found.
    make -C "$srcdir/gitswitchC-$pkgver" install \
        BUILD_TYPE=release READLINE=1 VERSION="$pkgver" COMMIT=aur \
        DESTDIR="$pkgdir" PREFIX=/usr

    # Install documentation
    install -Dm644 "$srcdir/gitswitchC-$pkgver/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/gitswitchC-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
