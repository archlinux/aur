# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xwm-git
pkgname=xwm-git
pkgver=1.0.0beta1.r18.g4d45ae1
pkgrel=1
pkgdesc="XWM (X light Window Manager) XWM is a light-weight window manager forked from jwm for the X11 Window System."
arch=(
    aarch64
    riscv64
    x86_64)
url="https://gitee.com/xinligg/xwm"
license=('GPL-2.0-only')
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    cairo
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
    sed)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export AUTOMAKE=true
    cd "${srcdir}/${pkgname}"

    autoupdate
    ./autogen.sh
    ./configure \
        --enable-nls \
        --prefix=/usr \
        --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install
    install -Dm0644 data/${pkgname%-git}.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm0755 data/autostart -t ${pkgdir}/etc/xdg/xwm/
}
