# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=slimbookbattery-git
_pkgname="${pkgname%-git}"
pkgver=4.0.8beta.r306.9df2282
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('any')
url="https://github.com/Slimbook-Team/${_pkgname}"
license=('GPL3')
depends=('cron' 'dbus-python' 'dmidecode' 'gtk3' 'libayatana-appindicator'
         'libnotify' 'polkit' 'python-gobject' 'python-pillow' 'python-setuptools'
         'tlp' 'tlp-rdw' 'vte3' 'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode')
makedepends=('git')
provides=('slimbookbattery')
conflicts=('slimbookbattery')
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s.r%s.%s" "$(sed -n 's/^Version=\(.*\)/\1/p' slimbookbattery.desktop)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    while read -r line; do
        IFS=" " read -r src dest <<< "${line}"
        mkdir -p "${pkgdir}${dest}"
        cp -rf ${src} "${pkgdir}${dest}"
    done < debian/install

    rm ${pkgdir}/usr/bin/slimbookbattery ${pkgdir}/usr/bin/slimbookbattery-pkexec
    ln -s /usr/share/slimbookbattery/bin/slimbookbattery ${pkgdir}/usr/bin/slimbookbattery
    ln -s /usr/share/slimbookbattery/bin/slimbookbattery-pkexec ${pkgdir}/usr/bin/slimbookbattery-pkexec
    chmod +x ${pkgdir}/usr/share/slimbookbattery/bin/*
}
