# Maintainer: Dave Reisner <d@falconindy.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: godane <slaxemulator@gmail.com.com>
# Contributor: Andres Perera <aepd87@gmail.com>

pkgname=pacman-git
pkgver=v4.1.0rc1-23
pkgrel=1
pkgdesc="A library-based package manager with dependency support. git version."
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
depends=('bash' 'curl' 'gpgme' 'libarchive' 'pacman-mirrorlist')
makedepends=('git' 'asciidoc')
optdepends=('fakeroot: for makepkg usage as normal user')
checkdepends=('python2' 'fakechroot')
provides=("pacman=$pkgver" 'pacman-contrib' 'libalpm.so')
conflicts=('pacman' 'pacman-contrib')
options=('!libtool' '!strip')
backup=(etc/pacman.conf
        etc/makepkg.conf)
source=(git://projects.archlinux.org/pacman.git)
sha1sums=('SKIP')

pkgver() {
  cd pacman
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd "pacman"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-doc \
    --enable-git-version \
    --enable-debug \
    --with-scriptlet-shell=/usr/bin/bash \
    --with-ldconfig=/usr/bin/ldconfig

  make
  make -C contrib
}

check() {
  make -C "pacman" check
}

package() {
  cd "pacman"

  make DESTDIR="$pkgdir" install

  # set things correctly in the default conf file
  case $CARCH in
    i686)
      mychost="i686-pc-linux-gnu"
      myflags="-march=i686 "
      ;;
    x86_64)
      mychost="x86_64-unknown-linux-gnu"
      myflags="-march=x86-64 "
      ;;
  esac
  sed -i "$pkgdir/etc/makepkg.conf" \
    -e "s|@CARCH[@]|$CARCH|g" \
    -e "s|@CHOST[@]|$mychost|g" \
    -e "s|@CARCHFLAGS[@]|$myflags|g"

  # contrib
  make DESTDIR="$pkgdir" -C contrib install

  install -Dm644 "contrib/PKGBUILD.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/PKGBUILD.vim"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles/ftdetect"
  echo "au BufNewFile,BufRead PKGBUILD set filetype=PKGBUILD" \
    >"$pkgdir/usr/share/vim/vimfiles/ftdetect/PKGBUILD.vim"

  # install completion files
  rm -r "$pkgdir/etc/bash_completion.d"
  install -Dm644 contrib/bash_completion "$pkgdir/usr/share/bash-completion/completions/pacman"
  for f in makepkg pacman-key; do
    ln -s pacman "$pkgdir/usr/share/bash-completion/completions/$f"
  done

  install -Dm644 contrib/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
