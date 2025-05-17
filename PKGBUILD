# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname=librewolf-sync
pkgver=20220831
pkgrel=1
pkgdesc="Speed up Librewolf using tmpfs."
arch=('any')
url='http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs'
license=('GPL')
source=("${pkgname}".sh "${pkgname}.service" "${pkgname}-cron.service" "${pkgname}-cron.timer")
sha256sums=('c9a15a1c547a85a547820760cccf3537c74803ff9f0405667e7467a47e2540d8'
            '94fee311c891809be121e8e4bcc09cadbfc98e36183dde363fe5af7990f910b8'
            'd09f98b3bfe4c9bd5fe171e2975789fce032e0504f9fd59269351379a690675c'
            '290ec34a4d27a1681e49da3bd7ed2cb499c57acfb1a7044583000afbb0dd97d5')

prepare() {
    _linkname="$(grep "LINK=" "/usr/bin/${pkgname}" 2> /dev/null | head -n1 | cut -d= -f2)"
    if [[ -f "/usr/bin/${pkgname}" && "$_linkname" != "" ]]; then
        sed -i "s|^LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    else
        if [[ ! -d "$HOME/.librewolf" ]]; then
            echo "Librewolf profile not found, you need to add your profile to the LINK variable in /usr/bin/librewolf-sync" 1>&2 
            return
        fi
        _linkname="$(find -H "$HOME/.librewolf" -maxdepth 1 -mindepth 1 -type d -name \*.default -printf "%f\n")"
        sed -i "s|^LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    fi
}

package() {
    depends=('rsync' 'librewolf-bin')
    install -Dm 755 "${pkgname}".sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}".service
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}-cron".service
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}-cron".timer
}

