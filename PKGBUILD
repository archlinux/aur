# Maintainer: Karthik Viswanath <https://aur.archlinux.org/account/paranoidsp>
# Maintainer of emacs-git: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>

################################################################################
# Modified version of emacs-git with AOT enabled
################################################################################

################################################################################
# CAVEAT LECTOR: This PKGBUILD is highly opinionated. I give you
#                enough rope to hang yourself, but by default it
#                only enables the features I use.
#
#        TLDR: yaourt users, cry me a river.
#
#        Everyone else: do not update blindly this PKGBUILD. At least
#        make sure to compare and understand the changes.
#
################################################################################

################################################################################
# Assign "YES" to the variable you want enabled; empty or any other value
# for NO.
#
# Where you read experimental, replace with foobar.
# =================================================

################################################################################

USE_ALL_CPU_CORES="YES" # Do you want to use all CPU cores?

CHECK=            # Run tests. May fail, this is developement after all.

CLANG=            # Use clang.

GOLD=             # Use the gold linker.

LTO=              # Enable link-time optimization. Still experimental.

MOLD="YES"        # Use the mold linker.
                  # This is the default linker.
                  # Notice that it will always be used.

JIT="YES"         # Enable native just-in-time compilation. Use libgccjit,
                  # which is in testing repo for now.
                  #
                  # This compiles only performance critical elisp files.
                  #
                  # To compile all elisp on demand, add
                  #    (setq comp-deferred-compilation t)
                  # to your .emacs file.

AOT="YES"         # Precompile all included elisp. It takes a long time.
                  # You still need to enable on-demand compilation
                  # for your own packages.

CLI=              # CLI only binary.

XINPUT2=          # Use Xinput2 support.
                  # https://www.x.org/releases/X11R7.7/doc/inputproto/XI2proto.txt
                  # This is useless with pgtk.

GPM="YES"         # Mouse support in Linux console using gmpd.

NOTKIT=           # Use no toolkit widgets. Like B&W Twm (001d sk00l).
                  # Bitmap fonts only, 1337!

LUCID=            # Use the lucid, a.k.a athena, toolkit. Like XEmacs, sorta.
                  #
                  # Read https://wiki.archlinux.org/index.php/X_resources
                  # https://en.wikipedia.org/wiki/X_resources
                  # and https://www.emacswiki.org/emacs/XftGnuEmacs
                  # for some tips on using outline fonts with
                  # Xft, if you choose no toolkit or Lucid.
                  #

ALSA="YES"        # Linux sound support.

NOCAIRO=          # Disable here.

XWIDGETS="YES"    # Use GTK+ widgets pulled from webkit2gtk. Usable.
                  # Thanks to Po Lu, xwidgets supports pgtk now!

PGTK=             # Wayland is awesome!

DOCS_HTML=        # Generate and install html documentation.

DOCS_PDF=         # Generate and install pdf documentation.

NOGZ="YES"        # Don't compress .el files.
################################################################################

################################################################################
if [[ $CLI == "YES" ]] ; then
  pkgname="emacs-nox-git"
else
pkgname="emacs-git-aot"
fi
pkgver=30.0.50.165991
pkgrel=1
pkgdesc="GNU Emacs with AOT and xwidgets"
arch=('x86_64')
url="http://www.gnu.org/software/emacs/"
license=('GPL3')
depends_nox=('gnutls' 'libxml2' 'jansson')
depends=("${depends_nox[@]}" 'harfbuzz')
makedepends=('git' 'mold')
provides=('emacs')
conflicts=('emacs')
replaces=('emacs')
source=("emacs-git::git+https://git.savannah.gnu.org/git/emacs.git")
# If Savannah fails for reasons, use Github's mirror
#source=("emacs-git::git+https://github.com/emacs-mirror/emacs.git")
options=(!strip)
install=emacs-git.install
b2sums=('SKIP')
################################################################################

################################################################################

if [[ $GOLD == "YES" && ! $CLANG == "YES" ]]; then
  export LD=/usr/bin/ld.gold
  export CFLAGS+=" -fuse-ld=gold";
  export CXXFLAGS+=" -fuse-ld=gold";
elif [[ $GOLD == "YES" && $CLANG == "YES" ]]; then
  echo "";
  echo "Clang rather uses its own linker or mold.";
  echo "";
  exit 1;
fi

if [[ $MOLD == "YES" && ! $CLANG == "YES" ]]; then
  # Make sure mold is available in /usr/bin/mold, or
  # you could specify another path to mold.
  makedepends+=( 'mold' )
  export LD=/usr/bin/mold
  export CFLAGS+=" -fuse-ld=gold";
  export CXXFLAGS+=" -fuse-ld=gold";
fi

if [[ $CLANG == "YES" ]]; then
  export CC="/usr/bin/clang" ;
  export CXX="/usr/bin/clang++" ;
  export CPP="/usr/bin/clang -E" ;
  export AR="/usr/bin/llvm-ar" ;
  export AS="/usr/bin/llvm-as" ;
  makedepends+=( 'clang' 'llvm') ;
  if [[ ! $MOLD == "YES" ]]; then
  makedepends+=( 'mold' )
  export LD="/usr/bin/lld" ;
  export CCFLAGS+=' -fuse-ld=lld' ;
  export CXXFLAGS+=' -fuse-ld=lld' ;
  export CFLAGS+=" --ld-path=/usr/bin/mold";
  export CXXFLAGS+=" --ld-path=/usr/bin/mold";
  else
  makedepends+=( 'lld' )
  export LD="/usr/bin/lld" ;
  fi
fi

if [[ $JIT == "YES" ]]; then
  if [[ $CLI == "YES" ]]; then
    depends_nox+=( 'libgccjit' );
  else
    depends+=( 'libgccjit' );
  fi
fi

if [[ $CLI == "YES" ]]; then
  depends=("${depends_nox[@]}");
elif [[ $NOTKIT == "YES" ]]; then
  depends+=( 'dbus' 'hicolor-icon-theme' 'libxinerama' 'libxrandr' 'lcms2' 'librsvg' 'libxfixes' 'libxi');
  makedepends+=( 'xorgproto' );
elif [[ $LUCID == "YES" ]]; then
  depends+=( 'dbus' 'hicolor-icon-theme' 'libxinerama' 'libxfixes' 'lcms2' 'librsvg' 'xaw3d' 'libxrandr' 'libxi');
  makedepends+=( 'xorgproto' );
elif [[ $GTK3 == "YES" ]]; then
  depends+=( 'gtk3' );
  makedepends+=( 'xorgproto' 'libxi' );
elif [[ $PGTK == "YES" ]]; then
  depends+=( 'gtk3' );
  makedepends+=( 'xorgproto' 'libxi' );
fi

if [[ ! $NOX == "YES" ]] && [[ ! $CLI == "YES" ]]; then
  depends+=( 'libjpeg-turbo' 'giflib' );
elif [[ $CLI == "YES" ]]; then
  depends+=();
fi

if [[ $ALSA == "YES" ]]; then
  if [[ $CLI == "YES" ]]; then
    depends_nox+=( 'alsa-lib' );
  else
    depends+=( 'alsa-lib' );
  fi
fi

if [[ ! $NOCAIRO == "YES" ]] && [[ ! $CLI == "YES" ]] && [[ ! $PGTK == "YES" ]]; then
  depends+=( 'cairo' );
fi

if [[ $XWIDGETS == "YES" ]]; then
  if [[ $LUCID == "YES" ]] || [[ $NOTKIT == "YES" ]] || [[ $CLI == "YES" ]]; then
    echo "";
    echo "";
    echo "Xwidgets support **requires** GTK+3!!!";
    echo "";
    echo "";
    exit 1;
  else
    depends+=( 'webkit2gtk' );
  fi
fi

if [[ $GPM == "YES" ]]; then
  if [[ $CLI == "YES" ]]; then
    depends_nox+=( 'gpm' );
  else
    depends+=( 'gpm' );
  fi
fi

if [[ $DOCS_PDF == "YES" ]]; then
  makedepends+=( 'texlive-core' );
fi
################################################################################

################################################################################
pkgver() {
  cd "$srcdir/emacs-git"

  printf "%s.%s" \
    $(grep AC_INIT configure.ac | \
    awk -F',' '{ gsub("[ \\[\\]]","",$2); print $2 }') \
    $(git rev-list --count HEAD)
}

# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental compilation.
prepare() {
  cd "$srcdir/emacs-git"
  [[ -x configure ]] || ( ./autogen.sh git && ./autogen.sh autoconf )
}

if [[ $CHECK == "YES" ]]; then
check() {
  cd "$srcdir/emacs-git"
  make check
}
fi

build() {
  cd "$srcdir/emacs-git"

  local _conf=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --mandir=/usr/share/man
    --with-gameuser=:games
    --with-modules
    --without-libotf
    --without-m17n-flt
# Beware https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25228
# dconf and gconf break font settings you set in ~/.emacs.
# If you insist you'll need to read that bug report in *full*.
# Good luck!
   --without-gconf
   --without-gsettings
  )

################################################################################

################################################################################

if [[ $CLANG == "YES" ]]; then
  _conf+=( '--enable-autodepend' );
fi

if [[ $LTO == "YES" ]]; then
  _conf+=( '--enable-link-time-optimization' );
fi

if [[ $XINPUT2 == "YES" ]]; then
  _conf+=( '--with-xinput2' );
fi


if [[ $JIT == "YES" ]]; then
  _conf+=( '--with-native-compilation' );
fi

if [[ $CLI == "YES" ]]; then
  _conf+=( '--without-x' '--with-x-toolkit=no' '--without-xft' '--without-lcms2' '--without-rsvg' '--without-jpeg' '--without-gif' '--without-tiff' '--without-png' );
elif [[ $NOTKIT == "YES" ]]; then
  _conf+=( '--with-x-toolkit=no' '--without-toolkit-scroll-bars' '--without-xft' '--without-xaw3d' );
elif [[ $LUCID == "YES" ]]; then
  _conf+=( '--with-x-toolkit=lucid' '--with-xft' '--with-xaw3d' );
elif [[ $GTK3 == "YES" ]]; then
  _conf+=( '--with-x-toolkit=gtk3' '--without-xaw3d' );
elif [[ $PGTK == "YES" ]]; then
  _conf+=( '--with-pgtk' '--without-xaw3d' );
fi

if [[ $NOCAIRO == "YES" || $CLI == "YES" || $NOTKIT == "YES" || $LUCID == "YES" ]]; then
  _conf+=( '--without-cairo' );
fi

if [[ $ALSA == "YES" ]]; then
    _conf+=( '--with-sound=alsa' );
else
    _conf+=( '--with-sound=no' );
fi

if [[ $XWIDGETS == "YES" ]]; then
  _conf+=( '--with-xwidgets' );
fi

if [[ $GPM == "YES" ]]; then
    true
else
  _conf+=( '--without-gpm' );
fi

if [[ $NOGZ == "YES" ]]; then
  _conf+=( '--without-compress-install' );
fi

# ctags/etags may be provided by other packages, e.g, universal-ctags
_conf+=('--program-transform-name=s/\([ec]tags\)/\1.emacs/')

################################################################################

################################################################################

  ./configure "${_conf[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But you may
  # need to use bootstrap sometimes to unbreak the build.
  # Just add it to the command line.
  #
  # Please note that incremental compilation implies that you
  # are reusing your src directory!
  #
  # Always use mold to link.
if [[ $USE_ALL_CPU_CORES == "YES" ]]; then
   if [[ $JIT == "YES" ]] && [[ $AOT == "YES" ]]; then
    mold -run make NATIVE_FULL_AOT=1 -j$(nproc)
  else
    mold -run make -j$(nproc)
  fi
else
  if [[ $JIT == "YES" ]] && [[ $AOT == "YES" ]]; then
    mold -run make NATIVE_FULL_AOT=1
  else
    mold -run make
  fi
fi

  # You may need to run this if 'loaddefs.el' files become corrupt.
  #cd "$srcdir/emacs-git/lisp"
  #make autoloads
  #cd ../

  # Optional documentation formats.
  if [[ $DOCS_HTML == "YES" ]]; then
    make html;
  fi
  if [[ $DOCS_PDF == "YES" ]]; then
    make pdf;
  fi

}

package() {
  cd "$srcdir/emacs-git"

  make DESTDIR="$pkgdir/" install

  # Install optional documentation formats
  if [[ $DOCS_HTML == "YES" ]]; then make DESTDIR="$pkgdir/" install-html; fi
  if [[ $DOCS_PDF == "YES" ]]; then make DESTDIR="$pkgdir/" install-pdf; fi

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root

  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games

}

################################################################################
# vim:set ft=bash ts=2 sw=2 et:
