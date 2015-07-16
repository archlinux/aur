# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=zotonic
pkgver=0.13.0
pkgrel=1
pkgdesc="Content management system (web-CMS) server written in Erlang"
arch=('any')
url="http://zotonic.com/"
license=("Apache")
depends=('erlang-nox'
         'postgresql'
         'imagemagick')
optdepends=('perl-image-exiftool: Enable image autorotation'
            'nginx: Proxy Zotonic with nginx'
            'varnish: Speed up Zotonic with Varnish')
backup=('etc/zotonic/config'
        'etc/zotonic/erlang.config')
install=${pkgname}.install

source=("https://github.com/zotonic/zotonic/archive/release-${pkgver}.zip"
	"${pkgname}.service"
        "config"
        "erlang.config")
md5sums=('657ceb62559fb42e7c4f1a0ce81adbdc'
         'a6f0f70d2a2af5ff0d0cfaf1531f6ed0'
         '7904af22bf674471c212bde82a2cdcb6'
         '4f09c0c994f5a17844b8ed999d3e7e39')
sha512sums=('86a86bed5c1b562c095c136fea8de4641f6530797b381f1c4594c1a90ac8a1b42491ded0ef58a523ae032a657412dcef566368255886007c970655817abaeb73'
            '0768bbbf07a3448429ae06e30a13751fc8060b3a7c626623731931d962664f542f13c93967b35303e3f0d8afdf848b4b83d310879d6deb1a7303cdc04f909953'
            '62213581acaadcefacf15253175e27135bcc964768a061624a04ebcb3dc6e761ce3629017ce01286b741884fb0b23c4ebfcb6508f14200d99ecdb4f4860bd000'
            'a6e5069e087a314053dab3774ecb123b5d5888c561430ecf02be34b72b3917c513d076323667188fde0ee6c2014e44f41b3a0a4b8fd79dd17c5523425f6979d8')

prepare() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"  
  sed -ie 's/python/python2/' src/scripts/zotonic-modules bin/zotonic
}

# Zotonic will build binary-code on startup
#build() {
#   cd "${srcdir}/${pkgname}-release-${pkgver}"
#   make
#}

package() {
   mkdir -p "${pkgdir}/etc/${pkgname}"
   mkdir -p "${pkgdir}/usr/lib/systemd/system"
   mkdir -p "${pkgdir}/var/lib/${pkgname}/${pkgname}"
   mkdir -p "${pkgdir}/var/log/${pkgname}"

   cp -r -t "${pkgdir}/var/lib/${pkgname}/${pkgname}" "${srcdir}/${pkgname}-release-${pkgver}/"*
   install -m 660 "${srcdir}/config" "${pkgdir}/etc/${pkgname}"
   install -m 660 "${srcdir}/erlang.config" "${pkgdir}/etc/${pkgname}"
   install -m 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system"

   ln -s "/etc/${pkgname}/config" "${pkgdir}/var/lib/${pkgname}/${pkgname}/priv/config"
   ln -s "/etc/${pkgname}/erlang.config" "${pkgdir}/var/lib/${pkgname}/${pkgname}/priv/erlang.config"
}
