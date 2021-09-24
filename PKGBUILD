# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=sensu-go-web
pkgver=1.1.0
pkgrel=1
pkgdesc="Web UI for Sensu Go clusters"
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
groups=('sensu-go')
depends=('yarn' 'nodejs')
provides=("${pkgname/-go-/-}")
conflicts=("${pkgname/-go-/-}")
backup=("etc/sysonfig/${pkgname}")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sensu/web/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.sysconfig")
sha256sums=('732f18f648b939b538208aaa494ce7bb642121272d0bac1324ec2a373a6e1aae'
            '3d06e6acf9056fe132268d124e2da5753862a600c48ed14876863a230e8e2b96'
            '5198dc5f331286165d2bca737249bd5704bc64e707e694d31884fa8e343f1e1e'
            '0a57fa1f7b408246ae4c172190a643e61485fe79b9dae2758bf875fda2b5439b')

build() {
    cd "${srcdir}/web-${pkgver}"

    # TODO: this fails in v1.1.0
    #yarn install --modules-folder "${srcdir}/web-${pkgver}-node_modules"
    yarn install
}

package() {
    cd "${srcdir}/web-${pkgver}"

    install -dm755 "${pkgdir}/opt/sensu"
    cp -r "${srcdir}/web-${pkgver}" "${pkgdir}/opt/sensu/web"
    #cp -r "${srcdir}/web-${pkgver}-node_modules" "${pkgdir}/opt/sensu/yarn/node_modules"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.sysconfig" "${pkgdir}/etc/sysonfig/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-go-/-}.service"
}
