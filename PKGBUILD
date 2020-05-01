# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Chris Nixon <chris.nixon@sigma.me.uk>

pkgname=remacs
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc='Emacs with parts of it written in Rust'
arch=(x86_64)
url='https://github.com/remacs/remacs'
license=(GPL)
depends=(gnutls gpm libxml2)
makedepends=(cargo clang git rustup setconf)
source=("git+https://github.com/remacs/remacs#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $pkgname

  ./autogen.sh

  # Use full path to remacs and remacsclient
  setconf etc/remacs.service ExecStart '/usr/bin/remacs --fg-daemon'
  setconf etc/remacs.service ExecStop '/usr/bin/remacsclient --eval "(kill-emacs)"'
}

build() {
  cd $pkgname

  export LC_ALL=C
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --with-sound=no \
    --with-modules \
    --without-xft \
    --without-gconf \
    --without-gsettings \
    --without-cairo \
    --without-xwidgets \
    --without-makeinfo \
    --without-x \
    --enable-link-time-optimization
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install-strip

  # avoid conflicts with other packages
  rm "$pkgdir/usr/"{bin/{ctags,etags,ebrowse},share/man/man1/{ctags,etags,ebrowse}.1.gz}
  mv "$pkgdir/usr/share/man/man1/"{e,re}macs.1.gz
  mv "$pkgdir/usr/share/man/man1/"{e,re}macsclient.1.gz
  rm -r "$pkgdir/usr/share/info"

  # skip /var/games, /usr/share/pixmaps and /usr/share/applications
  rm -rf "$pkgdir/"{var/games,usr/share/{pixmaps,applications}}

  # fix permissions
  find "$pkgdir"/usr/share/remacs/ -exec chown root:root {} \;
}

# vim: ts=2 sw=2 et:
