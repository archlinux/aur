# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: LiPu-jpg (original author) <https://github.com/LiPu-jpg>

pkgname=openwrite
pkgver=5.8.0
_commit=20500493c10a211fdf2560e69558da1c39eab3b4
pkgrel=1
pkgdesc="OpenWrite 长篇小说创作引擎 — AI 辅助小说创作，对话式引导、四级大纲、风格合成与 Studio 工作台"
arch=('any')
url="https://github.com/LiPu-jpg/Openwrite"
license=('Apache-2.0')
depends=('python>=3.10')
makedepends=()
optdepends=('git: launcher 源码自动更新')
install="${pkgname}.install"

# 上游未打 tag，固定到 main 分支最新提交
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('aef5b57bd8f3795fef422dd14bdac906a58a5909c5cc8e9ac168514502bafbc3')

prepare() {
    cd "Openwrite-${_commit}"
}

package() {
    cd "Openwrite-${_commit}"

    # 源码整体安装到 /opt/openwrite，由 openwrite-launcher 首次运行时
    # 自行在 ~/.openwrite-runtime 创建隔离 Python 环境并安装依赖
    install -d "${pkgdir}/opt"
    cp -a --no-preserve=ownership . "${pkgdir}/opt/${pkgname}"
    rm -rf "${pkgdir}/opt/${pkgname}/"{.git,.github,live_tests,assets/screenshots}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 assets/logo-light.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openwrite" <<EOF
#!/bin/sh
export PYTHONPATH="/opt/${pkgname}"
exec python3 -c 'import sys; from tools.cli import main; sys.exit(main())' "\$@"
EOF
    cat > "${pkgdir}/usr/bin/openwrite-launcher" <<EOF
#!/bin/sh
export PYTHONPATH="/opt/${pkgname}"
exec python3 -c 'import sys; from tools.desktop_launcher import main; sys.exit(main())' "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openwrite" "${pkgdir}/usr/bin/openwrite-launcher"
}
