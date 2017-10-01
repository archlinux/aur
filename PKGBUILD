# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Giampaolo Mancini <mancho@trmpln.com>
_pkgname=rsmb
pkgname=rsmb-git
pkgver=r58.889fe81
pkgrel=1
epoch=
pkgdesc="MQTT and MQTT-SN broker"
arch=("x86_64")
url="https://github.com/MichalFoksa/rsmb"
license=('custom:edl-v10' 'custom:epl-v10')
groups=()
depends=('sh')
makedepends=('git' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/MichalFoksa/rsmb.git"
        "broker.sh"
        "broker_mqtts.sh"
        "broker.ini"
        "broker_mqtts.ini")
noextract=()
md5sums=('SKIP'
        '0192bdbe34f3c41993e2a576264e2278'
        '77a591b959078781ce5cadfd123905d5'
        '36b72de48a91b74d500d4d53a31def29'
        'c8fdde013b1c22babd52baefd836de52')
validpgpkeys=()

pkgver() {
      cd "${_pkgname}"
      ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      )
}

prepare() {
    :
}

build() {
	cd "${srcdir}/${_pkgname}/rsmb/src"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/${_pkgname}/src"
        mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	make INSTALL_PATH="${pkgdir}/usr/lib/${pkgname}" install
	cd "${srcdir}/${_pkgname}"
        install -Dm644 edl-v10 ${pkgdir}/usr/share/licenses/${pkgname}/edl-v10
        install -Dm644 epl-v10 ${pkgdir}/usr/share/licenses/${pkgname}/epl-v10
	cd "${srcdir}"
        install -Dm755 broker.sh ${pkgdir}/usr/bin/${_pkgname}
        install -Dm755 broker_mqtts.sh ${pkgdir}/usr/bin/${_pkgname}-sn
        mkdir -p "${pkgdir}/usr/share/${pkgname}"
        install -Dm755 broker.ini ${pkgdir}/usr/share/${pkgname}/
        install -Dm755 broker_mqtts.ini ${pkgdir}/usr/share/${pkgname}/
}
