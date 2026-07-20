# Maintainer: coffee <coffee@coffeecat.top>
# 使用 uv 构建（自动从 PyPI 解析依赖，无需 AUR 依赖地狱）
# 所有额外功能需运行 add-extras 脚本选择性安装

pkgname=code-review-graph-bin
pkgver=2.3.7
pkgrel=4
pkgdesc="Local-first code intelligence graph for MCP and CLI — builds a persistent map of your codebase so AI coding tools read only what matters"
arch=('any')
url="https://code-review-graph.com"
license=('MIT')
depends=(
  'python>=3.10'
)
makedepends=('python-uv')
optdepends=('igraph: community detection' 'numpy: embedding vectors')
provides=('code-review-graph')
conflicts=('code-review-graph')
source=("code_review_graph-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/f3/8f/2df3fcca285b489d195706b09cefda3e57e7158185cb83905200d7b27199/code_review_graph-${pkgver}-py3-none-any.whl")
sha256sums=('12196dce3e673bdec7fba97ae5c4dff7589adee73a721374f62efae76e0fdd88')

package() {
  cd "$srcdir"

  # 1. 用 uv 创建隔离的 venv
  uv venv "$pkgdir/usr/lib/$pkgname/venv"

  # 2. 安装 wheel（核心 + 所有基础依赖，共 76 个包，自动从 PyPI 解析）
  uv pip install --python "$pkgdir/usr/lib/$pkgname/venv/bin/python" \
    "code_review_graph-${pkgver}-py3-none-any.whl"

  # 3. 创建 add-extras 脚本
  #    所有额外功能都通过此脚本选择安装，不逃逸包管理
  install -Dm755 /dev/stdin "$pkgdir/usr/lib/$pkgname/add-extras" <<'SCRIPT'
#!/bin/sh
# code-review-graph 额外功能安装脚本
# 用法: sudo /usr/lib/code-review-graph-bin/add-extras [all|communities|vectors|help]

VENV_PY="/usr/lib/code-review-graph-bin/venv/bin/python"

case "${1:-help}" in
  communities)
    echo "安装社区检测支持（igraph）..."
    uv pip install --python "$VENV_PY" "code-review-graph[communities]"
    echo "完成！"
    ;;
  vectors)
    echo "安装嵌入向量支持（numpy + sentence-transformers + torch ~2GB）..."
    uv pip install --python "$VENV_PY" numpy
    uv pip install --python "$VENV_PY" "code-review-graph[all]"
    echo "完成！"
    ;;
  all)
    echo "安装所有额外功能..."
    uv pip install --python "$VENV_PY" "code-review-graph[all]"
    echo "完成！"
    ;;
  *)
    echo "用法: $0 <feature>"
    echo ""
    echo "可用功能:"
    echo "  communities    社区检测支持（igraph，轻量 ~5MB）"
    echo "  vectors        嵌入向量支持（numpy + sentence-transformers，拖 torch ~2GB）"
    echo "  all           全部安装"
    exit 1
    ;;
esac
SCRIPT

  # 4. 修正 shebang
  find "$pkgdir/usr/lib/$pkgname/venv/bin" -type f -executable \
    -exec sed -i "1s|^#!${pkgdir}|#!|" {} +

  # 5. 清理
  rm -rf "$pkgdir/usr/lib/$pkgname/venv/.cache"
  find "$pkgdir/usr/lib/$pkgname" -name 'direct_url.json' -exec rm -f {} +
  find "$pkgdir/usr/lib/$pkgname/venv/bin" -name 'activate*' -type f \
    -exec sed -i "s|${pkgdir}||g" {} +

  # 6. /usr/bin 软链接
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$pkgname/venv/bin/code-review-graph" \
    "$pkgdir/usr/bin/code-review-graph"
  ln -sf "/usr/lib/$pkgname/venv/bin/crg-daemon" \
    "$pkgdir/usr/bin/crg-daemon"
}
