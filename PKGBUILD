# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_vod"

pkgname=nginx-mainline-mod-vod-git
pkgver=r1370.fbb8982
pkgrel=1
pkgdesc="NGINX-based MP4 Repackager"
arch=('i686' 'x86_64')
depends=(
  'nginx-mainline'
  'ffmpeg'
  'openssl'
)
optdepends=(
  'ffmpeg-libfdk_aac: audio filtering support'
  'libiconv: DFXP captions support'
  'libxml2: UTF-16 encoded SRT files support'
)
makedepends=('git' 'nginx-mainline-src')
provides=('nginx-mainline-mod-vod')
conflicts=('nginx-mainline-mod-vod')
url="https://github.com/kaltura/nginx-vod-module"
license=('CUSTOM')
source=("$_modname::git+https://github.com/kaltura/nginx-vod-module.git")
validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)
sha256sums=('SKIP')

pkgver() {
  cd "$_modname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r /usr/src/nginx .

	cd "$srcdir"/$_modname
	sed 's@/usr/local@/usr@' -i config
}

build() {
  cd "$srcdir"/nginx
 
  ./configure --with-compat --add-dynamic-module=../$_modname \
    --with-file-aio \
    --with-threads \
    --with-cc-opt="-O3"
 
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_modname/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
