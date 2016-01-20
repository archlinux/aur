# Maintainer: <craven@gmx.net>
pkgname=mit-scheme-git
pkgver=20160120
pkgrel=1
pkgdesc="MIT/GNU Scheme is an implementation of the Scheme programming language, providing an interpreter, compiler, source-code debugger, integrated Emacs-like editor, and a large runtime library."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/mit-scheme/"
license=('GPL')
groups=()
depends=('glibc' 'ncurses' 'zlib' 'mit-scheme' 'libx11')
optdepends=('mhash: support for mhash' 'gdbm: support for gdbm'
            'postgresql-libs: support for postresql' 'openssl: support for openssl'
            'mcrypt: support for mcrypt' 'db: support for berkeley db')
makedepends=('git' 'texinfo' 'texlive-core')
provides=('mit-scheme')
conflicts=('mit-scheme')
replaces=()
backup=()
options=()
install=
source=()


noextract=()
#generate with 'makepkg -g'

_gitroot=git://git.savannah.gnu.org/mit-scheme.git
_gitname=mit-scheme

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
      cd "$_gitname" && git pull origin
      msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cd src
  ./Setup.sh
  ./configure --prefix=/usr --with-x --enable-native-code
  make

  cd ../doc
  autoconf
  ./configure --prefix=/usr
  make -j 1 || true
}

package() {
  cd "$srcdir/$_gitname-build"
  cd src
  make DESTDIR="$pkgdir/" install

  cd ../doc
  make DESTDIR="$pkgdir/" install || true
  rm "$pkgdir"/usr/share/info/dir
}

mit_scheme_infodir=usr/share/info

mit_scheme_filelist=(mit-scheme-ffi.info mit-scheme-imail.info mit-scheme-ref.info mit-scheme-sos.info mit-scheme-user.info)



post_install() {

  [[ -x usr/bin/install-info ]] || return 0

  for file in "${mit_scheme_filelist[@]}"; do

    install-info "$mit_scheme_infodir/$file.gz" "$mit_scheme_infodir/dir" 2> /dev/null

  done

}



post_upgrade() {

  post_install "$1"

}



pre_remove() {

  [[ -x usr/bin/install-info ]] || return 1

  for file in "${mit_scheme_filelist[@]}"; do

    install-info --delete "$mit_scheme_infodir/$file.gz" "$mit_scheme_infodir/dir" 2>/dev/null

  done

}

# vim:set ts=2 sw=2 et:
