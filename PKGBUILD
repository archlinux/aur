# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer of emacs27-git: Jack Random <https://aur.archlinux.org/account/jackrandom/>
# Maintainer of emacs-git: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>

################################################################################
# The difference between this PKGBUILD and the one from `emacs-git` is that:
# - this one builds emacs from `emacs-28` release branch.
# - Just-in-time ahead-of-time compilation is enabled by default.
#
# `Starting the Emacs 28 release cycle` announcement on emacs-devel:
# https://lists.gnu.org/archive/html/emacs-devel/2021-09/msg02290.html
################################################################################

################################################################################
# CAVEAT LECTOR: This PKGBUILD is highly opinionated. I give you
#                enough rope to hang yourself, but by default it
#                only enables the features I use.
################################################################################

################################################################################
# Assign YES to the variable you want enabled; empty or any other value for NO.
#
# Where you read experimental, replace with foobar.
# =================================================
################################################################################
CLANG=            # Use clang.
GOLD=             # Use the gold linker.
LTO=              # Enable link-time optimization.  Still experimental.
JIT=YES           # Enable native just-in-time compilation. libgccjit is in AUR.
                  # This compiles only performance critical elisp files.
                  # To compile all elisp on demand, set
                  # comp-deferred-compilation non-nil
AOT=YES           # Precompile all included elisp. It takes a long time.
                  # You still need to enable on-demand compilation
                  # for your own packages.
CLI=              # CLI only binary.
GPM=              # Mouse support in Linux using gpm.
NOTKIT=           # Use no toolkit widgets. Like B&W Twm (001d sk00l).
                  # Bitmap fonts only, 1337!
                  #
LUCID=            # Use the lucid, a.k.a athena, toolkit. Like XEmacs, sorta.
                  #
                  # Read https://wiki.archlinux.org/index.php/X_resources
                  # https://en.wikipedia.org/wiki/X_resources
                  # and https://www.emacswiki.org/emacs/XftGnuEmacs
                  # for some tips on using outline fonts with
                  # Xft, if you choose no toolkit or Lucid.
                  #
ALSA=YES          # Linux sound support.
NOCAIRO=          # Disable here.
XWIDGETS=         # Use GTK+ widgets pulled from webkit2gtk. Usable.
DOCS_HTML=        # Generate and install html documentation.
DOCS_PDF=         # Generate and install pdf documentation.
NOGZ=YES          # Don't compress .el files.
################################################################################

################################################################################
if [[ $CLI == YES ]]; then
    pkgname=emacs28-nox-git
else
    pkgname=emacs28-git
fi
pkgver=28.0.91.151129
pkgrel=1
pkgdesc='emacs-28 release branch'
arch=(x86_64)
url=http://www.gnu.org/software/emacs/
license=(GPL3)
_depends_nox=(gnutls libxml2 jansson)
depends=("${_depends_nox[@]}" harfbuzz)
makedepends=(git)
provides=(emacs emacs-nox)
conflicts=(emacs emacs26-git emacs-27-git emacs-git emacs-seq emacs-nox)
replaces=(emacs emacs26-git emacs-27-git emacs-git emacs-seq emacs-nox)
options=(!strip)
install=emacs28-git.install
source=($pkgname::git+https://git.savannah.gnu.org/git/emacs.git#branch=emacs-28)
b2sums=(SKIP)

################################################################################

################################################################################

if [[ $GOLD == YES && ! $CLANG == YES ]]; then
    export LD=/usr/bin/ld.gold
    export CFLAGS+=' -fuse-ld=gold'
    export CXXFLAGS+=' -fuse-ld=gold'
elif [[ $GOLD == YES && $CLANG == YES ]]; then
    echo
    echo Clang requires its own linker.
    echo
    exit 1
fi

if [[ $CLANG == YES ]]; then
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
    export CPP='/usr/bin/clang -E'
    export LD=/usr/bin/lld
    export AR=/usr/bin/llvm-ar
    export AS=/usr/bin/llvm-as
    export CCFLAGS+=' -fuse-ld=lld'
    export CXXFLAGS+=' -fuse-ld=lld'
    makedepends+=(clang lld llvm)
fi

if [[ $JIT == YES ]]; then
    _depends_nox+=(libgccjit)
    depends+=(libgccjit)
fi

if [[ $CLI == YES ]]; then
    depends=("${_depends_nox[@]}")
elif [[ $NOTKIT == YES ]]; then
    depends+=(dbus hicolor-icon-theme libxinerama libxrandr lcms2 librsvg libxfixes libxpm)
    makedepends+=(xorgproto)
elif [[ $LUCID == YES ]]; then
    depends+=(dbus hicolor-icon-theme libxinerama libxfixes lcms2 librsvg xaw3d libxrandr libxpm)
    makedepends+=(xorgproto)
else
    depends+=(gtk3 libxpm)
    makedepends+=(xorgproto)
fi

if [[ $NOX != YES && $CLI != YES ]]; then
    depends+=(libjpeg-turbo giflib)
fi

if [[ $ALSA == YES ]]; then
    _depends_nox+=(alsa-lib)
    depends+=(alsa-lib)
fi

[[ $NOCAIRO != YES && $CLI != YES ]] && depends+=(cairo)

if [[ $XWIDGETS == YES ]]; then
      if [[ $LUCID == YES || $NOTKIT == YES || $CLI == YES ]]; then
        echo
        echo 'Xwidgets support *requires* GTK+3!!!'
        echo
        exit 1
    else
        depends+=(webkit2gtk)
    fi
fi

if [[ $GPM == YES ]]; then
    _depends_nox+=(gpm)
    depends+=(gpm)
fi

[[ $DOCS_PDF == YES ]] && makedepends+=(texlive-core)
################################################################################

################################################################################
pkgver() {
    cd "$srcdir/$pkgname"

    printf "%s.%s"                                                  \
        "$(grep AC_INIT configure.ac |                              \
        sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\?\).\+$/\1/')"  \
        "$(git rev-list --count HEAD)"
}

# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental compilation.
prepare() {
    cd "$srcdir/$pkgname"
    [[ -x configure ]] || ./autogen.sh git && ./autogen.sh autoconf
}

build() {
    cd "$srcdir/$pkgname"

    local _conf=(
        --prefix=/usr
        --sysconfdir=/etc
        --libexecdir=/usr/lib
        --localstatedir=/var
        --mandir=/usr/share/man
        --with-gameuser=:games
        --with-sound=alsa
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

    [[ $CLANG == YES ]] && _conf+=(--enable-autodepend)
    [[ $LTO   == YES ]] && _conf+=(--enable-link-time-optimization)
    [[ $JIT   == YES ]] && _conf+=(--with-native-compilation)

    if [[ $CLI == YES ]]; then
        _conf+=(--without-x --with-x-toolkit=no --without-xft --without-lcms2 --without-rsvg --without-jpeg --without-gif --without-tiff --without-png)
    elif [[ $NOTKIT == YES ]]; then
        _conf+=(--with-x-toolkit=no --without-toolkit-scroll-bars --without-xft --without-xaw3d)
    elif [[ $LUCID == YES ]]; then
        _conf+=(--with-x-toolkit=lucid --with-xft --with-xaw3d)
    else
        _conf+=(--with-x-toolkit=gtk3 --without-xaw3d)
    fi

    [[ $NOCAIRO == YES || $CLI == YES ]] && _conf+=(--without-cairo)

    if [[ $ALSA == YES ]]; then
        _conf+=(--with-sound=alsa)
    else
        _conf+=(--with-sound=no)
    fi

    [[ $XWIDGETS == YES ]] && _conf+=(--with-xwidgets)
    [[ $GPM      != YES ]] && _conf+=(--without-gpm)
    [[ $NOGZ     == YES ]] && _conf+=(--without-compress-install)

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
    if [[ $JIT == YES && $AOT == YES ]]; then
        make NATIVE_FULL_AOT=1
    else
        make
    fi

    # You may need to run this if 'loaddefs.el' files become corrupt.
    #cd "$srcdir/$pkgname/lisp"
    #make autoloads
    #cd ..

    # Optional documentation formats.
    [[ $DOCS_HTML == YES ]] && make html
    [[ $DOCS_PDF  == YES ]] && make pdf || true
}

_check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"

    make DESTDIR="$pkgdir/" install

    # Install optional documentation formats
    [[ $DOCS_HTML == YES ]] && make DESTDIR="$pkgdir/" install-html
    [[ $DOCS_PDF  == YES ]] && make DESTDIR="$pkgdir/" install-pdf

    # fix permssions on /var/games
    mkdir -p  "$pkgdir"/var/games/emacs
    chmod 775 "$pkgdir"/var/games{,/emacs}
}

################################################################################
# vim:set ft=bash ts=2 sw=2 et:
