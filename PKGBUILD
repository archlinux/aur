# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname=firefox-sync
pkgver=20220824
pkgrel=2
pkgdesc="Speed up Firefox using tmpfs."
arch=('any')
url='http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs'
license=('GPL')
depends=('rsync' 'firefox')
source=("${pkgname}".sh "${pkgname}.service")
sha256sums=('f7d50c514437c17df99cdfe53c26e939163d9a6cfe055c51f8c2f20f57c46b07'
            'f3ca08a806a8938244a7dbe2f8db690963d6a381643884216b1a960c396ec6b9')

prepare() {
    _linkname="$(grep "LINK=" "/usr/bin/${pkgname}" 2> /dev/null | head -n1 | cut -d= -f2)"
    if [[ -f "/usr/bin/${pkgname}" && "$_linkname" != "" ]]; then
        sed -i "s|LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    else
        if [[ ! -d "$HOME/.mozilla/firefox" ]]; then
            echo "Firefox profile not found, you need to add your profile to the LINK variable in /usr/bin/firefox-sync" 1>&2 
            return
        fi
        _linkname="$(find -H "$HOME/.mozilla/firefox" -maxdepth 1 -mindepth 1 -type d -name \*.default -printf "%f\n")"
        sed -i "s|LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    fi
}

package() {
    install -Dm 755 "${pkgname}".sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}".service
}
