# Maintainer: goatty-dev <https://github.com/goatty-dev/goatty>
#
# The AUR package goatty-bin, built from the release archive. release.yml
# fills in pkgver and sha256sums (scripts/aur-pkgbuild.sh), tests it, and
# pushes it to ssh://aur@aur.archlinux.org/goatty-bin.git on every stable
# release. Don't edit the copy on the AUR; change this file.
pkgname=goatty-bin
_pkgname=goatty
pkgver=0.4.0
pkgrel=1
pkgdesc='GPU-rendered terminal with persistent sessions'
arch=('x86_64')
url='https://github.com/goatty-dev/goatty'
license=('MIT OR Apache-2.0')
depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-driver'
    'vulkan-icd-loader'
    'wayland'
)
optdepends=('zsh: the managed shell (without it goatty starts your login shell)')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Already stripped (the dist profile); the static remote goattyds must stay as built.
options=('!strip' '!debug')
source=("https://github.com/goatty-dev/goatty/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
sha256sums=('e9f147a9e5c209897f2e2796f88edb6886abf8882b043b98c97032bf4314798d')

package() {
    cd "$_pkgname-$pkgver-x86_64-linux"
    install -Dm755 -t "$pkgdir/usr/bin" goatty goattyd
    # goatty looks for these in ../lib/goatty/remote next to its binary.
    install -Dm755 -t "$pkgdir/usr/lib/goatty/remote" remote/goattyd-*
    install -Dm644 -t "$pkgdir/usr/share/applications" dev.goatty.goatty.desktop
    install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps" goatty.svg
    local b
    for b in goatty goattyd; do
        install -Dm644 "completions/$b.bash" "$pkgdir/usr/share/bash-completion/completions/$b"
        install -Dm644 "completions/_$b" "$pkgdir/usr/share/zsh/site-functions/_$b"
        install -Dm644 "completions/$b.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$b.fish"
    done
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
