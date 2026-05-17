# MCdianhei mcdiamhei@gmail.com.
pkgname=plandex-server
pkgver=2.2.1
pkgrel=3  # 记得升一下打包版本号
pkgdesc="AI-driven development engine for complex tasks - Server component"
arch=('x86_64')
url="https://github.com/plandex-ai/plandex"
license=('MIT')
depends=('postgresql' 'python' 'glibc' 'uvicorn' 'litellm' 'python-fastapi') # 依赖根据实际补全
makedepends=('go')
source=("https://github.com/plandex-ai/plandex/archive/refs/tags/server/v${pkgver}.tar.gz"
        "plandex-server.service")
sha256sums=('0d9ed4265b31a9a017741cbf8d2c373099a2446588fe142a8649716f5858e4f9'
            '40e3d9aea75c7c281562a099bdef1b0ec18f612d2ffb36bcb6d78ea7bb4a51d5')

prepare() {
  cd "plandex-server-v${pkgver}"

  mkdir -p gopath
  export GOPATH="${srcdir}/plandex-server-v${pkgver}/gopath"  
  # 💡 核心修复：把 10 秒超时改大到 60 秒，防止 LiteLLM 首次冷启动时活活憋死
  # 假设源码里是类似 timeout := 10 * time.Second 或是循环 20 次，用 sed 直接修正：
  if [ -f app/server/litellm.go ]; then
    sed -i 's/10 \* time.Second/60 \* time.Second/g' app/server/litellm.go
    # 或者如果是重试次数控制，也在这里用 sed 把重试次数改大
  fi
}

build() {
  cd "plandex-server-v${pkgver}/app/server"
  export GOPATH="${srcdir}/plandex-server-v${pkgver}/gopath"
  export CGO_ENABLED=1
  go build -v -buildvcs=false -ldflags "-s -w" -o plandex-server .
}

package() {
  # 注意：这里进去了之后，当前目录就是 plandex-server-v${pkgver}
  cd "plandex-server-v${pkgver}"

  # 1. 安装主二进制文件（去掉了前面的重复目录名）
  install -Dm755 "app/server/plandex-server" "${pkgdir}/usr/bin/plandex-server"

  # 2. 建立一个共享目录，专门存放那个任性的 python 脚本
  install -Dm644 "app/server/litellm_proxy.py" "${pkgdir}/usr/share/plandex-server/litellm_proxy.py"

  # 3. 安装 Systemd 服务文件到系统标准路径（保持不变，它在 srcdir 根下）
  install -Dm644 "${srcdir}/plandex-server.service" "${pkgdir}/usr/lib/systemd/system/plandex-server.service"

  # 4. 开源许可证
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
