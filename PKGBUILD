# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=dida-bin
_pkgname=dida
pkgver=6.0.40
pkgrel=2
pkgdesc="Official Dida client, a todo list."
arch=("any")
url="https://dida365.com/home"
license=("LicenseRef-Proprietary")
_electron=electron37
depends=(${_electron})
makedepends=('asar' 'yarn')
optdepends=('noto-fonts-emoji: for emoji support')
provides=(${_pkgname})
source=("${_pkgname}_${pkgver}.deb::https://cdn.dida365.cn/download/linux/linux_deb_x64/dida-${pkgver}-amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('a024c045d26dfffffd571f922c315dca6f23a3e2a187d21881094e533dc58132538b46711f29a87876af2b327d60a131b8ffc4f13f716f4b5f83ce04aa35f19e'
    '218ff1e8c89d1567c214d0fec91745606ab48077bb24168a2b18b28f9c69a6918d34c38fe6a70e8aeaee3b6df448e7174c343924e6fa875ba1a583cc656c91ba')

prepare() {
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cp -f opt/*/resources/app.asar ${_pkgname}.asar
    sed -i "s|__ELECTRON__|${_electron}|g" dida.sh
    cd usr/share/applications
    sed -i 's|^Exec=.*|Exec=dida %U|g' dida.desktop
}
build() {
    cd ${srcdir}
    asar e ${_pkgname}.asar apps
    (
        cd apps
        yarn add @electron/remote@2.1.3
    )
    asar p apps ${_pkgname}.asar
}

package() {
    cd ${srcdir}
    mv usr ${pkgdir}
    install -Dm644 ${_pkgname}.asar -t ${pkgdir}/usr/share/${_pkgname}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
