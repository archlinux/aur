# Maintainer: Leo Stock <lintmx at gmail dot com>

_pkgname=pcap-dnsproxy
pkgname=pcap-dnsproxy
pkgver=0.4.9.9
pkgrel=1
pkgdesc="A local DNS server base on WinPcap and LibPcap. (Release Version)"
arch=('x86_64' 'i686')
url="https://github.com/chengr28/Pcap_DNSProxy"
license=('GPL2')
depends=('openssl' 'libpcap' 'libsodium' 'libevent')
makedepends=('cmake' 'sh' 'm4' 'bison' 'flex' 'gcc')
conflicts=("pcap-dnsproxy-git")
backup=("etc/${_pkgname}/Config.conf"
        "etc/${_pkgname}/Hosts.conf"
        "etc/${_pkgname}/IPFilter.conf"
        "etc/${_pkgname}/Routing.txt"
        "etc/${_pkgname}/WhiteList.txt")
source=("${_pkgname}"::"https://github.com/chengr28/Pcap_DNSProxy/archive/v${pkgver}.tar.gz"
        "${_pkgname}.service")
md5sums=('5188e5ee29caee80cbfe13c6cdb8b524'
         '1016c2abee0334ab5d93f5767df8a8f7')

build() {
    cd "${srcdir}/Pcap_DNSProxy-${pkgver}/Source/Auxiliary/Scripts"
    sh ./CMake_Build.sh
}

package() {
    cd "${srcdir}/Pcap_DNSProxy-${pkgver}/Source/Release"

    install -Dm755 "Pcap_DNSProxy" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/etc/${_pkgname}/"
    install -Dm644 ./{*.conf,*.txt} "${pkgdir}/etc/${_pkgname}/"
    install -Dm755 ./Tools/Update_Routing.sh "${pkgdir}/etc/${_pkgname}/"
    install -Dm755 ./Tools/Update_WhiteList.sh "${pkgdir}/etc/${_pkgname}/"

    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    cd "${srcdir}/Pcap_DNSProxy-${pkgver}/Documents"

    install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/"
    install -Dm644 ./{*.md,*.txt} "${pkgdir}/usr/share/doc/${_pkgname}/"

    install -Dm644 "${srcdir}/Pcap_DNSProxy-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
