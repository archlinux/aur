# Maintainer: chuanshanjia <1845776552@qq.com>
#
# 上游仓库里同时有 Zotero 插件（.xpi）和服务端（server/），本包只安装服务端。
# 插件请在 Zotero 里安装上游发布页的 xpi。
#
# 说明：服务端把 config/、translated/ 和 uv 创建的翻译环境都写在自己源码目录下，
# 而 /usr/lib 是只读的，所以启动时用 runtime-sync 把代码同步到可写的
# /var/lib/zotero-pdf2zh/app 再运行（详见 runtime-sync 里的注释）。

pkgname=zotero-pdf2zh
pkgver=4.1.7
pkgrel=1
pkgdesc='Local translation server for the Zotero PDF2zh plugin (pdf2zh / pdf2zh_next)'
arch=('any')
url='https://github.com/guaguastandup/zotero-pdf2zh'
license=('AGPL-3.0-or-later')
# 服务端本身跑在 uv 托管的 Python 3.12 环境里（见 unit 里的 uv run），
# 不依赖系统 Python 的那些库，所以这里不列 python-flask 之类的依赖。
depends=('uv' 'rsync' 'util-linux')
optdepends=('conda: 改用 conda 而不是 uv 创建翻译环境')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/guaguastandup/zotero-pdf2zh/archive/refs/tags/v$pkgver.tar.gz"
        'zotero-pdf2zh'
        'zotero-pdf2zh.service'
        'zotero-pdf2zh.sysusers'
        'zotero-pdf2zh.tmpfiles'
        'runtime-sync')
sha256sums=('251af9cbf8fb4868f7db6277bee17889f048d941d66f8250466524cc1e995b6f'
            '999069cd75912175337876386f19c7e76018af583016751f8f1b32111e6051c8'
            '9fd26ede77a329564c28d4e195bac0089a3b968c7dd0472ed660e6a92613d1aa'
            '8e7c4f78c646faa853089c36af1d3b3c7c2e47b31c31b6f8ea211045f62bc69f'
            '1e244726ae9f6f3aa64c286de5b1a77b824d5a54e76c330597aaf44daace5d3d'
            'e700543cd37c598cc717f620b726767d7f8ad416ca8ba7636348495829f0e151')

_appdir=/usr/lib/$pkgname

package() {
	install -d "$pkgdir$_appdir"

	# 只安装服务端那部分代码
	cp -a "$srcdir/$pkgname-$pkgver/server/." "$pkgdir$_appdir/"

	# 开发文件、示例文档和用户数据不进包
	rm -rf "$pkgdir$_appdir"/{tests,warmup,translated,zotero-pdf2zh-venv,zotero-pdf2zh-next-venv}
	rm -f "$pkgdir$_appdir"/README-*.pdf
	rm -f "$pkgdir$_appdir"/config/{config.json,config.toml,venv.json,package_update_state.json}
	find "$pkgdir$_appdir" \( -name '.DS_Store' -o -name '__pycache__' \) -exec rm -rf {} +

	install -Dm755 "$srcdir/runtime-sync" "$pkgdir$_appdir/runtime-sync"
	install -Dm755 "$srcdir/zotero-pdf2zh" "$pkgdir/usr/bin/zotero-pdf2zh"
	install -Dm644 "$srcdir/zotero-pdf2zh.service" "$pkgdir/usr/lib/systemd/system/zotero-pdf2zh.service"
	install -Dm644 "$srcdir/zotero-pdf2zh.sysusers" "$pkgdir/usr/lib/sysusers.d/zotero-pdf2zh.conf"
	install -Dm644 "$srcdir/zotero-pdf2zh.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/zotero-pdf2zh.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
