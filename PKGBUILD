# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xwm-git
pkgname=xwm-git
pkgver=1.0.0.r11.g96d93c0
pkgrel=8
pkgdesc="XWM (X light Window Manager) is a light-weight window manager for the X11 Window System"
arch=($CARCH)
url="https://gitee.com/xinligg/xwm"
license=('GPL-2.0-or-later')
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    cairo
    bash
    glib2
    glibc
    fribidi
    libpng
    libjpeg-turbo
    librsvg
    libx11
    libxext
    libxft
    libxrender
    libxmu
    libxinerama
    libxpm)
makedepends=(
    autoconf
    automake
    coreutils
    gettext
    git
    m4
    pkgconf)
checkdepends=()
optdepends=(
    'gnome-terminal: The GNOME Terminal Emulator'
    'rxvt-unicode: Unicode enabled rxvt-clone terminal emulator (urxvt)'
    'konsole: KDE terminal emulator'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    ./autogen.sh
    ./configure \
        --enable-nls \
        --prefix=/usr \
        --sysconfdir=/etc

    make update-po
    make update-gmo
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install
}
