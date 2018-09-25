# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=octopi-kde-git
pkgver=r1410.b7fa1be
pkgrel=1
pkgdesc="A powerful Pacman frontend using Qt libs (git version for KDE)"
url="https://github.com/aarnt/octopi"
arch=('x86_64')
license=('GPL2')
depends=('pkgfile' 'knotifications' 'alpm_octopi_utils' 'kdesu' 'pacman-contrib')
optdepends=('yaourt: for AUR support'
            'pacaur: for AUR support'
            'trizen: for AUR support'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-git' 'octopi-notifier-frameworks' 'octopi-notifier-qt5'
          'octopi-notifier-noknotify' 'octopi-repoeditor' 'octopi-cachecleaner'
          'octopi-pacmanhelper')
conflicts=('octopi' 'octopi-git' 'octopi-notifier-frameworks' 'octopi-notifier-qt5'
           'octopi-notifier-noknotify' 'octopi-repoeditor' 'octopi-cachecleaner'
           'octopi-pacmanhelper')
makedepends=('git')
source=("$pkgname::git+https://github.com/aarnt/octopi.git"
        "icons::git+https://gitlab.com/kikadf/octopicons.git"
        "https://code.chakralinux.org/packages/desktop/raw/master/octopi/0001-remove-qtermwidget.patch")
md5sums=('SKIP'
         'SKIP'
         '5b56cd3d5d6e25a62c94055b2384aff3')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    # disable lxqt qtermwidget
    patch -Np1 -i ../0001-remove-qtermwidget.patch
    rm -rfv src/termwidget.{cpp,h}

    # enable the kstatus switch to build with Plasma/knotifications support
    sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier/octopi-notifier.pro

    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cd "$pkgname"
    # set version
    sed -e 's|"0.9.0"|"'$pkgver'"|g' -i src/strconstants.cpp

    export QTERMWIDGET=off
    msg 'Building octopi…'
    qmake-qt5 QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
              QMAKE_LFLAGS_RELEASE="$LDFLAGS" octopi.pro
    make

    cd notifier/pacmanhelper
    msg 'Building pacmanhelper…'
    qmake-qt5 QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
              QMAKE_LFLAGS_RELEASE="$LDFLAGS" pacmanhelper.pro
    make

    cd ../octopi-notifier
    msg 'Building octopi-notifier…'
    qmake-qt5 QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
              QMAKE_LFLAGS_RELEASE="$LDFLAGS" octopi-notifier.pro
    make

    cd ../../repoeditor
    msg 'Building octopi-repoeditor…'
    qmake-qt5 QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
              QMAKE_LFLAGS_RELEASE="$LDFLAGS" octopi-repoeditor.pro
    make

    cd ../cachecleaner
    msg 'Building octopi-cachecleaner…'
    qmake-qt5 QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
              QMAKE_LFLAGS_RELEASE="$LDFLAGS" octopi-cachecleaner.pro
    make
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT="$pkgdir" install

    cd notifier/pacmanhelper
    make INSTALL_ROOT="$pkgdir" install
    cd ../..

    cd notifier/octopi-notifier
    make INSTALL_ROOT="$pkgdir" install
    cd ../..

    cd repoeditor
    make INSTALL_ROOT="$pkgdir" install
    cd ..

    cd cachecleaner
    make INSTALL_ROOT="$pkgdir" install
    cd ..

    #speedup files
    install -D -m755 speedup/speedup-octopi.sh "$pkgdir"/usr/bin/speedup-octopi.sh
    install -D -m644 speedup/octopi.service "$pkgdir"/usr/lib/systemd/system/octopi.service

    # Add some icons to customize notifier
    mkdir -p "$pkgdir"/usr/share/octopi/icons/
    cp ../icons/*.png "$pkgdir"/usr/share/octopi/icons/
}
