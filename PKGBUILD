# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=pcap-dnsproxy-git
_pkgname=pcap-dnsproxy
pkgver=20150927
pkgrel=1
pkgdesc="A local DNS server base on WinPcap and LibPcap."
arch=("any")
url="https://github.com/chengr28/Pcap_DNSProxy"
license=('GPL2')
depends=('libpcap' 'libsodium')
makedepends=('git' 'cmake' 'sh' 'm4' 'bison' 'flex' 'gcc')
provides=('pcap-dnsproxy')
conflicts=('pcap-dnsproxy')
source=("${pkgname}"::'git://github.com/chengr28/Pcap_DNSProxy.git'
        "${_pkgname}.service")
install="${_pkgname}.install"
md5sums=('SKIP'
         '29af12cdfedf4353406c4a0bb2ed8dc5')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${srcdir}/${pkgname}/Source/Scripts"
    sh ./Linux_Build.sh
}

package() {
    cd "${srcdir}/${pkgname}/Source/Release"

    install -Dm777 "Pcap_DNSProxy" "${pkgdir}/usr/share/${_pkgname}/Pcap_DNSProxy"
    install -Dm777 "KeyPairGenerator" "${pkgdir}/usr/share/${_pkgname}/KeyPairGenerator"

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
