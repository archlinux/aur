# Maintainer: r1a <m@zcq100.com>
pkgname=nethack-cn-bin
pkgver=5.0.1pre509.27e34f0
pkgrel=1
_tag='nethack-pre-509-27e34f0'
_ver='501'
pkgdesc='Simplified Chinese localization of NetHack 5.0.1 (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/StackC00ki3/Nethack-cn'
license=('custom:NGPL')
depends=('ncurses')
options=('!strip' '!debug')

source_x86_64=("${_tag}-x86_64.tar.gz::https://github.com/StackC00ki3/Nethack-cn/releases/download/${_tag}/NetHack-${_ver}-linux-amd64-glibc-s.tar.gz")
source_aarch64=("${_tag}-aarch64.tar.gz::https://github.com/StackC00ki3/Nethack-cn/releases/download/${_tag}/NetHack-${_ver}-linux-arm64-glibc-s.tar.gz")
sha256sums_x86_64=('e252de2a20ab01055e9db0d1b2ad9eb1b228144475ce348667b0d47b96cb52f0')
sha256sums_aarch64=('db868501984966eb971a156ac6939579532c8d611f9b8c13110eca4ae7caea04')

package() {
    install -d "$pkgdir/usr/lib/nethack-cn" "$pkgdir/usr/bin"
    install -m755 nethack recover "$pkgdir/usr/lib/nethack-cn/"
    install -m644 nhdat symbols license sysconf "$pkgdir/usr/lib/nethack-cn/"

    install -Dm644 Guidebook.txt "$pkgdir/usr/share/doc/nethack-cn/Guidebook.txt"
    install -Dm644 nethack.txt "$pkgdir/usr/share/doc/nethack-cn/nethack.txt"
    install -Dm644 license "$pkgdir/usr/share/licenses/nethack-cn/license"
    install -Dm644 nethack.txt "$pkgdir/usr/share/man/man6/nethack-cn.6"
    gzip -9n "$pkgdir/usr/share/man/man6/nethack-cn.6"

    cat > "$pkgdir/usr/bin/nethack-cn" <<'EOF'
#!/bin/sh
data=/usr/lib/nethack-cn
play=${NETHACK_CN_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/nethack-cn}

mkdir -p "$play/save"
for f in nhdat symbols license sysconf; do
    ln -sfn "$data/$f" "$play/$f"
done
cd "$play" || exit 1
exec "$data/nethack" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/nethack-cn"

    cat > "$pkgdir/usr/bin/nethack-cn-recover" <<'EOF'
#!/bin/sh
data=/usr/lib/nethack-cn
play=${NETHACK_CN_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/nethack-cn}

mkdir -p "$play/save"
for f in nhdat symbols license sysconf; do
    ln -sfn "$data/$f" "$play/$f"
done
cd "$play" || exit 1
exec "$data/recover" "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/nethack-cn-recover"
}
