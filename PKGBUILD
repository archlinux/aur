# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=winedirectalsa-bin
pkgver=1.0.0_beta.3
pkgrel=1
pkgdesc='Ultra-low-latency ASIO driver for Wine/Proton'
arch=(x86_64)
url=https://github.com/na1307/winedirectalsa
license=(MIT)
depends=('libasound.so=2-64' 'libsystemd.so=0-64' 'libstdc++.so=6-64' 'libgcc_s.so=1-64' 'glibc')
optdepends=(
    'steam: steam games'
    'python-vdf: for automatic installation script'
    'umu-launcher: for automatic installation script'
    'rtkit: realtime thread'
)
provides=(winedirectalsa)
conflicts=(winedirectalsa)
source=("https://github.com/na1307/winedirectalsa/releases/download/v1.0.0-beta.3/winedirectalsa.tar.gz")
sha256sums=(ef9aec24bdae7f11239e75489e4d47fbdcc96ebb7ebd2e6e569055a3ad3c51ae)

package() {
    cd "$srcdir"

    install -Dm755 -t "$pkgdir/usr/bin" wda-install
    install -Dm755 -t "$pkgdir/usr/lib/winedirectalsa/x86_64-windows" x86_64-windows/**
    install -Dm755 -t "$pkgdir/usr/lib/winedirectalsa/x86_64-unix" x86_64-unix/**

    local _tmp
    local _reg_tmp

    _tmp=$(mktemp)
    _reg_tmp=$(mktemp)

    set -o pipefail

    if ! iconv -f UTF-16 -t UTF-8 "Manual Register.reg" |
        sed 's|home\\\\(YOUR USER NAME)\\\\\.local\\\\lib\\\\wine|usr\\\\lib\\\\winedirectalsa|g' |
        iconv -f UTF-8 -t UTF-16LE > "$_tmp"; then
        rm -f "$_tmp" "$_reg_tmp"
        return 1
    fi

    {
        printf '\xff\xfe'
        cat "$_tmp"
    } > "$_reg_tmp"

    install -Dm644 "$_reg_tmp" "$pkgdir/usr/lib/winedirectalsa/Manual Register.reg"

    rm -f "$_tmp" "$_reg_tmp"

    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.ko.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" INSTALLATION.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
