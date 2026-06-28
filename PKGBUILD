# Maintainer: TNT_TS <tnt_ts@qq.com>

pkgname=nginx-mod-http-flv
pkgver=1.2.13
pkgrel=1

_modname="${pkgname#nginx-mod-}"

pkgdesc="A media streaming server based on nginx-rtmp-module"
arch=('x86_64' 'aarch64')
makedepends=('nginx' 'nginx-src')
url="https://github.com/winshining/nginx-http-flv-module"
license=('BSD-2-Clause')
depends=('glibc' 'nginx')
provides=('nginx-http-flv-module')
conflicts=('nginx-http-flv-module')

source=("${_modname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
  cd build
  ln -sf /usr/src/nginx/auto
  ln -sf /usr/src/nginx/src
}

build() {
  cd build
  auto/configure \
    --with-ld-opt="$LDFLAGS" \
    --with-compat \
    --add-dynamic-module=../$_modname
  make modules
}

package() {
  # 安装许可证
  install -Dm644 "$srcdir/$_modname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 安装模块
  cd build/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
  done

  # 可选：生成加载配置
  install -dm0755 "$pkgdir/etc/nginx/modules.d"
  echo 'load_module "/usr/lib/nginx/modules/ngx_http_flv_live_module.so";' \
    >"$pkgdir/etc/nginx/modules.d/20-http-flv.conf"
}
