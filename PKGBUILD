# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Previous maintainer jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=zotonic
pkgver=0.40.0
pkgrel=1
pkgdesc="Content management system (web-CMS) server written in Erlang"
arch=('any')
url="http://zotonic.com/"
license=("Apache")
depends=('erlang-nox'
         'postgresql'
         'git'
         'imagemagick')
optdepends=('perl-image-exiftool: Enable image autorotation'
            'nginx: Proxy Zotonic with nginx'
            'varnish: Speed up Zotonic with Varnish')
backup=('etc/zotonic/config'
        'etc/zotonic/erlang.config')
install=${pkgname}.install

source=("https://github.com/zotonic/zotonic/archive/${pkgver}.tar.gz"
	"${pkgname}.service"
        "config"
        "erlang.config")

sha512sums=('6698b439e89932b44bb38169f25a0912c7e1852d576f15255f46ea358ff83f3ce76da5b526c5e36ad62f70dbb711f3f259d77812548161c517cfc85deaf5a07f'
            '0768bbbf07a3448429ae06e30a13751fc8060b3a7c626623731931d962664f542f13c93967b35303e3f0d8afdf848b4b83d310879d6deb1a7303cdc04f909953'
            '73aa92b9666ac8bcc0b8988355eede2294da272825166cf4a493f52d158caa4b0a2b6c5cc7890f19702e9fec084e78287f7bdb6764602b2f033e85ffa2efeead'
            '33e6402e7e2f4926249eac5b7c199985b620916907168408c752bcd659640bd3e61cdb4d75382ee22376ccf079d235acd678c00a7f9084be7bc7c536e943d0c5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  sed -ie 's/python/python2/' src/scripts/zotonic-modules bin/zotonic
}

# Zotonic will build binary-code on startup
#build() {
#   cd "${srcdir}/${pkgname}-${pkgver}"
#   make
#}

package() {
   mkdir -p "${pkgdir}/etc/${pkgname}"
   mkdir -p "${pkgdir}/usr/lib/systemd/system"
   mkdir -p "${pkgdir}/var/lib/${pkgname}/${pkgname}"
   mkdir -p "${pkgdir}/var/log/${pkgname}"

   cp -r -t "${pkgdir}/var/lib/${pkgname}/${pkgname}" "${srcdir}/${pkgname}-${pkgver}/"*
   install -m 660 "${srcdir}/config" "${pkgdir}/etc/${pkgname}"
   install -m 660 "${srcdir}/erlang.config" "${pkgdir}/etc/${pkgname}"
   install -m 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system"

   ln -s "/etc/${pkgname}/config" "${pkgdir}/var/lib/${pkgname}/${pkgname}/priv/config"
   ln -s "/etc/${pkgname}/erlang.config" "${pkgdir}/var/lib/${pkgname}/${pkgname}/priv/erlang.config"
}
