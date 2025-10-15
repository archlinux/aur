# Maintainer: Your Name <your.email@example.com>
pkgname=wine-asahi-git
pkgver=10.16
pkgrel=1
pkgdesc="Wine with ARM64EC support for Asahi Linux (16k pages)"
arch=('aarch64')
url="https://www.winehq.org/"
license=('LGPL-2.1-or-later')
depends=(
    'desktop-file-utils'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'gettext'
    'gst-plugins-base-libs'
    'libgphoto2'
    'libpcap'
    'libusb'
    'libx11'
    'libxext'
    'libxrandr'
    'libxrender'
    'libxinerama'
    'libxcomposite'
    'libxcursor'
    'libxi'
    'libxxf86vm'
    'alsa-lib'
    'gnutls'
    'vulkan-icd-loader'
    'sdl2'
    'v4l-utils'
    'libcups'
    'sane'
    'libgcrypt'
    'libpulse'
    'opencl-icd-loader'
    'libldap'
    'mpg123'
    'gst-plugins-base'
    'systemd-libs'
    'fex-emu-wine'
)
makedepends=(
    'git'
    'autoconf'
    'bison'
    'flex'
    'clang'
    'lld'
    'llvm'
    'gcc'
    'make'
    'linux-api-headers'
    'alsa-lib'
    'cups'
    'dbus'
    'fontconfig'
    'freetype2'
    'gettext'
    'giflib'
    'gnutls'
    'gst-plugins-base-libs'
    'libgphoto2'
    'libpcap'
    'libpulse'
    'libusb'
    'libx11'
    'libxcomposite'
    'libxcursor'
    'libxext'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libxxf86vm'
    'mesa'
    'mpg123'
    'opencl-headers'
    'ocl-icd'
    'openldap'
    'sane'
    'sdl2'
    'systemd'
    'v4l-utils'
    'vulkan-headers'
    'vulkan-icd-loader'
    'libxkbcommon'
    'wayland'
    'icoutils'
    'librsvg'
    'unixodbc'
    'libieee1284'
    'libpcap'
    'gsm'
    'gtk3'
    'libva'
)
provides=('wine' 'wine-wow64' 'wine-arm64ec-git')
conflicts=('wine' 'wine-arm64ec-git')
options=('staticlibs' '!lto')
install=wine-asahi.install

source=(
    "wine::git+https://gitlab.winehq.org/wine/wine.git#tag=wine-10.16"
    "wine-staging::git+https://gitlab.winehq.org/wine/wine-staging.git#tag=v10.16"
    "2025.08.22_bylaws-wine_upstream-arm64ec_hack_v2.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/wine"
    git describe --tags | sed 's/^wine-//;s/-/./g'
}

prepare() {
    cd "$srcdir/wine"

    # Apply wine-staging patches
    "$srcdir/wine-staging/staging/patchinstall.py" DESTDIR="$PWD" --all -W server-Stored_ACLs

    # Apply ARM64EC patches
    # Note: Wine 10.16 already has built-in ntsync support, no patch needed
    patch -Np1 -F3 -i "$srcdir/2025.08.22_bylaws-wine_upstream-arm64ec_hack_v2.patch"

    # Remove -Wl,-WX flag that causes issues with --as-needed
    sed -i 's/-Wl,-WX//g' configure

    autoreconf -fiv
}

build() {
    cd "$srcdir/wine"

    # Remove problematic flags
    export CFLAGS="${CFLAGS/-fcf-protection/}"
    export CFLAGS="${CFLAGS/-fstack-protector-strong/}"
    export CFLAGS="${CFLAGS/-fstack-clash-protection/}"
    export CFLAGS="${CFLAGS/-mbranch-protection=standard/}"
    export CXXFLAGS="${CXXFLAGS/-fcf-protection/}"
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/}"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/}"
    export CXXFLAGS="${CXXFLAGS/-mbranch-protection=standard/}"

    # Disable fortify
    export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=2/}"
    export CPPFLAGS="${CPPFLAGS/-D_FORTIFY_SOURCE=3/}"

    # Clean LDFLAGS - remove problematic linker flags
    export LDFLAGS="${LDFLAGS/-Wl,-z,relro/}"
    export LDFLAGS="${LDFLAGS/-Wl,--as-needed/}"
    export LDFLAGS="${LDFLAGS/--as-needed/}"
    # Remove any empty -Wl, flags that might be left behind
    export LDFLAGS="${LDFLAGS/-Wl, /}"

    # Required for development files
    unset PKG_CONFIG_PATH

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --sysconfdir=/etc/wine \
        --with-x \
        --with-dbus \
        --with-wayland \
        --with-xattr \
        --enable-win64 \
        --enable-archs=arm64ec,aarch64,i386 \
        --with-mingw=clang \
        --disable-tests

    make
}

package() {
    cd "$srcdir/wine"

    make prefix="$pkgdir/usr" \
         libdir="$pkgdir/usr/lib" \
         dlldir="$pkgdir/usr/lib/wine" \
         install

    # Setup wine/wineserver alternatives
    mv "$pkgdir/usr/bin/wine" "$pkgdir/usr/bin/wine64"
    mv "$pkgdir/usr/bin/wineserver" "$pkgdir/usr/bin/wineserver64"
    ln -s wine64 "$pkgdir/usr/bin/wine"
    ln -s wineserver64 "$pkgdir/usr/bin/wineserver"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
