# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=maraschinoproject-git
pkgver=20120709
pkgrel=1
pkgdesc="Web-based frontend for XBMC, Sickbeard, Sabnzbd, and more."
arch=('any')
url="http://www.maraschinoproject.com/"
license=('GPL')
depends=('python2')
makedepends=('git')
backup=('etc/conf.d/maraschino'
        'opt/maraschino/maraschino.db')
source=('maraschino.sh' 'maraschino.rc')
md5sums=('7ccaabbd8632323702b591637fcc2b4a'
         '12d6bdd1753612a126b3626de855519b')

_gitroot=https://github.com/mrkipling/maraschino
_gitname=maraschino

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."
}

package() {
    # Make destination directory
    install -d ${pkgdir}/opt/

    # Move Maraschino files to destintion directory
    cp -r ${srcdir}/${_gitname} ${pkgdir}/opt/maraschino

    # Install Launcher Script
    install -D -m755 "${srcdir}/maraschino.sh" \
        "${pkgdir}/usr/bin/maraschino"

    # Install Daemon Script
    install -D -m755 "${srcdir}/maraschino.rc" \
        "${pkgdir}/etc/rc.d/maraschino"

    # Install Daemon Configuration
    install -D -m644 "${srcdir}/maraschino/default" \
        "${pkgdir}/etc/conf.d/maraschino"
}

