# Maintainer: Thamer Alharbi
pkgname=baseer
pkgver=0.2.0
pkgrel=1
pkgdesc="Binary analysis tool (ELF, TAR, PNG, PE, ...)"
arch=('x86_64')
url="https://github.com/thxa/baseer"
license=('MIT')
depends=('gcc' 'make')
source=("https://github.com/thxa/baseer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f501f54d4de920601955465aa4896095da16a52d6fa9bb56cbbd00cf1483feee')

# Bash Script for install retdec-decompiler
# mkdir decompiler 
# retdec-decompiler
# ./share/retdec/support/

build() 
{
    cd "$srcdir/baseer-$pkgver"

    # Patch bx_deElf.c to use /opt/baseer paths
    sed -i 's|#define RETDEC_DEFAULT_BIN .*|#define RETDEC_DEFAULT_BIN "/opt/baseer/decompiler/bin/retdec-decompiler"|' modules/bx_deElf/bx_deElf.c
    # sed -i 's|char in_path.*|char in_path[] = "/opt/baseer/tmp/baseer_input_XXXXXX";|'  modules/bx_deElf/bx_deElf.c
    # sed -i 's|char out_path.*|char out_path[] = "/opt/baseer/tmp/baseer_output_XXXXXX";|'  modules/bx_deElf/bx_deElf.c

    sed -i 's|char in_path.*|char in_path[] = "/tmp/baseer_input_XXXXXX";|'  modules/bx_deElf/bx_deElf.c
    sed -i 's|char out_path.*|char out_path[] = "/tmp/baseer_output_XXXXXX";|'  modules/bx_deElf/bx_deElf.c
    sed -i 's|"\[!\] retdec-decompiler exited with status %d\\n"|"\[!\] retdec-decompiler exited with status %d\\n[!] you need to install decompiler : \\nsudo /opt/baseer/install_decompiler.sh\\n"|' modules/bx_deElf/bx_deElf.c

    # Build Baseer
    make
}

package() 
{
    cd "$srcdir/baseer-$pkgver"

    # Install binaries
    install -Dm755 build/baseer "$pkgdir/opt/baseer/baseer"
    install -Dm755 /dev/stdin "$pkgdir/opt/baseer/install_decompiler.sh" <<'EOF'
#!/usr/bin/env bash
set -e

URL="https://github.com/thxa/baseer/releases/download/v0.2.0/decompiler.tar.xz"
FILE="decompiler.tar.xz"
DEST="/opt/baseer"

echo "[*] Downloading decompiler..."
curl -L --progress-bar -o "$FILE" "$URL"

echo "[*] Creating target directory..."
mkdir -p "$DEST"

echo "[*] Extracting..."
tar xf "$FILE" -C "$DEST"

echo "[*] Cleaning up..."
rm "$FILE"

echo "[+] Decompiler installed successfully!"
EOF

    # Create tmp directory for runtime files
    # install -dm777 "$pkgdir/opt/baseer/tmp"
    # Optional: copy license and README
    install -Dm643 LICENSE "$pkgdir/opt/baseer/LICENSE"
    install -Dm643 README.md "$pkgdir/opt/baseer/README.md"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/baseer/baseer "$pkgdir/usr/bin/baseer"
}

