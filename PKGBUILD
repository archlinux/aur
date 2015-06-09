# Maintainer: John Lane <archlinux at jelmail dot com>
# Based on community/gsmartcontrol

pkgname=gsmartcontrol-svn
pkgver=r114
pkgrel=1
pkgdesc="A graphical user interface for the smartctl hard disk drive health inspection tool."
arch=('i686' 'x86_64')
url="http://gsmartcontrol.sourceforge.net/home"
license=('GPL3')
conflicts=('gsmartcontrol')
provides=('gsmartcontrol')
depends=('smartmontools' 'gtkmm' 'xorg-xmessage' 'hicolor-icon-theme')
optdepends=('polkit: to run gsmartcontrol directly from menu')
install=${pkgname}.install
source=(${pkgname}::svn://svn.code.sf.net/p/gsmartcontrol/code/trunk/gsmartcontrol
        org.archlinux.pkexec.gsmartcontrol.policy
        gsmartcontrol_polkit)
md5sums=('SKIP'
         '503989a7e6a9a287d81e91243d03f162'
         '33bdda04d8db1525f2507485f3f2a663')

prepare() {
	cd "${srcdir}/${pkgname}"

        ./autogen.sh

        # Modify desktop file
        sed -i "s|^Exec=.*|Exec="@prefix@/bin/gsmartcontrol_polkit"|" \
                data/gsmartcontrol.desktop.in
}

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix=/usr
	make 
}

check() {
	cd "${srcdir}/${pkgname}"
        make check
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR=${pkgdir} install

        # Install launcher script
        install -m755 ${srcdir}/gsmartcontrol_polkit \
                "${pkgdir}/usr/bin/gsmartcontrol_polkit"

        # Install policy file
        install -Dm644 ${srcdir}/org.archlinux.pkexec.gsmartcontrol.policy \
                "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.gsmartcontrol.policy"
}

pkgver() {
  cd "$srcdir/${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
