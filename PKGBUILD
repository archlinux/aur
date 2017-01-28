# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

pkgname='xupnpd'
pkgdesc="eXtensible UPnP agent (proxy IP TV multicast to DLNA)"
pkgver='1.033'
pkgrel='5'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="http://${pkgname}.org"
license=('GPL2')
makedepends=('git' 'lua' 'lua-luajson')
optdepends=('udpxy: custom udp to http proxy')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/clark15b/${pkgname}"
        "res_and_conf_dirs.patch"
        "${pkgname}.service"
        "sysusers.conf")
sha256sums=('SKIP'
            '95d436d2bc55bd6fb8affdc4901045d0600092a6045a34f977f79a5950638114'
            '0f6c2a42f676c24dba7bebc804a34f363b12e2dcb4c61bc547c0b722afe09808'
            '3f669a1034bcfb9923822fb0adf6d5a379beb7a184a89cd4d72a5b02bc072852')
_var="var/lib/${pkgname}"
_usr="usr/share/${pkgname}"
backup=("${_var}/${pkgname}.lua")

prepare() {
  cd "${srcdir}"
  patch -p0 -i ./res_and_conf_dirs.patch
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd ${srcdir}
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd "${pkgname}/src"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm755 -o 187 -g 187 "${pkgdir}/run/${pkgname}"
  install -dm755 -o 187 -g 187 "${pkgdir}/${_var}/config"
  install -dm755 -o 187 -g 187 "${pkgdir}/${_var}/localmedia"
  install -Dm644 -o 187 -g 187 *.lua -t "${pkgdir}/${_var}"
  cp -ax "playlists" "${pkgdir}/${_var}"
  chown -R 187:187 "${pkgdir}/${_var}/playlists"
  install -dm755 "${pkgdir}/${_usr}"
  cp -ax "plugins" "${pkgdir}/${_usr}"
  cp -ax "profiles" "${pkgdir}/${_usr}"
  cp -ax "ui" "${pkgdir}/${_usr}"
  cp -ax "www" "${pkgdir}/${_usr}"
}
