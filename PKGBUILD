pkgname=ww-manager
pkgver=2.1.8
pkgrel=1
pkgdesc="ww-manager (A Wuthering Waves CLI Manager)"
arch=('any')
url="https://github.com/timetetng/wutheringwaves-cli-manager"
license=('MIT')
depends=(
  'python'
  'python-typer'
  'python-rich'
  'python-certifi'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timetetng/wutheringwaves-cli-manager/archive/refs/tags/v2.1.8.tar.gz")
sha256sums=('23e5eb339390261f0931350b1b356902f89fcb5c3ac3c0326eeb5b3df1ee5cff')

build() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"

  # 1. 安装 Python 包到临时打包目录
  python -m installer --destdir="$pkgdir" dist/*.whl

  # 2. 安装 License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 3. 动态获取当前 Arch 系统的 Python 版本号 (例如 3.12 或 3.13)
  local py_ver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  local site_pkgs="$pkgdir/usr/lib/python${py_ver}/site-packages"

  # 4. 创建系统级补全脚本目录
  install -dm755 "$pkgdir/usr/share/zsh/site-functions"
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"

  # 5. 生成补全脚本
  # 关键点：必须设定 PYTHONPATH 指向刚装好的  目录，否则 metadata.version() 会报错崩溃
  # 关键点：使用 Typer 官方的 --show-completion 参数，不再使用底层环境变量
  PYTHONPATH="$site_pkgs" "$pkgdir/usr/bin/ww" --show-completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ww"
  PYTHONPATH="$site_pkgs" "$pkgdir/usr/bin/ww" --show-completion bash > "$pkgdir/usr/share/bash-completion/completions/ww"
  PYTHONPATH="$site_pkgs" "$pkgdir/usr/bin/ww" --show-completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/ww.fish"
}
