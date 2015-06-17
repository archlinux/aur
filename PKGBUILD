# Maintainer: M0Rf30 < morf3089 at gmail dot com >

pkgname=veromix-git
pkgver=2.4eeab4c
pkgrel=1
pkgdesc="A mixer for the Pulseaudio sound server (both GTK and KDE versions)"
url="http://code.google.com/p/veromix-plasmoid/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('kdebindings-python' 'kdebase-workspace' 'python2-pyqt4' 'pulseaudio' 'pyxdg'  'python-gobject' 'python-dbus' 'python2-dbus')
conflicts=('kdeplasma-addons-applets-veromix' 'kdeplasma-addons-applets-veromix-svn' 'kdeplasma-addons-applets-veromix-git')
makedepends=('git' 'kdesdk-dev-scripts')
optdepends=('pulseaudio-equalizer'
            'swh-plugins: equalizer and other effects support')
_gitroot="https://code.google.com/p/veromix-plasmoid/"
_gitname="veromix-plasmoid"
source=("veromix-plasmoid::git://github.com/M0Rf30/veromix-plasmoid.git"
	'veromix')

package() {
  cd veromix-plasmoid

        
        make DESTDIR=${pkgdir} install
        
        # For KDE
        rm ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/contents/icons
        rm ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/contents/code/veromixcommon
        ln -s -r ${pkgdir}/usr/share/icons ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/contents/
        ln -s -r ${pkgdir}/usr/share/veromix/common ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid/contents/code/veromixcommon
        
        # For Gnome
        install -D ../veromix ${pkgdir}/usr/bin/veromix        
        chmod +x ${pkgdir}/usr/bin/veromix 
        
        # Generating bytecode
	cd ${pkgdir}/usr/share/apps/plasma/plasmoids/veromix-plasmoid
        python2 -m compileall .
        cd $pkgdir/usr/share/veromix/gtk
        python -m compileall .
}

pkgver() {
	cd veromix-plasmoid
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         'c113bba6265ee87a898b564942349cf4')
