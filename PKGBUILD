# Maintainer: edombek <edombek@users.noreply.github.com>
# EDID for the ASUS VS229H monitor with a repaired checksum byte.

pkgname=asus-vs229h-edid-firmware
pkgver=1.3
pkgrel=1
pkgdesc="Fixed EDID for the ASUS VS229H monitor (its EEPROM checksum byte is corrupt, so drivers reject the real EDID and offer only 1024x768)"
arch=('any')
url="https://aur.archlinux.org/packages/asus-vs229h-edid-firmware"
license=('GPL3' 'custom')
optdepends=('i2c-tools: re-read the EDID from your own monitor with "asus-vs229h-edid refresh"')
source=(
    'asus-vs229h.edid.hex'
    'asus-vs229h-edid'
    'asus-vs229h-edid.service'
    'README.md'
)
sha256sums=(
            'f942ebba6757ae58df56d1b5d16a62de69eaa926daa01927f9946475ac472dd0'
            'ad5fd9de0d84949e31beb3901db08425a89f218c5ada49f2fa07a04bd3938913'
            '8583590500f66cd6f832f53ab9fb3e54f4d6227233848332b450ca034dfe96e8'
            'a367771b8550d4da5ee5cfecaab3c3b10dc0147b66090a6b4b37bf31f1207a05'
        )

build() {
    cd "$srcdir"
    # hex -> binary without extra build deps (xxd ships with vim on Arch)
    local hex fmt='' i d
    hex=$(tr -d ' \n' < asus-vs229h.edid.hex)
    for ((i = 0; i < ${#hex}; i += 2)); do
        printf -v d '%d' "0x${hex:i:2}"
        fmt+=$(printf '\\%03o' "$d")
    done
    printf '%b' "$fmt" > asus-vs229h.bin
}

check() {
    cd "$srcdir"
    local size sum header
    size=$(stat -c %s asus-vs229h.bin)
    (( size == 256 )) || { echo "EDID size is $size bytes, expected 256"; return 1; }

    header=$(od -An -tx1 -N8 -v asus-vs229h.bin | tr -d ' \n')
    [[ $header == 00ffffffffffff00 ]] || { echo "bad EDID header: $header"; return 1; }

    local off
    for off in 0 128; do
        sum=$(dd if=asus-vs229h.bin bs=1 skip="$off" count=128 status=none |
              od -An -tu1 -v | awk '{for(n=1;n<=NF;n++)s+=$n} END{print s%256}')
        (( sum == 0 )) || { echo "bad checksum in EDID block at $off (sum%256=$sum)"; return 1; }
    done
    echo "EDID OK: 256 bytes, header and both block checksums valid"
}

package() {
    cd "$srcdir"
    install -Dm644 asus-vs229h.bin "$pkgdir/usr/lib/firmware/edid/asus-vs229h.bin"
    install -Dm755 asus-vs229h-edid "$pkgdir/usr/bin/asus-vs229h-edid"
    install -Dm644 asus-vs229h-edid.service "$pkgdir/usr/lib/systemd/system/asus-vs229h-edid.service"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -m644 asus-vs229h.edid.hex "$pkgdir/usr/share/doc/$pkgname/asus-vs229h.edid.hex"
}

post_install() {
    /usr/bin/asus-vs229h-edid notice
}

post_upgrade() {
    post_install
}
