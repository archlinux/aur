# Maintainer: zmr233 <zmr_233@outlook.com>
# Upstream: Anki Team <https://github.com/ankitects/anki>

# 本文件由 prepare.py 从 pre-PKGBUILD 生成，不要直接编辑。
#
# anki-plus 是 Anki 的特化发行版，源码在 https://github.com/zmr-233/anki-dev
# 当前包含的改动：
#   * 调度时区与设备 OS 时区解耦（collection config `schedTimezone`，IANA 名，
#     按被调度的时刻分别求偏移，因此 DST 正确）
#   * 日界支持分钟精度（collection config `rolloverMinute`）
#   两者都是普通 config，AnkiWeb 当作不透明 JSON 原样往返，不触发全量同步。
#
# 预编译包：wheel 由 https://github.com/zmr-233/anki-workspace 的 tag 触发 CI 产出。
# `_rsbridge.so` 是 pyo3 abi3（cp310-abi3）扩展，sqlite / zstd 静态链入、TLS 走
# rustls，因此只依赖 glibc + libgcc，不随 Arch 的 python / sqlite / openssl 升级而失效。

_pkgname=anki
pkgname=anki-plus-bin
pkgver=26.05.2
pkgrel=1

# 本包对应的确切源码（AGPL 要求可指回，写仓库名不够）：
#   git clone https://github.com/zmr-233/anki-dev && git checkout baf44f63312a3bf6eac28ea5572449ad45e8d9cf
_srcref=baf44f63312a3bf6eac28ea5572449ad45e8d9cf

# 上游 .version，用于 provides 的版本号
_ankiver=26.05
# PEP 440 归一化之后的版本，决定 wheel 的文件名（26.05 → 26.5）
_wheelver=26.5

pkgdesc="Anki with a pinned scheduling timezone and minute-level day rollover (prebuilt)"
arch=('x86_64')
url="https://github.com/zmr-233/anki-dev"
license=('AGPL-3.0-or-later')

provides=("$_pkgname=$_ankiver")
conflicts=("$_pkgname" 'anki-git' 'anki-snapshot')

# 运行时依赖对齐 pylib/pyproject.toml + qt/pyproject.toml。
# 与 extra/anki 的差异：
#   + python-truststore / python-packaging / python-typing_extensions / python-asgiref
#     （26.05 之后新增或此前漏掉的，flask[async] 的 extra 需要 asgiref）
#   - python-flask-cors（上游已不再引用，全树 grep 无命中）
#   - sqlite / zstd（本包静态链入，见文件头）
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-asgiref'
  'python-beautifulsoup4'
  'python-decorator'
  'python-distro'
  'python-flask'
  'python-jsonschema'
  'python-markdown'
  'python-orjson'
  'python-packaging'
  'python-protobuf'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-pysocks'
  'python-requests'
  'python-send2trash'
  'python-truststore'
  'python-typing_extensions'
  'python-urllib3' # anki/httpclient.py 直接 import，不只是 requests 的传递依赖
  'python-waitress'
  'qt6-multimedia' # 录音插件，运行时加载
  'qt6-svg'        # SVG 图标插件，运行时加载
)

makedepends=('python-installer')

optdepends=(
  'lame: record sound'
  'mpv: play sound. prefered over mplayer'
  'mplayer: play sound'
  'texlive-most: render LaTex in cards'
)

# 预编译包不做 debug 分包：tarball 里没有源码，makepkg 生成的 -debug 包会指向不存在的路径
options=('!debug')

# 产物挂在 workspace 仓库的 release 上：只有它同时看得见 anki / 后端 / AnkiDroid
# 三条构建链，一个 tag 才能代表一次完整的发行
_releases="https://github.com/zmr-233/anki-workspace/releases/download"
_tarball="$pkgname-$pkgver-$CARCH.tar.zst"
source_x86_64=("$_tarball::$_releases/v$pkgver/$_tarball")
sha256sums_x86_64=('3a27eb64e51dd3596d08ae9eb863a8c5afc00604518b25ebc14b219d122b36f6')

package() {
  cd "$srcdir/$pkgname-$pkgver-$CARCH"

  # anki-<wheelver>-cp310-abi3-manylinux_2_35_x86_64.whl（含 _rsbridge.so）
  # aqt-<wheelver>-py3-none-any.whl（纯 Python）
  # installer 按构建机的 python 决定 site-packages 路径，所以不写死 python3.x
  for _whl in wheels/*.whl; do
    python -m installer --destdir="$pkgdir" "$_whl"
  done

  install -vDm644 -t "$pkgdir/usr/share/applications" share/anki.desktop
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" share/anki.png share/anki.xpm
  install -vDm644 -t "$pkgdir/usr/share/man/man1" share/anki.1
  install -vDm644 -t "$pkgdir/usr/share/mime/packages" share/anki.xml
}
