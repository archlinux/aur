# Maintainer: fuero <fuerob@gmail.com>
_java=25
_pkgname=galleon
pkgname="${_pkgname}-bin"
# renovate: datasource=github-releases depName=wildfly/galleon extractVersion=^(?<version>.*)\.Final$
pkgver=7.0.12
pkgrel=1
pkgdesc="Provisioning tool designed to create and maintain software distributions that consist of one or more products"
arch=('x86_64')
url='https://github.com/wildfly/galleon'
license=('custom')
depends=("java-runtime>=${_java}")
source=("https://github.com/wildfly/${_pkgname}/releases/download/${pkgver}.Final/${_pkgname}-${pkgver}.Final.zip")
sha256sums=('962eeea29c9d047931d3b1f192b877757012eee97c5bcca46055c018de204508')

package() {
    cd "${_pkgname}-${pkgver}.Final"
    local destdir="${pkgdir}/opt/${_pkgname}"
    
    sed -i -r -e '/^DIRNAME=/d' "bin/${_pkgname}.sh"
    mkdir -p "${destdir}"
    cp -a -t "${destdir}" bin/*

    install -DTm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp -a -t "${pkgdir}/usr/share/doc/${pkgname}/" docs/*

    mkdir -p "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/${_pkgname}" <<- EOF
		#!/usr/bin/env bash
		export DIRNAME=/opt/${_pkgname}
		exec /opt/${_pkgname}/${_pkgname}.sh "\${*}"
	EOF
    chmod a+x "${pkgdir}/usr/bin/${_pkgname}"
}
