pkgname=plandex-server
pkgver=2.2.1 # 请根据 GitHub Release 的最新版本修改
pkgrel=1
pkgdesc="AI-driven development engine for complex tasks - Server component"
arch=('x86_64' 'aarch64')
url="https://github.com/plandex-ai/plandex"
license=('MIT') 
depends=('glibc' 'uvicorn' 'litellm')
makedepends=('go') # 关键：编译需要 Go 环境
source=("https://github.com/plandex-ai/plandex/archive/refs/tags/server/v${pkgver}.tar.gz")
sha256sums=('0d9ed4265b31a9a017741cbf8d2c373099a2446588fe142a8649716f5858e4f9')

prepare() {
  cd "plandex-server-v${pkgver}"
  # Go 编译缓存目录设置
  mkdir -p gopath
  export GOPATH="${srcdir}/plandex-${pkgver}/gopath"
}

build() {
  cd "plandex-server-v${pkgver}"
  # 核心：进入 server 源码目录进行编译
  cd app/server 
  
  export GOPATH="${srcdir}/plandex-server-v${pkgver}/gopath"
  export CGO_ENABLED=1 # 通常 Go 工具链推荐关闭 CGO 以获得纯静态二进制
  
  # 编译命令：-o 指定输出文件名
  go build -v -ldflags "-s -w" -o plandex-server .
  #no git check
  go build -v -buildvcs=false -ldflags "-s -w" -o plandex-server .
}

package() {
  cd "plandex-server-v${pkgver}/app/server"
  
  # 将编译好的二进制文件安装到系统路径
  install -Dm755 plandex-server "${pkgdir}/usr/bin/plandex-server"

  #  关键：把这个该死的 python 脚本也一起复制到 /usr/bin/ 下
  # 这样当程序在后台调用 uvicorn 时，就能在同级路径或通过定位找到它
  if [ -f litellm_proxy.py ]; then
    install -Dm644 litellm_proxy.py "${pkgdir}/usr/bin/litellm_proxy.py"
  fi
  
  # 如果有开源许可证文件，顺便带上（假设在项目根目录）
  cd ../..
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
