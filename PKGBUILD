# Maintainer: spiriwind
pkgname=bootstrap-devuan
pkgver=1.0.0
pkgrel=1
pkgdesc="Devuan debootstrap scripts and keyring"
arch=('any')
license=('MIT')
depends=('debootstrap' 'gnupg' 'curl')
conflicts=()
replaces=()
backup=()
source=()
sha256sums=()

package() {
    # 1. 下载安装 Devuan keyring
    local tmpdir="$srcdir/keyring"
    mkdir -p "$tmpdir"
    cd "$tmpdir"
    
    for ver in 2026.01.13 2025.08.09 2023.05.28 2022.09.04; do
        if curl -fsSL "https://pkgmaster.devuan.org/devuan/pool/main/d/devuan-keyring/devuan-keyring_${ver}_all.deb" -o devuan-keyring.deb 2>/dev/null; then
            ar x devuan-keyring.deb
            tar -xf data.tar.xz
            break
        fi
    done
    
    # 安装 keyring 到 /usr/share/keyrings
    install -d "$pkgdir/usr/share/keyrings"
    
    for f in $(find . -type f \( -name "*.pgp" -o -name "*.gpg" -o -name "*.asc" \) 2>/dev/null); do
        name=$(basename "$f")
        install -Dm644 "$f" "$pkgdir/usr/share/keyrings/$name"
    done
    
    # 2. 安装 debootstrap 脚本 (只安装 debootstrap 没有的)
    install -d "$pkgdir/usr/share/debootstrap/scripts"
    
    for suite in excalibur daedalus chimaera; do
        cat > "$pkgdir/usr/share/debootstrap/scripts/$suite" << 'EOF'
mirror_style release
download_style apt
finddebs_style from-indices
variants - buildd fakechroot minbase
keyring /usr/share/keyrings/devuan-archive-keyring.pgp
if [ -e "$DEBOOTSTRAP_DIR/scripts/debian-common" ]; then
  . "$DEBOOTSTRAP_DIR/scripts/debian-common"
elif [ -e /debootstrap/debian-common ]; then
  . /debootstrap/debian-common
elif [ -e "$DEBOOTSTRAP_DIR/debian-common" ]; then
  . "$DEBOOTSTRAP_DIR/debian-common"
else
  error 1 NOCOMMON "File not found: debian-common"
fi
EOF
    done
}
