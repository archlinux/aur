# Maintainer:
# Contributor: Pedro A. López-Valencia <https://aur.archlinux.org/users/palopezv>

#######################################################################
# This is based on emacs-git and all the props to that PKGBUILD
#######################################################################

#######################################################################
# CAVEAT LECTOR: This PKGBUILD is highly opinionated. I give you
#                enough rope to hang yourself, but by default it
#                only enables the features I use.
#
# TL;DR: yaourt users, cry me a river.
#
#######################################################################

#######################################################################
# Assign "YES" to the variable you want enabled; empty or other value
# for NO.
#
# Where you read experimental, replace with foobar.
# =================================================
#
#######################################################################
CLANG=            # Use clang.
LTO=              # Enable link-time optimization. Experimental.
ATHENA=           # Use Athena widgets. (83 1337, 83 001d sk00l).
GTK2=             # Leave empty to compile with gtk+ 3 support.
                  # No, gtk+ 2 ain't kool, dawg!
NOGTK3=           # Leave empty to compile with gtk+ 3 support.
GPM=              # Enable gpm support.
M17N=             # Enable m17n international support.
OTF="YES"         # OTF font support. Also a secondary dependency
                  # by pulling m17n-lib. Not needed in that case.
CAIRO=            # Highly experimental.
XWIDGETS="YES"    # Use GTK+ widgets pulled from webkit2gtk. Usable.
DOCS_HTML=        # Generate and install html documentation.
DOCS_PDF=         # Generate and install pdf documentation.
MAGICK="YES"      # Imagemagick is like flash; and still needed :-(
NOGZ="YES"        # Don't compress el files. Info and man pages are
                  # compressed by hooks anyway.
#######################################################################

#######################################################################
pkgname=emacs-git-shallow
pkgver=27.0.50.20170929T1655
pkgrel=1
pkgdesc="GNU Emacs [master] (shallow clone [20% disk space])"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL3')
depends=( 'alsa-lib' )
makedepends=( 'git' )
#######################################################################

#######################################################################
if [[ $CLANG = "YES" ]]; then
  export CC=/usr/bin/clang ;
  export CXX=/usr/bin/clang++ ;
  makedepends+=( 'clang') ;
fi

if [[ $ATHENA = "YES" ]]; then
  depends+=( 'libxaw' );
fi

if [[ $GTK2 = "YES" ]]; then
  depends+=( 'gtk2' );
else
  if [[ ! $NOGTK3 = "YES" ]]; then
    depends+=( 'gtk3' );
  fi
fi

if [[ $GPM = "YES" ]]; then
  depends+=( 'gpm');
fi

if [[ $M17N = "YES" ]]; then
  depends+=( 'm17n-lib' );
fi

if [[ $OTF = "YES" ]] && [[ ! $M17N = "YES" ]]; then
  depends+=( 'libotf' );
fi

if [[ $MAGICK = "YES" ]]; then
  depends+=( 'imagemagick' );
  depends+=( 'libxpm' 'libjpeg-turbo' 'libtiff' );
  depends+=( 'giflib' 'libpng' 'librsvg' );
elif [[ ! $NOX = "YES" ]]; then
  depends+=( 'libxpm' 'libjpeg-turbo' 'libtiff' );
  depends+=( 'giflib' 'libpng' 'librsvg' );
else
  depends+=();
fi

if [[ $CAIRO = "YES" ]]; then
  depends+=( 'cairo' );
fi

if [[ $XWIDGETS = "YES" ]]; then
  if [[ $GTK2 = "YES" ]] || [[ $ATHENA = "YES" ]]; then
    echo "";
    echo "";
    echo "Xwidgets support *requires* gtk+3!!!";
    echo "";
    echo "";
    exit 1;
    else
      depends+=( 'webkit2gtk' );
  fi
fi

if [[ $DOCS_PDF = "YES" ]]; then
  makedepends+=( 'texlive-core' );
fi
#######################################################################

#######################################################################
conflicts=('emacs' 'emacs-git')
provides=('emacs')
#source=("$pkgname::git://git.savannah.gnu.org/emacs.git#branch=master")
#source=("$pkgname::git+https://git.savannah.gnu.org/git/emacs.git#branch=master")
#source=("$pkgname::git+https://github.com/emacs-mirror/emacs.git")
#md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" \
    "$(grep AC_INIT configure.ac | \
    sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\?\).\+$/\1/')" \
    "$(date +%Y%m%dT%H%M)"
}


# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental compilation.
prepare() {
  cd "$srcdir"

  rm -rf $pkgname
  git clone --depth=1 https://github.com/emacs-mirror/emacs.git $pkgname

  cd "$pkgname"

  [[ -x configure ]] || ( ./autogen.sh git && ./autogen.sh autoconf )
}

build() {
  cd "$srcdir/$pkgname"

  # Avoid hardening-wrapper (taken from emacs-pretest, thanks to Thomas Jost).
  export PATH=$(echo "$PATH" | sed 's!/usr/lib/hardening-wrapper/bin!!g')

  local _conf=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --mandir=/usr/share/man
    --with-gameuser=:games
    --with-sound=alsa
    --with-xft
    --with-modules
  )

#######################################################################

#######################################################################
if [[ $CLANG = "YES" ]]; then
  _conf+=(
    '--enable-autodepend'
 );
fi
if [[ $LTO = "YES" ]]; then
  _conf+=(
    '--enable-link-time-optimization'
  );
fi

if [[ $ATHENA = "YES" ]]; then
  _conf+=(
    '--with-x-toolkit=athena'
    '--without-gconf'
    '--without-gsettings'
  );
fi

# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings set in ~/.emacs
# If you insist you'll need to play gymnastics with
# set-frame-font and set-menu-font. Good luck!
if [[ $GTK2 = "YES" ]]; then
  #_conf+=( '--with-x-toolkit=gtk2' '--with-gconf' '--without-gsettings' );
  _conf+=( '--with-x-toolkit=gtk2' '--without-gconf' '--without-gsettings' );
else
  #_conf+=( '--with-x-toolkit=gtk3' '--without-gconf' '--with-gsettings' );
  _conf+=( '--with-x-toolkit=gtk3' '--without-gconf' '--without-gsettings' );
fi

if [[ ! $GPM = "YES" ]]; then
  _conf+=( '--without-gpm' );
fi

if [[ ! $M17N = "YES" ]]; then
  _conf+=( '--without-m17n-flt' );
fi

#if [[ $IMAGICK = "YES" ]]; then
#  _conf+=(
#    '--with-imagemagick'
# );
#else
#  _conf+=( '--without-imagemagick' );
#fi

if [[ $CAIRO = "YES" ]]; then
  _conf+=( '--with-cairo' );
fi

if [[ $XWIDGETS = "YES" ]]; then
  _conf+=( '--with-xwidgets' );
fi

if [[ $NOGZ = "YES" ]]; then
  _conf+=( '--without-compress-install' );
fi
#######################################################################

#######################################################################

  ./configure "${_conf[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But you may
  # need to use bootstrap sometimes to unbreak the build.
  # Just add it to the command line.
  #
  # Please note that incremental compilation implies that you
  # are reusing your src directory!
  #
  make

  # You may need to run this if 'loaddefs.el' files corrupt.
  #cd "$srcdir/$pkgname/lisp"
  #make autoloads
  #cd ../

  # Optional documentation formats.
  if [[ $DOCS_HTML = "YES" ]]; then
    make html;
  fi
  if [[ $DOCS_PDF = "YES" ]]; then
    make pdf;
  fi
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  # Install optional documentation formats
  if [[ $DOCS_HTML = "YES" ]]; then make DESTDIR="$pkgdir/" install-html; fi
  if [[ $DOCS_PDF = "YES" ]]; then make DESTDIR="$pkgdir/" install-pdf; fi

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}

  if [[ $NOGZ = "YES" ]]; then
    mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1};
  else
    mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}
  fi

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root

  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games

  # The logic used to install systemd's user service is partially broken
  # under Arch Linux model, because it adds $DESTDIR as prefix to the
  # final Exec targets. The fix is to hack it with an axe.
  install -Dm644 etc/emacs.service \
    "$pkgdir"/usr/lib/systemd/user/emacs.service
  sed -i -e 's#\(ExecStart\=\)#\1\/usr\/bin\/#' \
    -e 's#\(ExecStop\=\)#\1\/usr\/bin\/#' \
    "$pkgdir"/usr/lib/systemd/user/emacs.service
}

# vim:set ft=sh ts=2 sw=2 et:
