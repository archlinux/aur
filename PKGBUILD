# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=emacs-ng
pkgver=0.0.6b89399
pkgrel=1
pkgdesc="A new approach to Emacs - Including TypeScript, Threading, Async I/O, and WebRender"
arch=('x86_64')
url="https://emacs-ng.github.io/emacs-ng"
license=('GPL3')
provides=('emacs')
conflicts=('emacs')
depends=('jansson' 'ncurses' 'libgccjit' 'librsvg' 'libxpm' 'libjpeg-turbo' 'libtiff' 'giflib' 'libpng' 'gtk3' 'harfbuzz' 'libxcb' 'libxml2' 'gpm' 'libotf' 'm17n-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'cairo' 'zlib')
makedepends=('clang' 'rustup' 'python')
source=("https://github.com/emacs-ng/emacs-ng/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4bcbb8f5cec37df18ff216e2863b38e729e4fb963c720cc4a91424f69884ee89')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    rustup install "$(cat rust-toolchain)"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    RUSTUP_TOOLCHAIN=$(cat rust-toolchain)
    ./autogen.sh
    ./configure CFLAGS="-Wl,-rpath,shared -Wl,--disable-new-dtags" \
        --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var \
        --with-json --with-modules --with-harfbuzz --with-compress-install \
        --with-threads --with-included-regex --with-zlib --with-cairo --with-libsystemd \
        --with-rsvg --with-native-compilation --with-webrender \
        --without-sound --without-imagemagick --without-makeinfo --without-gpm --without-dbus \
        --without-pop --without-toolkit-scroll-bars --without-mailutils --without-gsettings \
        --with-all
    make NATIVE_FULL_AOT=1 \
        PATH="$HOME/.rustup/toolchains/${RUSTUP_TOOLCHAIN}-$(uname -m)-unknown-linux-gnu/bin:$PATH" \
        -j$(($(nproc) * 2))
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # remove conflict with ctags package
    mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
    mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

    # fix user/root permissions on usr/share files
    _emacs_ver=$(ls "$pkgdir/usr/share/emacs" | grep '[[:digit:]].*')
    find "$pkgdir"/usr/share/emacs/$_emacs_ver -exec chown root:root {} \;
}

