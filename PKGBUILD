# Maintainer: Tim Pearson <ttpears@gmail.com>
pkgname=tmux-tad-bin
_pkgname=tad
pkgver=0.10.1
pkgrel=1
pkgdesc="Tmux session and group manager with a native TUI dashboard (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ttpears/tad"
license=('MIT')
depends=('tmux' 'gcc-libs' 'glibc')
# Installs /usr/bin/tad — conflicts with `tmux-tad` (same project, source
# build) and with unrelated AUR `tad-bin` (CSV viewer) / `tad` (C++ array
# library) that also claim the binary name. `provides=tmux-tad=` lets
# this be a drop-in for the source package.
provides=("tmux-tad=$pkgver")
conflicts=('tad-bin' 'tad' 'tmux-tad' 'tmux-tad-git')
# Binary is prebuilt and already stripped (Cargo profile.release.strip),
# so skip makepkg's debug-split and re-strip passes — they only produce
# an empty tmux-tad-debug package.
options=('!debug' '!strip')
source=(
    "$_pkgname-$pkgver::$url/releases/download/v$pkgver/tad-v$pkgver-x86_64-linux"
    "tad.bash-$pkgver::$url/releases/download/v$pkgver/tad.bash"
    "_tad-$pkgver::$url/releases/download/v$pkgver/_tad"
    "groups.yaml.example-$pkgver::$url/releases/download/v$pkgver/groups.yaml.example"
    "config.yaml.example-$pkgver::$url/releases/download/v$pkgver/config.yaml.example"
    "LICENSE-$pkgver::$url/releases/download/v$pkgver/LICENSE"
)
# Regenerate after each release with:
#   curl -sL https://github.com/ttpears/tad/releases/download/v$pkgver/SHA256SUMS
# and paste the binary, tad.bash, _tad, groups.example, config.example, LICENSE
# hashes (in source[] order) below.
sha256sums=(
    'c3b9dbbacdc5344f1926e8909f563d3533a71ce9b17c5a47174eb87cf6c18eb8'
    '0372dd0eaa01ed0538e1413950a04412405be0305f2b81b148a7077893d4062c'
    '7cd74ed54d20443a0842afc292c7e65e5b4512e2175c73131660ba4c77ad3d7f'
    'dd2c1038564861ec5992e7163fd61284c99cd6bfe68ff86e4ed4fc5d3d77ea4f'
    '33e828950cd4d4e933a4575b2edf76ec31bdfb775b7610accc9997c7bb5eb38d'
    '0d84b0097b77a15e0900f62cc494a152dd6f5d5eb005ccb3f717309ce5630d46'
)

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver" \
        "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/tad.bash-$pkgver" \
        "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$srcdir/_tad-$pkgver" \
        "$pkgdir/usr/share/zsh/site-functions/_tad"
    install -Dm644 "$srcdir/groups.yaml.example-$pkgver" \
        "$pkgdir/usr/share/doc/$pkgname/groups.yaml.example"
    install -Dm644 "$srcdir/config.yaml.example-$pkgver" \
        "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"
    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
