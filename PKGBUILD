# Maintainer: chuanshanjia <1845776552@qq.com>
#
# 上游仓库里同时有 Zotero 插件（.xpi）和服务端（server/），本包只安装服务端。
# 插件请在 Zotero 里安装上游发布页的 xpi。
#
# 说明：服务端把 config/、translated/ 和 uv 创建的翻译环境都写在自己源码目录下，
# 而 /usr/lib 是只读的，所以启动时用 runtime-sync 把代码同步到可写的
# /var/lib/zotero-pdf2zh/app 再运行（详见 runtime-sync 里的注释）。
#
# 服务端本身用系统 Python 运行，依赖全部来自 Arch 仓库；uv 只负责在首次翻译时
# 按需创建 pdf2zh/pdf2zh_next 翻译环境。早先用 `uv run --with-requirements` 启动
# 服务端时，每次开机都要联网解析并下载 PyPI 依赖（PyMuPDF 2.x 还会带上
# numpy/onnxruntime 等，上百 MB），PyPI 不可达时服务直接启动失败并进入重启循环，
# 所以这里改成系统 Python。

pkgname=zotero-pdf2zh
pkgver=4.1.8
pkgrel=2
pkgdesc='Local translation server for the Zotero PDF2zh plugin (pdf2zh / pdf2zh_next)'
arch=('any')
url='https://github.com/guaguastandup/zotero-pdf2zh'
license=('AGPL-3.0-or-later')
# 服务端自身需要这些系统 Python 库（上游 server/requirements.txt 里列的那几个）；
# uv 只在首次翻译时用来创建 pdf2zh/pdf2zh_next 环境。
depends=('python'
         'python-flask' 'python-toml' 'python-pypdf' 'python-pymupdf' 'python-packaging'
         'uv' 'rsync' 'util-linux')
optdepends=('conda: 改用 conda 而不是 uv 创建翻译环境')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/guaguastandup/zotero-pdf2zh/archive/refs/tags/v$pkgver.tar.gz"
        'zotero-pdf2zh'
        'zotero-pdf2zh.service'
        'zotero-pdf2zh.sysusers'
        'zotero-pdf2zh.tmpfiles'
        'runtime-sync')
sha256sums=('893fb159fb1144b8422fcbc4cbc6567c297b3492aced9bfd42522da623d8ef97'
            '5f09e8c5f637278a1f5953bac519cff4614e1c994132bbeb3668de83f85ae924'
            '6e54c4833b0af59ec9d5aeaa54bcfd735d99e1402c98d3f46f85a1f6b279f179'
            '8e7c4f78c646faa853089c36af1d3b3c7c2e47b31c31b6f8ea211045f62bc69f'
            '1e244726ae9f6f3aa64c286de5b1a77b824d5a54e76c330597aaf44daace5d3d'
            'e700543cd37c598cc717f620b726767d7f8ad416ca8ba7636348495829f0e151')

_appdir=/usr/lib/$pkgname

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# systemd 启动时 stdout 不是终端；而 server.py 会无条件联网拉取仓库通知
	# （notice.json，gitee/github 两个源各 8 秒超时，实测开机启动因此多等 20 秒）。
	# 仓库通知对后台服务没有意义，这里只在交互式运行时保留，避免服务启动被网络拖住。
	sed -i \
		's|^\([[:space:]]*\)fetch_and_show_notices(__version__, args\.update_source)$|\1if sys.stdout.isatty():\n\1    fetch_and_show_notices(__version__, args.update_source)|' \
		server/server.py
	if ! grep -q '^[[:space:]]*if sys.stdout.isatty():$' server/server.py; then
		printf 'error: server.py 的启动流程已变化，prepare() 中的通知补丁需要更新\n' >&2
		return 1
	fi
}

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
