# Maintainer: yifwon <wyf9661 at gmail dot com>
pkgbase=cpolar-bin
_pkgname=cpolar
pkgname=('cpolar-bin' 'cpolar-bin-multi-user')
pkgver=3.3.18
pkgrel=1
pkgdesc="cpolar 极点云: 公开一个本地 Web 站点至公网"
arch=('x86_64' 'aarch64')
url="http://www.cpolar.com"
_downloadurl="${url}/static/downloads"
license=('custom')
depends=('systemd')

source_x86_64=("${_pkgname}-${pkgver}.zip::${_downloadurl}/releases/${pkgver}/${_pkgname}-stable-linux-amd64.zip")
sha1sums_x86_64=('3774a8d1379cefd15157625eead7bc535a63d193')
source_aarch64=("${_pkgname}-${pkgver}.zip::${_downloadurl}/releases/${pkgver}/${_pkgname}-stable-linux-arm64.zip")
sha1sums_aarch64=('e821f2d591664de10288c9bd09d548e2bc008128')

source=("${_downloadurl}/${_pkgname}.demo.yml"
        "${_downloadurl}/${_pkgname}.service"
        "${_downloadurl}/${_pkgname}@.service")

sha1sums=("b0d9c432e467930f898e9c3def9cfcde4d4b9f2b"
          "6d8352a14fbe49967759f87d23854cd536757182"
          "d00ef16021ffa0f6746c81f498b029e5b51a56bd")

package_cpolar-bin() {

    backup=("etc/${_pkgname}/${_pkgname}.yml")

    # Install Cpolar binary
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install Cpolar configuration file
    install -Dm a+r+w  "${srcdir}/${_pkgname}.demo.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"

    #Install systemd service file
    sed 's:/usr/local::g' -i ${srcdir}/${_pkgname}.service
    sed 's:-log=/var/log/cpolar/access.log::g' -i ${srcdir}/${_pkgname}.service
    install -Dm644  ${srcdir}/${_pkgname}.service -t ${pkgdir}/usr/lib/systemd/system
}

package_cpolar-bin-multi-user() {

    depends=('cpolar-bin')

    #Install systemd service file
    sed 's:/usr/local::g' -i ${srcdir}/${_pkgname}@.service
    sed 's:-log=/var/log/cpolar/access.log::g' -i ${srcdir}/${_pkgname}@.service

    #disable dashboard to avoid display port conflict
    sed 's:-dashboard=on::g' -i ${srcdir}/${_pkgname}@.service

    install -Dm644  ${srcdir}/${_pkgname}@.service -t ${pkgdir}/usr/lib/systemd/system
}
