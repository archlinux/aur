# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname=firefox-sync
pkgver=20220831
pkgrel=1
pkgdesc="Speed up Firefox using tmpfs."
arch=('any')
url='http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs'
license=('GPL')
source=("${pkgname}".sh "${pkgname}.service" "${pkgname}-cron.service" "${pkgname}-cron.timer")
sha256sums=('9f502ac6b52e7d30bd409463ab411828255d935e82733ef1d43da574c84f3089'
            'f3ca08a806a8938244a7dbe2f8db690963d6a381643884216b1a960c396ec6b9'
            '7769dced29810910ba91fa41461513d05085b5bbf1a9d78740e5300072190333'
            '51eabc82394e344756b86105a7b738d5a026bca490c17d87ef7d72339995db7c')

prepare() {
    _linkname="$(grep "LINK=" "/usr/bin/${pkgname}" 2> /dev/null | head -n1 | cut -d= -f2)"
    if [[ -f "/usr/bin/${pkgname}" && "$_linkname" != "" ]]; then
        sed -i "s|^LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    else
        if [[ ! -d "$HOME/.mozilla/firefox" ]]; then
            echo "Firefox profile not found, you need to add your profile to the LINK variable in /usr/bin/firefox-sync" 1>&2 
            return
        fi
        _linkname="$(find -H "$HOME/.mozilla/firefox" -maxdepth 1 -mindepth 1 -type d -name \*.default -printf "%f\n")"
        sed -i "s|^LINK=.*|LINK=$_linkname|" "${pkgname}".sh
    fi
}

package() {
    depends=('rsync' 'firefox')
    install -Dm 755 "${pkgname}".sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}".service
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}-cron".service
    install -Dm 644 {"${srcdir}","${pkgdir}"/usr/lib/systemd/user}/"${pkgname}-cron".timer
}

