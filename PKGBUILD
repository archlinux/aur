# Maintainer: Donghui <duter2016@foxmail.com>
pkgname=gh-proxy-manager
pkgver=2.3.0
pkgrel=1
pkgdesc="管理 yay/makepkg 与 git clone 的 GitHub 下载加速代理（图形/命令行）"
arch=('any')
url="https://github.com/Duter2016/gh-proxy-manager"
license=('MIT')
depends=('bash' 'curl' 'git')
optdepends=('yad: 图形界面（推荐）'
            'zenity: 图形界面后备'
            'polkit: 提权支持')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('394e2da21b576ddec8b7030fc5a44e602c3724bd2ad52004f9218357f352eef4')

package() {
    _src="$srcdir/$pkgname-$pkgver"

    install -Dm755 "$_src/gh-proxy-manager"         "$pkgdir/usr/bin/gh-proxy-manager"
    install -Dm644 "$_src/gh-proxy-manager.desktop" "$pkgdir/usr/share/applications/gh-proxy-manager.desktop"

    # 卸载清理脚本：pacman -R 后手动执行一次，清掉运行时生成的文件
    install -Dm755 /dev/stdin "$pkgdir/var/lib/gh-proxy-manager/uninstall-cleanup.sh" <<'EOF'
#!/bin/sh
rm -f /etc/makepkg.conf.d/99-gh-proxy.conf /usr/local/bin/curl-gh /etc/gh-proxy/prefix /etc/gh-proxy/jsdelivr
rmdir /etc/gh-proxy 2>/dev/null || true
EOF

    install -Dm644 "$_src/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
