# Previous Maintainer: Peter Reschenhofer < peterreschenhofer at gmail dot com >
# Current Maintainer : Mark Lee <mark@markelee.com>
# Contributor: Familia < carlosfamilia at gmail dot com >
pkgname=rstudio-server-bin
pkgver=1.1.463
pkgrel=3
pkgdesc="A integrated development environment (IDE) for R (binary version from RStudio official website)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r>=2.11.1' 'glibc>=2.7' 'libedit' 'psmisc' 'openssl-1.0')
conflicts=('rstudio-server' 'rstudio-server-git')
provides=("rstudio-server=${pkgver}")
#options=(!strip)

_deb_x86_md5=411cdcd973c16ebfd9b2411eb7dac753
_deb_x64_md5=e8f3d9c3c5ca1df9827c6843b7ac5ab4
_rstudioservice_md5=eea28f7865720f6c8d5de12f3f631880
_rstudio_pam_md5=4368b3f98abd8a32662e094c54e7f9b1

case "${CARCH}" in
    'i686')
        _arch=i386
        md5sums=(${_deb_x86_md5} ${_rstudioservice_md5} ${_rstudio_pam_md5})
        ;;
    'x86_64')
        _arch=amd64
        md5sums=(${_deb_x64_md5} ${_rstudioservice_md5} ${_rstudio_pam_md5})
        ;;
esac    

source=("https://download2.rstudio.org/rstudio-server-${pkgver}-${_arch}.deb"
        "rstudio-server.service"
        "rstudio")

install="${pkgname}".install

package() {
    msg "Converting debian package..."

    cd "${srcdir}"
    tar zxpf data.tar.gz -C "${pkgdir}"
    chmod 755 $(find ${pkgdir}/usr -type d)

    install -m755 -d "${pkgdir}/usr/bin"
    install -m755 -d "${pkgdir}/etc/rstudio"
    install -m644 -D "rstudio-server.service" "${pkgdir}/etc/systemd/system/rstudio-server.service"
    mkdir -p "${pkgdir}/etc/pam.d"
    install -m644 -D "rstudio" "${pkgdir}/etc/pam.d/"
}
