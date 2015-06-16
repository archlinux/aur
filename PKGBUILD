# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=howm-x11-git
_pkgname=howm
pkgver=0.5.29.g8879be1
pkgrel=9

pkgdesc='A lightweight, tiling X11 window manager that mimics vi by offering operators, motions and modes.'
arch=('i686' 'x86_64')
url='https://github.com/HarveyHunt/howm'
license=('GPL')

depends=('bash' 'xcb-util-wm' 'sxhkd' 'cottage-git')
makedepends=('git')
checkdepends=('linux-headers')
provides=('howm-x11')
conflicts=('howm-x11')
options=('!strip' 'debug')
source=('git+https://github.com/HarveyHunt/howm#branch=develop')
sha256sums=('SKIP')
install=howm.install

pkgver() {
    cd "$_pkgname"
    git describe --tags | sed 's/-/./g'
}

build() {
    cd "$_pkgname"
    make debug
}

check() {
    cd "$_pkgname"
    find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .

    echo "spellingtxt||disable" > spelling.txt
    make check
}

package() {
    cd "$_pkgname"

    find examples/ -type f ! -executable -execdir \
	 install -Dm644 {} "$pkgdir"/usr/share/howm/examples/{} \;
    find examples/ -type f -executable -execdir \
	 install -Dm755 {} "$pkgdir"/usr/share/howm/examples/{} \;
    
    install -Dm755 bin/debug/howm "$pkgdir"/usr/bin/howm
    install -Dm644 howm.xsession.desktop "$pkgdir"/usr/share/xsessions/howm.xsession.desktop
}

# vim:set ts=2 sw=2 et:
