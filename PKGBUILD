# Maintainer: Chris Nixon chris.nixon@sigma.me.uk

#######################################################################
# CAVEAT LECTOR
#######################################################################
#
#  Don't run this on a tmpfs unless you have oodles of RAM.
#  When the official git repo started, the size was about
#  200MB. As time passes, it is growing more and more.
#  Final directory size after a build is shy of 1Gb!
#
#  Keeping this directory in a safe place preserves the
#  git repo and the src dir for faster compilation if
#  you want. You may delete the pkg dir after successfully
#  creating a package.
#
#  "makepkg -i" is your friend.
#
#######################################################################

#######################################################################
#
# Still reading? Here kid, have enough rope to hang yourself. :-)
#
#######################################################################

#######################################################################
# Assign "YES" to the variable you want enabled, empty otherwise
#
# Where you read experimental, replace with foobar.
# =============================================================
#
#######################################################################
GTK2=            # Leave empty to compile with gtk+ 3 support.
LTO=             # Enable link-time optimization. Experimental.
CAIRO=           # Highly experimental.
XWIDGETS=        # Use GTK+ widgets pulled from webkitgtk. Experimental.
DOCS_HTML=       # Generate and install html documentation.
DOCS_PDF=        # Generate and install pdf documentation.
DEBUG=           # Build with debug info

#######################################################################
# Assign "YES" or blank the variable you want enabled.
#######################################################################
DOCS_INFO="NO"    # Generate and install GNU info documentation.
#######################################################################

pkgname=remacs-git
pkgver=26.2.90.135232
pkgrel=1
pkgdesc="Development branch of REmacs, a fork of GNU Emacs with components rewritten in Rust"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Wilfred/remacs.git"
license=('GPL')
depends=('gpm' 'm17n-lib' 'alsa-lib' 'imagemagick')
makedepends=('git' 'clang' 'rustup')
#######################################################################
#######################################################################
if [[ $GTK2 = "YES" ]]; then
  depends+=('gtk2');
else
  depends+=('gtk3'); 
fi
if [[ $CAIRO = "YES" ]]; then depends+=('cairo'); fi
if [[ $XWIDGETS = "" ]]; then depends+=('giflib'); fi
if [[ $XWIDGETS = "YES" ]]; then
  if [[ $GTK2 = "YES" ]]; then 
    echo "";
    echo "";
    echo "Xwidgets support *requires* gtk+3!!!";
    echo "";
    echo "";
    exit 1;
    else 
      depends+=('webkit2gtk'); 
  fi
fi
if [[ $DOCS_PDF = "YES" ]]; then makedepends+=('texlive-core'); fi
#######################################################################
#######################################################################
source=("$pkgname::git+https://github.com/Wilfred/remacs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" \
    "$(grep AC_INIT configure.ac | \
    sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\?\).\+$/\1/')" \
    "$(git rev-list --count HEAD)"
}


# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental compilation.
prepare() {
  cd "$srcdir/$pkgname"

  [[ -x configure ]] || ./autogen.sh
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
  if [[ $GTK2 = "YES" ]]; then 
    _conf+=('--with-x-toolkit=gtk2' '--with-gconf' '--without-gsettings');
  else
    _conf+=('--with-x-toolkit=gtk3' '--without-gconf' '--with-gsettings'); 
  fi
  if [[ $LTO = "YES" ]]; then _conf+=('--enable-link-time-optimization'); fi
  if [[ $CAIRO = "YES" ]]; then _conf+=('--with-cairo'); fi
  if [[ $XWIDGETS = "YES" ]]; then _conf+=('--with-xwidgets'); fi
  if [[ $DEBUG = "YES" ]]; then
    _conf+=('--enable-profiling' '--enable-rust-debug');
  fi

  # Building the GNU info docs will cause the package to conflict with emacs
  if [[ $DOCS_INFO = "NO" ]]; then
    _conf+=('--without-makeinfo' '--infodir=/tmp');
  fi
#######################################################################
#######################################################################

  ./configure "${_conf[@]}" "${_conf_vars[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But if you may 
  # need to use bootstrap sometime, just add it to the command 
  # line.
  # Please note that incremental compilation implies that you 
  # are reusing your src directory!
  make

  # You may need to run this if loaddefs.el files become
  # corrupt.
  #cd "$srcdir/$pkgname/lisp"
  #make autoloads
  #cd ../

  # Optional documentation formats.
  if [[ $DOCS_HTML = "YES" ]]; then make html; fi
  if [[ $DOCS_PDF = "YES" ]]; then make pdf; fi
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install

  # Install optional documentation formats
  if [[ $DOCS_HTML = "YES" ]]; then make DESTDIR="$pkgdir/" install-html; fi
  if [[ $DOCS_PDF = "YES" ]]; then make DESTDIR="$pkgdir/" install-pdf; fi

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.remacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.remacs.1.gz}
  mv "$pkgdir"/usr/share/man/man1/{etags.1.gz,etags.remacs.1.gz}
  mv "$pkgdir"/usr/share/man/man1/{ebrowse.1.gz,ebrowse.remacs.1.gz}
  mv "$pkgdir"/usr/share/man/man1/{emacs.1.gz,remacs.1.gz}
  mv "$pkgdir"/usr/share/man/man1/{emacsclient.1.gz,remacsclient.1.gz}
  mv "$pkgdir"/usr/bin/{etags,etags.remacs}
  mv "$pkgdir"/usr/bin/{ebrowse,ebrowse.remacs}

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/remacs/ | xargs chown root:root

  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/remacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/remacs
  chown -R root:games "$pkgdir"/var/games

  # The logic used to install systemd's user service is partially broken
  # under Arch Linux model, because it adds $DESTDIR as prefix to the 
  # final Exec targets. The fix is to hack it with an axe.
  install -Dm644 etc/remacs.service "$pkgdir"/usr/lib/systemd/user/remacs.service
  sed -i -e 's#\(ExecStart\=\)#\1\/usr\/bin\/#' \
    -e 's#\(ExecStop\=\)#\1\/usr\/bin\/#' \
    "$pkgdir"/usr/lib/systemd/user/remacs.service

  if [[ $DOCS_INFO = "NO" ]]; then
    rm -r "$pkgdir/tmp";
  fi
}

# vim:set ft=sh ts=2 sw=2 et:
