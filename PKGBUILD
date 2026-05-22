# Maintainer: Tim Pearson <ttpears@gmail.com>
pkgname=tmux-tad-bin
_pkgname=tad
pkgver=0.8.0
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
    'eff1b0d51c0cce4b7736ed00a55f80d521558305faecfc4ca5f889188a14807f'
    'c8c3f620e5dccfc2973656078725380efa9c3402e6dbb99cca4706f6fa54e909'
    '2375ad400463e970d3b12e04f2080fd2ad13ae4268d94998874bf4dc1f0721c0'
    '5a20954483b4d58685a7206afb612f215ff95a950adeeaeae46fa0b8ae5355f3'
    '3bfa01285de93ccc6ea867cada2378243dfb01fd380fd4d672788a50f755852d'
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
