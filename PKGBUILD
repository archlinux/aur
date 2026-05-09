# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

# The following people have contributed to keepassxc-git package
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Daniel Landau <daniel@landau.fi>
# Contributor: Maxqia <contrib@maxqia.com>

# The following people have contributed to keepassx-git package
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Jamie Macdonald <jamie.alban@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Paolo Stivanin <admin at polslinux dot it>

pkgname=chipass-git
_gitname=ChiPass
pkgver=r4797.ga9bc441
pkgrel=1
pkgdesc="Modern, secure, and open-source password manager (fork of KeePassXC)"
arch=('i686' 'x86_64')
url="https://chipass.org/"
license=('GPL2')
depends=(
    'argon2'
    'botan'
    'desktop-file-utils'
    'hicolor-icon-theme'
    'libusb'
    'libxi'
    'libxtst'
    'minizip'
    'pcsclite'
    'qrencode'
    'qt6-5compat'
    'qt6-base'
    'qt6-svg'
    'qt6-translations'
    'qt6-wayland'
    'readline'
    'shared-mime-info'
    'zlib'
)
makedepends=(
    'asciidoctor'
    'cmake'
    'git'
    'intltool'
    'qt6-tools'
)
checkdepends=('xorg-server-xvfb' 'xclip')
provides=('org.freedesktop.secrets' "chipass=$pkgver")
conflicts=(
    'chipass'
    # the next two are hopefully temporary, but at the moment ChiPass still uses a lot of the same file paths as KeePassXC
    'keepassxc'
    'keepassxc-git'
)
options=(!emptydirs)
source=(git+https://codeberg.org/ChiPass/ChiPass.git)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    # git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${_gitname}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DWITH_GUI_TESTS=ON \
        -DWITH_XC_ALL=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
    make -C build
}

#check() {
#    cd "${_gitname}/build"
#    xvfb-run --auto-display make test
#}

package() {
    cd "${_gitname}/build"
    make DESTDIR="${pkgdir}" install
}

