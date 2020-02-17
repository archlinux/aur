# Maintainer: eomanis at web dot de

pkgname='yabddnsd'
_pkgverUpstream="0.7.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Yet another bash dynamic DNS daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/yabddnsd/'
license=('GPL3')
depends=('bash>=4.4' 'bc' 'bind-tools' 'coreutils' 'findutils' 'grep' 'iproute2' 'sed' 'wget')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
replaces=('freedns-maintain-ip')
source=("https://eomanis.duckdns.org/permshare/yabddnsd/yabddnsd-${_pkgverUpstream}.tar.gz")
sha384sums=('649683618a7e7976c6aba94d83fb2705b66dcfe8a81ecbaf293217553bd2e5d2a86d8c75a38efb73bf3dfd586a035c9c')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/yabddnsd"
    chmod u=rwx,go=rx "yabddnsd"
    
    # Place the systemd unit file into /usr/lib/systemd/system
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cd "${pkgdir}/usr/lib/systemd/system"
    cp -t . "${srcRootDir}/systemd/yabddnsd@.service"
    chmod u=rw,go=r "yabddnsd@.service"
    
    # Gzip and place the manual pages
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man8"
    gzip --fast --to-stdout - < "${srcRootDir}/yabddnsd.8" > "man8/yabddnsd.8.gz"
    gzip --fast --to-stdout - < "${srcRootDir}/systemd/yabddnsd.service.8" > "man8/yabddnsd.service.8.gz"
    chmod -R u=rwX,go=rX .
}
