# Maintainer: Nicolo' Barbon <smilzoboboz@gmail.com>
pkgname=calise
pkgver=0.4.2
pkgrel=1
pkgdesc="A program that computes ambient brightness and sets screen's correct backlight using a webcam."
arch=('any')
url="http://calise.sourceforge.net/"
license=('GPL3')
groups=()
depends=('python2-xdg'
         'python2-pyephem'
         'python2-dbus'
         'python2-gobject2'
         'hicolor-icon-theme')
makedepends=('python2-distutils-extra'
             'intltool'
             'libx11'
             'linux-headers')
optdepends=('python2-pyqt: gui (non-service only)'
            'pm-utils: graceful pause and resume on suspend/hiberante')
provides=('calise')
conflicts=('calise-git')
replaces=('camsensor')
backup=()
options=()
install='calise.install'
changelog=
source=(
    http://sourceforge.net/projects/$pkgname/files/$pkgname-beta/$pkgver/$pkgname-$pkgver.tar.gz
)
noextract=()
sha1sums=(
    '13638acce079ebbec1546913738c8e0293363513'
)


build() {
    cd "${srcdir}/${pkgname}"
    env python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    # preliminary check
    if [ ! -d /sys/class/backlight/ ]
    then
        return 1
    fi

    # udev rules creation (for all available interfaces)
    interfaces=''
    for path in /sys/class/backlight/*
    do
        interfaces="`udevadm info -a -p ${path} |
            grep 'KERNEL=' |
            sed s'/KERNEL==//' |
            awk -F ['"'] '{print $2}'` ${interfaces}"
    done
    if [ -z "$interfaces" ]
    then
        echo "Your configuration is currently not supported."
        return 2
    fi
    for interface in ${interfaces}
    do
        if [ ! -f /sys/class/backlight/$interface/brightness ]
        then
            echo "Your configuration is currently not supported."
            return 3
        fi
        udevrule="${interface}.rules"
        echo "KERNEL==\"${interface}\", RUN+=\"/bin/chmod 664 /sys/class/backlight/${interface}/brightness\"" > $udevrule
        echo "KERNEL==\"${interface}\", RUN+=\"/bin/chgrp wheel /sys/class/backlight/${interface}/brightness\"" >> $udevrule
        install -Dm644 ${udevrule} "${pkgdir}/usr/lib/udev/rules.d/99-backlight-${udevrule}"
    done

    # pm-utils sleep script
    if [ -d /usr/lib/pm-utils ]
    then
        install -Dm755 "other/pm-utils_scripts/53${pkgname}d" "${pkgdir}/usr/lib/pm-utils/sleep.d/53${pkgname}d"
    fi

    # init.d script
    if [ -d /etc/rc.d/ ]
    then
        install -Dm755 "other/init_scripts/init.d/${pkgname}d" "${pkgdir}/etc/rc.d/${pkgname}d"
        mkdir -p /etc/conf.d/
        install -Dm644 "other/init_scripts/conf.d/${pkgname}d" "${pkgdir}/etc/conf.d/${pkgname}d"
    fi

    # systemd script
    if [ -d /etc/systemd/system/ ]
    then
        install -Dm644 "other/systemd_scripts/${pkgname}d.service" "${pkgdir}/etc/systemd/system/${pkgname}d.service"
    fi

    # final install
    env python2 setup.py install --prefix=/usr --root="${pkgdir}" || return 1
}
