# Maintainer: Nicolo' Barbon <smilzoboboz@gmail.com>
pkgname=calise-git
pkgver=v0.4.1.r19.g25dbdaf
pkgrel=1
pkgdesc="A program that computes ambient brightness and sets screen's correct backlight using a webcam. Development GIT Version."
arch=('i686' 'x86_64')
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
             'git'
             'linux-headers')
optdepends=('python2-pyqt: gui (non-service only)'
            'pm-utils: graceful pause and resume on suspend/hiberante')
provides=('calise')
conflicts=('calise')
replaces=('camsensor')
backup=()
options=()
changelog=
noextract=()
source=('git://git.code.sf.net/p/calise/calise')
sha1sums=('SKIP')

#_gitroot='git://git.code.sf.net/p/calise/calise'
_gitname='calise'
#_buildir='calise-build'

build() {
    cd ${srcdir}/${_gitname}
    env python2 setup.py build || return 1
}

package() {
    cd "${srcdir}/${_gitname}"

    # preliminary check
    if [ ! -d /sys/class/backlight/ ]; then
        return 1
    fi

    # udev rules creation (for all available interfaces)
    interfaces=""
    for path in /sys/class/backlight/*; do
        interfaces="`udevadm info -a -p ${path} |
            grep "KERNEL=" |
            sed s'/KERNEL==//' |
            awk -F ['"'] '{print $2}'` ${interfaces}"
    done
    if [ -z "$interfaces" ]; then
        echo "Your configuration is currently not supported."
        return 2
    fi
    for interface in ${interfaces}; do
        if [ ! -f /sys/class/backlight/$interface/brightness ]; then
            echo "Your configuration is currently not supported."
            return 3
        fi
        udevrule="${interface}.rules"
        echo "KERNEL==\"${interface}\", RUN+=\"/bin/chmod 664 /sys/class/backlight/${interface}/brightness\"" > $udevrule
        echo "KERNEL==\"${interface}\", RUN+=\"/bin/chgrp wheel /sys/class/backlight/${interface}/brightness\"" >> $udevrule
        install -Dm644 ${udevrule} "${pkgdir}/usr/lib/udev/rules.d/99-backlight-${udevrule}"
    done

    # pm-utils sleep script
    if [ -d /usr/lib/pm-utils ]; then
        install -Dm755 "other/pm-utils_scripts/53${_gitname}d" "${pkgdir}/usr/lib/pm-utils/sleep.d/53${_gitname}d"
    fi

    # init.d script
    if [ -d /etc/rc.d/ ]; then
        install -Dm755 "other/init_scripts/init.d/${_gitname}d" "${pkgdir}/etc/rc.d/${_gitname}d"
        mkdir -p /etc/conf.d/
        install -Dm644 "other/init_scripts/conf.d/${_gitname}d" "${pkgdir}/etc/conf.d/${_gitname}d"
    fi

    # systemd script
    if [ -d /etc/systemd/system/ ]; then
        install -Dm644 "other/systemd_scripts/${_gitname}d.service" "${pkgdir}/etc/systemd/system/${_gitname}d.service"
    fi

    # final install
    env python2 setup.py install --prefix=/usr --root="${pkgdir}" || return 1
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
