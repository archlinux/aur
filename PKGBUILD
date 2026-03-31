# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-dms-niri-dotfiles-git
pkgver=r1.1234567
pkgrel=2
pkgdesc="dotfiles for Shorin DMS Niri"
arch=('any')
url="https://github.com/SHORiN-KiWATA/shorin-dms-niri"
license=('GPL')
depends=('bash' 'shorin-dms-niri-meta')
makedepends=('git')
source=("git+https://github.com/SHORiN-KiWATA/shorin-dms-niri.git"
        "shorindms")
sha256sums=('SKIP'
            'SKIP')

# 自动生成基于 Git 的版本号
pkgver() {
    cd "$srcdir/shorin-dms-niri"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/shorin-dms-niri"

    local target_dir="$pkgdir/usr/share/shorin-dms-niri-dotfiles"
    install -dm755 "$target_dir"
    if [[ -d "dotfiles" ]]; then
        cp -a dotfiles/. "$target_dir/"
    else
        echo "Error: 'dotfiles' directory not found in the git repository."
        exit 1
    fi

    # 2. 安装 Firefox 策略 (系统级)
    local pol_dir="$pkgdir/etc/firefox/policies"
    install -dm755 "$pol_dir"
    cat << 'EOF' > "$pol_dir/policies.json"
{
  "policies": {
    "Extensions": {
      "Install": [
        "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi",
        "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      ]
    }
  }
}
EOF
    chmod 644 "$pol_dir/policies.json"

    # 3. 安装 shorindms CLI 工具
    install -Dm755 "$srcdir/shorindms" "$pkgdir/usr/bin/shorindms"
}
