# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=pcap-dnsproxy
pkgname="${_pkgname}-git"
pkgver=0.4.8.2.0.g1c40e79
pkgrel=1
epoch=1
pkgdesc="A local DNS server base on WinPcap and LibPcap."
arch=('x86_64' 'i686')
url="https://github.com/chengr28/Pcap_DNSProxy"
license=('GPL2')
depends=('libpcap' 'libsodium')
makedepends=('git' 'cmake' 'sh' 'm4' 'bison' 'flex' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::'git://github.com/chengr28/Pcap_DNSProxy.git'
        "${_pkgname}.service")
install="${_pkgname}.install"
md5sums=('SKIP'
         '29af12cdfedf4353406c4a0bb2ed8dc5')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/^v//;s/release./r/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/Source/Auxiliary/Scripts"
    sh ./CMake_Build.sh
}

package() {
    cd "${srcdir}/${pkgname}/Source/Release"

    install -Dm777 "Pcap_DNSProxy" "${pkgdir}/usr/share/${_pkgname}/Pcap_DNSProxy"

    install -Dm644 ./{*.conf,*.txt} "${pkgdir}/usr/share/${_pkgname}/"
    install -dm755 "${pkgdir}/etc/${_pkgname}/"
    ln -s "/usr/share/${_pkgname}/Config.conf" "${pkgdir}/etc/${_pkgname}/Config.conf"
    ln -s "/usr/share/${_pkgname}/Hosts.conf" "${pkgdir}/etc/${_pkgname}/Hosts.conf"
    ln -s "/usr/share/${_pkgname}/IPFilter.conf" "${pkgdir}/etc/${_pkgname}/IPFilter.conf"
    ln -s "/usr/share/${_pkgname}/Routing.txt" "${pkgdir}/etc/${_pkgname}/Routing.txt"
    ln -s "/usr/share/${_pkgname}/WhiteList.txt" "${pkgdir}/etc/${_pkgname}/WhiteList.txt"

    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    cd "${srcdir}/${pkgname}/Documents"
    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

