# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: <tmoore01 (at) gmail (dot) com>

_pkgname=evolution
pkgname=$_pkgname-git
pkgver=3.46.0.r124.g2c38d86545
pkgrel=1
pkgdesc="Manage your email, contacts and schedule - git version"
arch=(i686 x86_64)
license=(GPL)
depends=(
         cmark
         evolution-data-server
         gnome-autoar
         gnome-common
         gnome-desktop
         gspell
         gtkspell3
         libcanberra
         libchamplain
         libcryptui
         libpst
         libytnef
         nss
         )
makedepends=(dconf
             desktop-file-utils
             docbook-xsl
             evolution-data-server
             gnome-desktop
             gtkspell3
             hicolor-icon-theme
             highlight
             itstool
             libcanberra
             libcryptui
             libpst
             libytnef
             networkmanager
             )
optdepends=('highlight: text highlight plugin')
options=('!emptydirs' 'debug' 'strip')
url="https://wiki.gnome.org/Apps/Evolution"
conflicts=('evolution' 'evolution-bogofilter' 'evolution-spamassassin')
replaces=('evolution' 'evolution-bogofilter' 'evolution-spamassassin')
provides=('evolution' 'evolution-bogofilter' 'evolution-spamassassin')
install=$_pkgname.install
source=(evolution::git+https://gitlab.gnome.org/GNOME/evolution.git)
sha256sums=('SKIP')

pkgver() {
        cd $srcdir/$_pkgname
        git describe --long | awk -F '-' '/-/{ printf "%s.r%3.3d.%s\n", $1, $2, $3 }'
}

build() {
        cd $srcdir/$_pkgname

        [ ! -d build ] && mkdir build
        cd build

        cmake .. -G Ninja \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIBEXEC_INSTALL_DIR=/usr/lib \
                -DSYSCONF_INSTALL_DIR=/etc \
                -DENABLE_CONTACT_MAPS=ON \
                -DENABLE_GTK_DOC=ON \
                -DENABLE_PLUGINS=all \
                -DENABLE_SMIME=ON \
                -DENABLE_WEATHER=OFF \

        ninja
}

package() {
        cd $srcdir/$_pkgname/build
        DESTDIR="$pkgdir" ninja install
}

