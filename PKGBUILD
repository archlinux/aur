# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=ssowat-git
pkgver=master
pkgrel=1
pkgdesc="A simple SSO for nginx, written in Lua"
arch=('any')
url="https://github.com/tYYGH/SSOwat"
license=('AGPL')
provides=(ssowat)
depends=('nginx' 'lua51-luajson' 'lua51-lualdap' 'nginx-mainline-mod-lua')
makedepends=('git')
source=("git+https://github.com/tYYGH/SSOwat.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/SSOwat"
  git describe --long --tags | sed -r 's/[^0-9]*(.*)-([^-]*)-(g[^-]+)/\1.r\2.\3/'
}

package() {
  mkdir -p "${pkgdir}/etc/ssowat"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/webapps"
  cd "${srcdir}/SSOwat"
  cp *.lua "${pkgdir}/etc/ssowat/"
  cp CONTRIBUTORS.md LICENSE README.md conf.json.example "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r portal "${pkgdir}/usr/share/webapps/${pkgname%-git}"
  ln -s ../../usr/share/webapps/"${pkgname%-git}" "${pkgdir}/etc/ssowat/portal"
  cat >"${pkgdir}/usr/share/doc/${pkgname}/nginx_main_section.example" <<-"THEEND"
load_module /usr/lib/nginx/modules/ndk_http_module.so;
load_module /usr/lib/nginx/modules/ngx_http_lua_module.so;
THEEND
  cat >"${pkgdir}/usr/share/doc/${pkgname}/nginx_http_section.example" <<-"THEEND"
lua_shared_dict  cache 10m;
init_by_lua_file /etc/ssowat/init.lua;
THEEND
  cat >"${pkgdir}/usr/share/doc/${pkgname}/nginx_server_section.example" <<-"THEEND"
access_by_lua_file        /etc/ssowat/access.lua;
header_filter_by_lua_file /etc/ssowat/headers.lua;
THEEND
}
