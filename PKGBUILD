# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

pkgname='xupnpd'
pkgdesc="eXtensible UPnP agent (proxy IP TV multicast to DLNA)"
pkgver='1.033'
pkgrel='8'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="http://${pkgname}.org"
license=('GPL2')
depends=('openssl')
makedepends=('git')
optdepends=('udpxy: custom udp to http proxy')
source=("${pkgname}::git+https://github.com/clark15b/${pkgname}"
        "res_and_conf_dirs.patch"
        "${pkgname}.service"
        "sysusers.conf")
sha256sums=('SKIP'
            'd1a0060f3cfd2c89ccbaa4322ca184f152919991332b0c40da998d47cde4e01e'
            'c5404309699c528e09ff399da1253e3ab6006040c51a1ad6c63d59f1f43c356e'
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
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd "${pkgname}/src"
  install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm0755 -o 187 -g 187 "${pkgdir}/run/${pkgname}"
  install -dm0755 -o 187 -g 187 "${pkgdir}/${_var}/config"
  install -dm0755 -o 187 -g 187 "${pkgdir}/${_var}/localmedia"
  install -Dm0644 -o 187 -g 187 *.lua -t "${pkgdir}/${_var}"
  cp -ax "playlists" "${pkgdir}/${_var}"
  chown -R 187:187 "${pkgdir}/${_var}/playlists"
  install -dm0755 "${pkgdir}/${_usr}"
  cp -ax "plugins" "${pkgdir}/${_usr}"
  cp -ax "profiles" "${pkgdir}/${_usr}"
  cp -ax "ui" "${pkgdir}/${_usr}"
  cp -ax "www" "${pkgdir}/${_usr}"
}
