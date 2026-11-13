# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=winedirectalsa-bin
pkgver=1.0.0_beta.4
pkgrel=2
pkgdesc='Ultra-low-latency ASIO driver for Wine/Proton'
arch=(x86_64)
url=https://github.com/na1307/winedirectalsa
license=(MIT)
depends=(alsa-lib systemd-libs libstdc++ libgcc glibc python-vdf umu-launcher)
optdepends=(
    'steam: steam games'
    'rtkit: realtime thread'
)
provides=(winedirectalsa)
conflicts=(winedirectalsa)
source=("https://github.com/na1307/winedirectalsa/releases/download/v1.0.0-beta.4/winedirectalsa.tar.gz")
sha256sums=(62392ba11774c5bbb804fce80039f2e3cc3f1429bd28f99ad66d20c2ad7bf61d)

package() {
    cd "$srcdir"

    install -Dm755 -t "$pkgdir/usr/bin" wda-install
    install -Dm755 -t "$pkgdir/opt/winedirectalsa/x86_64-windows" x86_64-windows/**
    install -Dm755 -t "$pkgdir/opt/winedirectalsa/x86_64-unix" x86_64-unix/**

    local _tmp
    local _reg_tmp

    _tmp=$(mktemp)
    _reg_tmp=$(mktemp)

    set -o pipefail

    if ! iconv -f UTF-16 -t UTF-8 "Manual Register.reg" |
        sed 's|home\\\\(YOUR USER NAME)\\\\\.local\\\\lib\\\\wine|opt\\\\winedirectalsa|g' |
        iconv -f UTF-8 -t UTF-16LE > "$_tmp"; then
        rm -f "$_tmp" "$_reg_tmp"
        return 1
    fi

    {
        printf '\xff\xfe'
        cat "$_tmp"
    } > "$_reg_tmp"

    install -Dm644 "$_reg_tmp" "$pkgdir/opt/winedirectalsa/Manual Register.reg"

    rm -f "$_tmp" "$_reg_tmp"

    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.ko.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" INSTALLATION.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
