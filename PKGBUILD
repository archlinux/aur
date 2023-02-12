# Contributor: Sainnhe Park <sainnhe@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ng
pkgver=30.0.50
_fix_commit=487968c
pkgrel=1
pkgdesc="A new approach to Emacs - Including TypeScript, Threading, Async I/O, and WebRender"
arch=('x86_64')
url="https://emacs-ng.github.io/emacs-ng"
license=('GPL3')
provides=('emacs')
conflicts=('emacs')
depends=('jansson' 'ncurses' 'libgccjit' 'librsvg' 'libxpm' 'libjpeg-turbo' 'libtiff'
	 'giflib' 'libpng' 'harfbuzz' 'libxcb' 'libxml2' 'gpm' 'dune' 'dbus' 'lcms2'
	 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'cairo' 'zlib'
	 )
makedepends=('rustup' 'python' 'texlive-core')
source=("$pkgname-$pkgver_${_fix_commit}.tar.gz::https://github.com/emacs-ng/emacs-ng/archive/refs/tags/v0.0.${_fix_commit}.tar.gz")
sha256sums=('733510d7101725f3997a498b5ec2849bde3e7dff237dc702be3ccab652822b2d')
 
prepare() {
    cd ${pkgname}-0.0.${_fix_commit}
    rustup install "$(cat rust-toolchain)"
}

build() {
    cd ${pkgname}-0.0.${_fix_commit}
    RUSTUP_TOOLCHAIN=$(cat rust-toolchain)
    ./autogen.sh
    ./configure CFLAGS="-Wl,-rpath,shared -Wl,--disable-new-dtags" \
        --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var \
        --with-json --with-modules --with-harfbuzz --with-compress-install \
        --with-threads --with-included-regex --with-zlib --with-cairo --with-libsystemd \
        --with-rsvg --with-native-compilation --with-webrender --without-sound \
	--without-imagemagick --with-gpm --with-dbus --without-pop --without-mailutils \
	--without-gsettings --with-all --disable-build-details
        
    make NATIVE_FULL_AOT=1 \
         PATH="$HOME/.rustup/toolchains/${RUSTUP_TOOLCHAIN}-$(uname -m)-unknown-linux-gnu/bin:$PATH"
    make pdf
}

package() {
    cd ${pkgname}-0.0.${_fix_commit}
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-pdf

    # remove conflict with ctags package
    mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
    mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

    # fix user/root permissions on usr/share files
    find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
}
