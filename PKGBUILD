# Maintainer: terrason <jterraghost@gmail.com>
pkgname=living-drive-tonic
pkgver=0.1.0.alpha.4
pkgrel=1
pkgdesc="Protect your portable Linux (living) drive by detecting frequent write directories and redirecting them to the host's internal disk — extending SSD lifespan."
arch=('x86_64')
url="https://github.com/terrason/living-drive-tonic"
license=('MIT')
install="$pkgname.install"
depends=('bun' 'fatrace-minimal')
optdepends=('bash-completion: 为 ldt 命令启用 Tab 键自动补全')
source=("package.tgz")
sha256sums=('f36d403fc48781f79daecad2028a28805dd0c7d419cb85d9dc231cc1945882c2')

package() {
    # 主命令
    install -Dm755 "$srcdir/package/dist/cli.js" "$pkgdir/usr/bin/ldt"

    # bash complete 内部脚本
    install -Dm755 "$srcdir/package/dist/bash-complete.js" \
        "$pkgdir/usr/lib/$pkgname/__ldt_bash_complete"

    # bash completion 文件 (替换占位符)
    sed "s/@PKGNAME@/${pkgname}/g" "$srcdir/package/share/ldt.completion" | \
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ldt"

    # systemd 服务
    sed "s/@PKGNAME@/${pkgname}/g" "$srcdir/package/share/$pkgname.service" | \
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/package/share/$pkgname-fatrace.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname-fatrace.service"
    install -Dm644 "$srcdir/package/share/$pkgname-fatrace.socket" \
        "$pkgdir/usr/lib/systemd/system/$pkgname-fatrace.socket"

    # sysusers 配置
    install -Dm644 "$srcdir/package/share/$pkgname.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # 许可证
    install -Dm644 "$srcdir/package/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
