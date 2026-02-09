# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

_modname="nginx-module-vts"
pkgname=nginx-mod-vts
pkgver=0.2.5
pkgrel=3
pkgdesc="Nginx virtual host traffic status module"
arch=('x86_64')
makedepends=('nginx' 'nginx-src')
url="https://github.com/vozlt/nginx-module-vts"
license=('BSD-2-Clause')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vozlt/$_modname/archive/v$pkgver.tar.gz)
sha256sums=('cac326607e6166d9e4b03e3d3b29e520ed43bc86516aff1a946f7d326ca9e19b')

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
		--add-dynamic-module=../$_modname-$pkgver
	make modules
}

package() {
	if [[ "$BUILDTOOL" == devtools ]]; then
		local nginx_dep="nginx=$(nginx -v 2>&1 | sed 's|.*/||')"
		# this is added to PKGINFO data
		depends+=($nginx_dep)
	else
		# this is added to SRCINFO data
		depends+=(nginx)
	fi

  install -Dm0644 "$srcdir"/nginx-module-vts-$pkgver/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -dm0755 "$pkgdir"/etc/nginx/modules.d

  cd build/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    echo "load_module \"/usr/lib/nginx/modules/$mod\";" >> "$pkgdir/etc/nginx/modules.d/20-vts.conf"
  done
}
