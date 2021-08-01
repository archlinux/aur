# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sainnhe Park <sainnhe@gmail.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: alienzj <alienchuj@gmail.com>
# Contributor: Steven Tang <xosdy.t@gmail.com>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-ng-git
pkgver=r149638.79390ea31d
pkgrel=1
epoch=1
pkgdesc="A new approach to Emacs - Including TypeScript, Threading, Async I/O, and WebRender"
arch=(x86_64)
url="https://emacs-ng.github.io/emacs-ng/"
license=(GPL3)
depends=(texinfo libjpeg-turbo libtiff librsvg gpm giflib libxpm libotf m17n-lib gtk3 gnutls
         jansson cairo harfbuzz ncurses libxml2 libxt zlib libgccjit)
makedepends=(git rustup)
provides=(emacs emacs-ng)
conflicts=(emacs emacs-ng)
source=("git+https://github.com/emacs-ng/emacs-ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  rustup install "$(cat rust-toolchain)"
  RUSTUP_TOOLCHAIN=$(cat rust-toolchain)
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --with-x-toolkit=gtk3 \
    --with-xft \
    --with-wide-int \
    --with-modules \
    --with-cairo \
    --with-harfbuzz \
    --with-nativecomp \
    --with-webrender

  make NATIVE_FULL_AOT=1 \
       PATH="$HOME/.rustup/toolchains/${RUSTUP_TOOLCHAIN}-$(uname -m)-unknown-linux-gnu/bin:$PATH"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install

  # remove conflict with ctags package
  mv "${pkgdir}/usr/bin/ctags" "${pkgdir}/usr/bin/ctags.emacs"
  mv "${pkgdir}/usr/share/man/man1/ctags.1.gz" "${pkgdir}/usr/share/man/man1/ctags.emacs.1"
  
  # fix user/root permissions on usr/share files
  find "${pkgdir}/usr/share/emacs/${pkgver}" -exec chown root:root {} \;
}
