pkgname=plandex-server
pkgver=2.2.1
pkgrel=2  # 增加版本修饰
pkgdesc="AI-driven development engine for complex tasks - Server component"
arch=('x86_64' 'aarch64')
url="https://github.com/plandex-ai/plandex"
license=('MIT')
depends=('glibc' 'uvicorn' 'litellm')
makedepends=('go')
# 关键：把本地的服务文件也当作源码的一部分包进来
source=("https://github.com/plandex-ai/plandex/archive/refs/tags/v${pkgver}.tar.gz"
        "plandex-server.service")
sha256sums=('0d9ed4265b31a9a017741cbf8d2c373099a2446588fe142a8649716f5858e4f9'
            'eb306316076e048479e7dd936c315b62ef456006adf45d11ee57e59c6c9fea1d')

prepare() {
  cd "plandex-server-v${pkgver}"
  mkdir -p gopath
  export GOPATH="${srcdir}/plandex-server-v${pkgver}/gopath"
}

build() {
  cd "plandex-server-v${pkgver}/app/server"
  export GOPATH="${srcdir}/plandex-server-v${pkgver}/gopath"
  export CGO_ENABLED=1
  go build -v -buildvcs=false -ldflags "-s -w" -o plandex-server .
}

package() {
  # 1. 安装主二进制文件
  install -Dm755 "plandex-server-v${pkgver}/app/server/plandex-server" "${pkgdir}/usr/bin/plandex-server"
  
  # 2. 建立一个共享目录，专门存放那个任性的 python 脚本
  install -Dm644 "plandex-server-v${pkgver}/app/server/litellm_proxy.py" "${pkgdir}/usr/share/plandex-server/litellm_proxy.py"
  
  # 3. 安装 Systemd 服务文件到系统标准路径
  install -Dm644 "${srcdir}/plandex-server.service" "${pkgdir}/usr/lib/systemd/system/plandex-server.service"
  
  # 4. 开源许可证
  if [ -f "plandex-server-v${pkgver}/LICENSE" ]; then
    install -Dm644 "plandex-server-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
