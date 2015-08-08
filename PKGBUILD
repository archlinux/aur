# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='xupnpd'
pkgdesc="eXtensible UPnP agent (proxy IP TV multicast to DLNA)"
pkgver='1.033'
pkgrel='2'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url=("http://${pkgname}.org")
license=('GPL2')
makedepends=('subversion' 'lua' 'lua-luajson')
optdepends=('udpxy: custom udp to http proxy')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/clark15b/${pkgname}"
        "res_and_conf_dirs.patch"
        "${pkgname}.service"
        "sysusers.conf")
sha256sums=("SKIP"
            "4214ec45dfe32709d6f6a1d77972c7683d7cd6c75426cf176a598152d30b1e9a"
            "460346fa4404d887aa9220d9a011badaaf3728a77d0337316a158a1b89cdc68e"
            "3f669a1034bcfb9923822fb0adf6d5a379beb7a184a89cd4d72a5b02bc072852")
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
  install -dm755 -o 187 -g 187 "${pkgdir}/var/run/${pkgname}"
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
