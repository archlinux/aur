# Maintainer: Konzertheld <aur /at/ konzertheld.de>
# Contributor: mrdotx <klassiker@gmx.de>
# Contributor: nutcase84 <nutcase84 at protronmail dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert CzobodziЕ„ski <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>
_pkgname=ddccontrol
pkgname=ddccontrol-git
pkgver=20240131.ra43b4c3
pkgrel=1
pkgdesc='Control your monitor by software using the DDC/CI protocol.'
arch=('i686' 'x86_64')
url='https://github.com/ddccontrol/ddccontrol'
license=('GPL')
depends=(
    'pciutils'
    'libxml2'
    'ddccontrol-db-git'
)
makedepends=(
    'git'
    'intltool'
    'glib2-devel'
)
provides=('ddccontrol')
conflicts=('ddccontrol')
source=(git+https://github.com/ddccontrol/ddccontrol.git)
options=('!libtool')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    _gitver="$(git show -s --format="%ci %h" 2> /dev/null)"
    _gitver="${_gitver//[^[:alnum:][:space:]]/}"

    echo "${_gitver%% *}.r${_gitver##* }"
}

prepare() {
    cd "$_pkgname"
    # PKGBUILD should be non-interactive...
    sed -e 's:read dummy < /dev/tty::' "$(which gettextize)" > gettextize
    chmod +x gettextize

    sed -e 's:^gettextize :./gettextize :' -i autogen.sh
}

build() {
    cd "$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
