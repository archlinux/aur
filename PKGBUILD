# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: kikadf <kikadf.01@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

# Default notifier is use simply qt5
# To use with Knotifications support, uncomment line below
#USE_NOTIFIER='1'

# Default source is the latest release tarball
# To use a specified git version, uncomment line below and set to the git commit hash
#USE_SOURCE='251822c88747c216c6ebb9a342a80097ee744117'

# Default build with qtermwidget support
# To disable, uncomment line below
#DISABLE_QTERMWIDGET='1'

# Default build with pikaur support
# To disable, uncomment line below
#DISABLE_PIKAUR='1'

pkgname=octopi
pkgver=0.9.0
pkgrel=1
pkgdesc="A powerful Pacman frontend using Qt libs"
url="http://octopiproject.wordpress.com"
arch=('x86_64')
license=('GPL2')
depends=('qtermwidget' 'pkgfile' 'alpm_octopi_utils' 'qt5-declarative' 'pacman-contrib')
[[ ${USE_NOTIFIER} == "1" ]] && depends+=('knotifications')
[[ ${DISABLE_QTERMWIDGET} == "1" ]] && unset depends[0]
makedepends=('git')
optdepends=('pikaur: for AUR support'
            'yaourt: for AUR support'
            'pacaur: for AUR support'
            'trizen: for AUR support'
            'pacmanlogviewer: to view pacman log files'
            'gksu: for XFCE, Gnome, LXDE, Cinnamon'
            'lxqt-sudo: for LXQT')
[[ ${USE_NOTIFIER} == "1" ]] && optdepends+=('kdesu: for KDE')
[[ ${DISABLE_PIKAUR} == "1" ]] && unset optdepends[0]
provides=('octopi-kde-git')
conflicts=('octopi-git' 'octopi-kde-git')
source=('octopi-repoeditor.desktop'
        "https://code.chakralinux.org/packages/desktop/raw/master/octopi/0001-remove-qtermwidget.patch"
        "https://gitlab.com/kikadf/patches/raw/master/octopi/0002-add-pikaur-support.patch"
        "icons::git+https://gitlab.com/kikadf/octopicons.git")
sha256sums=('131f16745df685430db55e54ede6da66aed9b02ca00d6d873a002b2a3e1c90ef'
            'bdf668ae3bcbac4bf908d96ce4115bac77bf8d4e58796d12fc2cd4e8ee8294e7'
            '18d3ee70f520045035c5d9ede6dc5e6121f0f258fe4eaa743551aaf6bd9b0181'
            'SKIP')
if [ "${USE_SOURCE}" = "" ]; then
    source+=("$pkgname.$pkgver.tar.gz::https://github.com/aarnt/$pkgname/archive/v$pkgver.tar.gz")
    sha256sums+=('f6c7fe6bbcc26a79b1e455a42a8dc906bee4edd1b386b4f76178f006f4d7f822')
    _cd_path="${pkgname}-${pkgver}"
else
    source+=("${pkgname}-${USE_SOURCE}.tar.gz::https://github.com/aarnt/octopi/archive/${USE_SOURCE}.tar.gz")
    sha256sums+=('SKIP')
    _cd_path="${pkgname}-${USE_SOURCE}"
fi

prepare() {
    cd "$_cd_path"

    # disable lxqt qtermwidget
    [[ ${DISABLE_QTERMWIDGET} == "1" ]] && patch -Np1 -i ../0001-remove-qtermwidget.patch && rm -rfv src/termwidget.{cpp,h}

    # add pikaur support
    [[ ${DISABLE_PIKAUR} == "" ]] && patch -Np1 -i ../0002-add-pikaur-support.patch

    # enable the kstatus switch to build with Plasma/knotifications support
    [[ ${USE_NOTIFIER} == "1" ]] && sed -e "s|DEFINES += ALPM_BACKEND #KSTATUS|DEFINES += ALPM_BACKEND KSTATUS|" -i notifier/octopi-notifier/octopi-notifier.pro

    # set version
    [[ ${USE_SOURCE} != "" ]] && sed -e "s|${pkgver}|${pkgver} (${USE_SOURCE})|g" -i src/strconstants.cpp

    cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
    cd "$_cd_path"
    [[ ${DISABLE_QTERMWIDGET} == '1' ]] && export QTERMWIDGET=off
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
    cd "$_cd_path"
    make INSTALL_ROOT="$pkgdir" install

    cd notifier/pacmanhelper
    make INSTALL_ROOT="$pkgdir" install
    cd ../..

    cd notifier/octopi-notifier
    make INSTALL_ROOT="$pkgdir" install
    cd ../..

    cd repoeditor
    make INSTALL_ROOT="$pkgdir" install
    install -D -m644 "$srcdir"/octopi-repoeditor.desktop "$pkgdir"/usr/share/applications/octopi-repoeditor.desktop

    cd ../cachecleaner
    make INSTALL_ROOT="$pkgdir" install
    cd ..

    #speedup files
    install -D -m755 speedup/speedup-octopi.sh "$pkgdir"/usr/bin/speedup-octopi.sh
    install -D -m644 speedup/octopi.service "$pkgdir"/usr/lib/systemd/system/octopi.service

    # Add some icons to customize notifier
    mkdir -p "$pkgdir"/usr/share/octopi/icons/
    cp ../icons/*.png "$pkgdir"/usr/share/octopi/icons/
}
