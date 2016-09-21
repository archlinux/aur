# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>

#######################################################################
# CAVEAT LECTOR
#######################################################################
#
#  Don't run this on a tmpfs unless you have oodles of RAM.
#  When the official git repo started, the size was about
#  200MB. As time passes, it is growing more and more.
#  Final directory size after a build is shy of 1Gb!
#  Furthermore, the FSF isn't precisely rich and Savannah
#  network costs aren't cheap. Keep your git checkout!
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
#######################################################################
GTK3=""          # Leave empty to compile with gtk+ 2 support.
LTO=             # Enable link-time optimization. Broken.
CAIRO=           # Very broken for me. Use at own risk.
XWIDGETS=        # Use GTK+ native widgets pulled from webkitgtk.
DOCS_HTML=       # Generate and install html documentation.
DOCS_PDF=        # Generate and install pdf documentation.
#######################################################################

_pkgname=('emacs-git')
pkgname=("$_pkgname-gtk2" "$_pkgname-docs")
pkgver=25.1.r1887
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/"
_savannah="git://git.savannah.gnu.org/emacs.git"
_github="git+https://github.com/emacs-mirror/emacs.git"
license=('GPL')
makedepends=('git')
source=("${_pkgname}::${_github}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  _basever="$(git describe --tags `git rev-list --tags --max-count=1`)"
  _minver="${_basever//emacs-/}"
  _minver="${_minver//-/.}"
  printf "%s.r%s" \
    "${_minver}" \
    "$(git rev-list --count ${_basever}..HEAD)"
}


# There is no need to run autogen.sh after first checkout.
# Doing so, breaks incremental compilation.
prepare() {
  cd "$srcdir/${_pkgname}"

  [[ -x configure ]] || ./autogen.sh
}

build() {
  cd "$srcdir/${_pkgname}"

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
    --with-modules)

#######################################################################
#######################################################################
  if [[ $GTK3 = "YES" ]]; then
    _conf+=('--with-x-toolkit=gtk3' '--without-gconf' '--with-gsettings');
  else
    _conf+=('--with-x-toolkit=gtk2' '--with-gconf' '--without-gsettings');
  fi
  if [[ $LTO = "YES" ]]; then _conf+=('--enable-link-time-optimization'); fi
  if [[ $CAIRO = "YES" ]]; then _conf+=('--with-cairo'); fi
  if [[ $XWIDGETS = "YES" ]]; then _conf+=('--with-xwidgets'); fi
#######################################################################
#######################################################################

  ./configure "${_conf[@]}"

  # Using "make" instead of "make bootstrap" enables incremental
  # compiling. Less time recompiling. Yay! But if you may
  # need to use bootstrap sometime, just add it to the command
  # line.
  # Please note that incremental compilation implies that you
  # are reusing your src directory!
  make
  make html
  make pdf

  # You may need to run this if loaddefs.el files become
  # corrupt.
  #cd "$srcdir/${_pkgname}/lisp"
  #make autoloads
  #cd ../
}

package_emacs-git-gtk2() {
  pkgdesc="GNU Emacs, the extensible self-documenting text editor, with GTK2 graphical interface — built from git sources. WARNING: emacs's git repository is 1.25 GB in size!"
  depends=('gpm' 'giflib' 'm17n-lib' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gtk2')
  conflicts=('emacs' 'emacs-git')
  provides=('emacs')

  cd "$srcdir/${_pkgname}"

  make DESTDIR="$pkgdir/" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}

  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/ | xargs chown root:root

  # fix permssions on /var/games
  mkdir -p "$pkgdir"/var/games/emacs
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chown -R root:games "$pkgdir"/var/games
}

package_emacs-git-docs() {
  pkgdesc="GNU Emacs, built from git sources — HTML and PDF documentation package. WARNING: the emacs git repo is 1.25 GB in size!"
  makedepends+=('texlive-core')
  provides=('emacs-docs')
  conflicts=('emacs-docs')

  cd "$srcdir/${_pkgname}"

  make DESTDIR="$pkgdir/" install-html
  make DESTDIR="$pkgdir/" install-pdf
}
