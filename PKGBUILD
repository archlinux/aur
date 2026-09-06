# Maintainer: suiyuan <adesince@163.com>
#
# 雷神加速器 (Leigod) 官方 SteamDeck 插件在普通 x86_64 Linux 上的移植:
# 将闭源官方二进制置于 bwrap 伪造的 SteamDeck 文件系统/进程视图中运行,
# 网络与主机共享(非隔离), 插件会以 root 修改主机路由表与 iptables 规则。

pkgname=leigod-steamdeck-plugin
pkgver=1.2.2.15
pkgrel=2
pkgdesc="Leigod accelerator SteamDeck plugin on generic Linux via bwrap SteamDeck emulation"
arch=('x86_64')
url="https://www.leigod.com"
license=('custom:proprietary')
depends=('bubblewrap' 'curl' 'iproute2' 'iptables' 'ipset' 'sslh')
install='leigod-plugin.install'
options=('!strip' '!debug')
backup=('etc/leigod/bwrap.conf' 'etc/leigod/sslh-guard.cfg' 'etc/leigod/device.conf')

# 官方文件下载源(构建期) —— 双通道可配, 环境变量优先于配置文件, 均缺省用官方 IP:
#   1) 环境变量: LEIGOD_MIRROR=http://<镜像>/ makepkg
#   2) 配置文件: /etc/leigod/mirror.conf(第一行写镜像 URL, 见 mirror.conf.example)
# 更换镜像后必须同步更新 sha256sums 的前 3 项(远程文件); 本地文件哈希与镜像无关。
# 注: makepkg 的本地源文件必须平铺在本目录(解析时按 basename 查找), 故不做子目录分类。
_mirror="${LEIGOD_MIRROR:-}"
if [ -z "$_mirror" ] && [ -r /etc/leigod/mirror.conf ]; then
    _mirror=$(head -n1 /etc/leigod/mirror.conf 2>/dev/null | tr -d '[:space:]')
fi
_base="${_mirror:-http://119.3.40.126}"

source=(
    "$_base/acc-gw.router.amd64"
    "$_base/ipdatacloud_country.xdb"
    "$_base/steamdeck_acc_monitor.sh"
    'bwrap.conf'
    'leigod.service'
    'accelerator.ini'
    'acc_version.ini'
    'fake_product_name'
    'fake_os_release'
    'fake_version'
    'ensure-wlan0.sh'
    'run.sh'
    'sslh-guard.cfg'
    'device.conf'
    'mirror.conf.example'
)
sha256sums=(
    '8e0adbd1b1ce0d37e6588ff222408fed66a3f8954fee27bc37a10e0bf6806d4d'
    '3536000ee9eb3997538cb37a14f90d571979734c48b23b8d548eceac16666273'
    '5b0b4948d870adc608c0a674ec4997dc1db650fe65e36548744bcfa63336440e'
    'a23979f4e5a33c7c5a3826d1257e739b54ae89f282d0897829d5ac609acd2789'
    'ecc1142fcab87a6f8b1470d25b158ee0a02d9ccad1a4832ccf80e57c795288c7'
    '417a0a88af9989770a351da4727fe7df5b1265e4cc8c3a5ba2b4ab35750783d4'
    '3cab558f1791dd2b347bccd81e619c97664d2a4bfe79a72c34938676a5168c4d'
    'ee5b87871d52e6f5852c09b59110183346579a47a474c57a6a67fb55210d8580'
    'd20c01fa15205e8e2f8f2d937d87871d367ecb62423de141d07daed2ea3b9a9c'
    'fe9de708249b35ffe1c4f97dbede7278d5ded8c64ff512e82d024c6228aaa9ee'
    '2021df0d9b12323915633e3a72f0cd2a8ec55f9f81892f82eb11ad261d5d490d'
    '4abdfb02e5191ddcb7791f4f6e6ea2c8b0e6bfb3ca874339714b7cf6268a9d08'
    '26426ed86918ab11635f1ad15c19f3514661c74b1c73dcd9196e768162514f63'
    'f6f224c4b5a45154ccf900bd18250013ae55c7f58bddb66f72c42f51b49ee4c0'
    '32e08c7e86519b470c1e7043a4ba613136534faae8b19937d0376046f7543105'
)

prepare() {
    # 将 web 进程监听端口后移到 5589: 5588 让给 sslh 门前过滤(run.sh 内拉起)。
    # 背景: 官方 web 进程基于 WebSocket++ 0.8.2, 收到未升级握手的普通 HTTP 会
    # SIGABRT 崩溃, 详见 https://github.com/Husky0c/leigod-plugin-linux/issues/5
    sed -i 's/-p 5588/-p 5589/g' "$srcdir/steamdeck_acc_monitor.sh"
    grep -q -- '-p 5589' "$srcdir/steamdeck_acc_monitor.sh" || {
        echo 'error: patch steamdeck_acc_monitor.sh (-p 5589) failed' >&2
        return 1
    }
}

package() {
    # 主程序与升级监视器(官方为同一文件的两份拷贝)
    install -Dm755 "$srcdir/acc-gw.router.amd64" "$pkgdir/opt/leigod/acc-gw.router.amd64"
    install -Dm755 "$srcdir/acc-gw.router.amd64" "$pkgdir/opt/leigod/acc_upgrade_monitor"

    # IP 地理库与配置(路径对齐官方 install_binary 的 steamdeck 分支: config/ 子目录)
    install -Dm644 "$srcdir/ipdatacloud_country.xdb" "$pkgdir/opt/leigod/config/ipdatacloud_country.xdb"
    install -Dm644 "$srcdir/accelerator.ini" "$pkgdir/opt/leigod/config/accelerator.ini"
    install -Dm644 "$srcdir/acc_version.ini" "$pkgdir/opt/leigod/config/acc_version.ini"

    # 官方进程守护脚本(prepare() 已补丁端口)
    install -Dm755 "$srcdir/steamdeck_acc_monitor.sh" "$pkgdir/opt/leigod/steamdeck_acc_monitor.sh"

    # SteamDeck 伪装文件(DMI product_name=Jupiter / os-release=SteamOS / /etc/version)
    install -Dm644 "$srcdir/fake_product_name" "$pkgdir/opt/leigod/fake_product_name"
    install -Dm644 "$srcdir/fake_os_release" "$pkgdir/opt/leigod/fake_os_release"
    install -Dm644 "$srcdir/fake_version" "$pkgdir/opt/leigod/fake_version"

    # 用户可编辑配置(pacman 升级保留, 见 backup=)
    install -Dm644 "$srcdir/bwrap.conf" "$pkgdir/etc/leigod/bwrap.conf"
    install -Dm644 "$srcdir/sslh-guard.cfg" "$pkgdir/etc/leigod/sslh-guard.cfg"
    install -Dm644 "$srcdir/device.conf" "$pkgdir/etc/leigod/device.conf"

    # 辅助脚本与 systemd 单元
    install -Dm755 "$srcdir/ensure-wlan0.sh" "$pkgdir/usr/lib/leigod/ensure-wlan0.sh"
    install -Dm755 "$srcdir/run.sh" "$pkgdir/usr/lib/leigod/run.sh"
    install -Dm644 "$srcdir/leigod.service" "$pkgdir/usr/lib/systemd/system/leigod.service"
    install -Dm644 "$srcdir/mirror.conf.example" "$pkgdir/usr/share/leigod/mirror.conf.example"

    # 官方 plugin_uninstall.sh 会 `iptables -t mangle -F` 清空整张 mangle 表,
    # 故不随包携带官方安装/卸载脚本; 配置由本AUR直接布放, 运行仅调用官方守护脚本。
}
