pkgname=tchmaterial-parser
pkgver=3.0
pkgrel=2
maintainer=('iamzhz' 'wuziqian211')
pkgdesc="国家中小学智慧教育平台 电子课本下载工具，帮助您从智慧教育平台中获取电子课本的 PDF 文件网址并进行下载，让您更方便地获取课本内容。 "
arch=('x86_64')
url="https://github.com/happycola233/tchMaterial-parser"
license=('MIT')
depends=('python' 'tk' 'python-psutil' 'python-requests' 'python-pyperclip' 'desktop-file-utils')
makedepends=('python-setuptools')
source=(
        "v$pkgver.tar.gz::https://github.com/happycola233/tchMaterial-parser/archive/refs/tags/v$pkgver.tar.gz"
        "tchMaterial-parser.desktop"
        "setup.py"
)
sha256sums=(
        'a3940c03f5a80732c49b42f0b2a764b0fb098bcc490936540f03781ddbab5f63'
        'SKIP'
        'SKIP'
)

build() {
  cd "tchMaterial-parser-$pkgver"
  cp ../../setup.py .
  cp ../../*.desktop .
  mv src/tchMaterial-parser.pyw src/main.py
  touch src/__init__.py
  python setup.py build

}

package() {
  cd "tchMaterial-parser-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  #sudo chmod +x /usr/bin/tchMaterial-parser

  # 手动安装额外文件
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 tchMaterial-parser.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 src/favicon_223x223.png "$pkgdir/usr/share/pixmaps/tchMaterial-parser.png"

  # 强制设置可执行权限
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
}
