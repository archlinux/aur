# Maintainer: Jingrong Chen <crazyboycjr@gmail.com>
pkgname=bigfix-duke
pkgver=10.0.2.52
pkgrel=2
pkgdesc="BigFix Enterprise Suite for Duke"
arch=('x86_64')
license=('unknown')
depends=('net-tools' 'bash' 'start-stop-daemon')
# BigFix_CS_10.0.2.52_Linux.zip is on a private server. Please replace this with your prepared material.
# You can acquire one copy here: https://www2.cs.duke.edu/csl/endpoints/BigFix_CS_10.0.2.52_Linux.zip
source=('scp://danyang-01.cs.duke.edu:/nfs/public/csl_endpoints/BigFix_CS_10.0.2.52_Linux.zip'
        'besclient.service'
        'vars.sh'
        'init-functions')
sha256sums=('c3410a3a7a97d4ee10cca0a2d8990c9c23758a3b1a0472d108d66921df83a088'
            '777f36b8b3944136b957280b05d5f1ad133f66b62486028a1a687f14de284416'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '3e0428b8665bb91a9783386ceef42f7e67e330f9db25a107c7131239c7e07405')
install='bigfix.install'

package() {
    builtin cd "${srcdir}/BigFix_CS_10.0.2.52_Linux"

	# NOTE: Replace this file with your own verified copy.
    wget -nc http://bf01.aas.duke.edu:52311/masthead/masthead.afxm
    install -Dm644 masthead.afxm "${pkgdir}/etc/opt/BESClient/actionsite.afxm"
    install -Dm644 besclient.config -t "${pkgdir}/var/opt/BESClient/"

	# Use the file from ubuntu deb file.
    mkdir -p deb
    ar -x BESAgent-10.0.2.52-ubuntu10.amd64.deb --output deb
    tar xzvfp deb/data.tar.gz -C "${pkgdir}" --no-same-owner 
    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/lib"

    install -Dm644 "${startdir}/besclient.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${startdir}/vars.sh" "${pkgdir}/usr/lib/init/vars.sh"
    install -Dm644 "${startdir}/init-functions" "${pkgdir}/usr/lib/lsb/init-functions"
}
