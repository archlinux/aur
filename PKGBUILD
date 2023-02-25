# Contributor: Sainnhe Park <sainnhe@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ng
pkgver=30.0.50
_fix_commit=81af881
pkgrel=5
pkgdesc="A new approach to Emacs - Including TypeScript, Threading, Async I/O, and WebRender"
arch=('x86_64')
url="https://emacs-ng.github.io/emacs-ng"
license=('GPL3')
provides=('emacs')
conflicts=('emacs')
depends=('jansson' 'ncurses' 'libgccjit' 'librsvg' 'libxpm' 'libjpeg-turbo' 'libtiff'
	 'giflib' 'libpng' 'harfbuzz' 'libxcb' 'libxml2' 'gpm' 'dune' 'dbus' 'lcms2'
	 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'gnutls' 'cairo' 'zlib'
	 'tree-sitter' 'mailutils' 'sqlite' 'clang')
makedepends=('rustup' 'git' 'python' 'texlive-core')
source=("$pkgname-$pkgver_${_fix_commit}.tar.gz::https://github.com/emacs-ng/emacs-ng/archive/refs/tags/v0.0.${_fix_commit}.tar.gz")
#source=(git+https://github.com/emacs-ng/emacs-ng)
sha256sums=('36c8305e13b01ae40d5a7bf4e1f67cf16b6a6b523e241f35c34429ffab5d718f')
 
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
              --with-threads --with-included-regex --with-zlib --with-cairo \
	      --with-libsystemd --with-rsvg --with-native-compilation=aot \
	      --with-webrender --enable-webrender-x11 --without-sound \
	      --without-imagemagick --with-gpm --with-dbus --without-pop \
	      --with-mailutils --with-gsettings --disable-build-details 
        
  make NATIVE_FULL_AOT=1 \
       PATH="$HOME/.rustup/toolchains/${RUSTUP_TOOLCHAIN}-$(uname -m)-unknown-linux-gnu/bin:$PATH" bootstrap
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
