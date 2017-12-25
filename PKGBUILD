# Maintainer: Sergii Fesenko <megapoliss@ukr.net>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Contributor: jedahu <jedahu@gmail.com>
# Contributor: Leonidas <marek@xivilization.net>

pkgname=factor-git
_pkgname=factor
pkgver=0.97.r3719.g08db99a471
pkgrel=1
pkgdesc="A general purpose, dynamically typed, stack-based programming language"
arch=(i686 x86_64)
url="http://factorcode.org"
license=(BSD)
provides=(factor)
conflicts=(factor)
depends=(pango cairo glib2 freetype2 mesa libgl gtkglext)
optdepends=(udis86)
makedepends=(git)
options=(!strip)
source=('git://factorcode.org/git/factor.git' # Official
        #'https://github.com/factor/factor.git' # Mirror
        'factor.desktop')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  if [[ ! -f checksums.txt ]]; then
    # update done by ./build.sh
    msg "Running factor update script...."
    git checkout master # factor dislikes the "makepkg" branch
    #./build.sh quick-update
    #./build.sh self-update
    ./build.sh update
  else
    msg "Running factor bootstrap script...."
    ./build.sh net-bootstrap
  fi
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/factor
  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/

  # copy over the stdlib
  cd "$srcdir/$_pkgname"
  cp -a misc extra core basis factor.image $pkgdir/usr/lib/factor/
  # copy over libs
  cp libfactor.a libfactor-ffi-test.so $pkgdir/usr/lib/factor/
  # copy over docs
  cp README.md $pkgdir/usr/share/doc/$pkgname/
  # make folders r+x and files r
  chmod -R 0755 $pkgdir/usr/lib/factor
  find $pkgdir/usr/lib/factor -type f -exec chmod -x {} \;

  # copy over the actual binary and create a symlink called factor-vm
  # (otherwise it conflicts with factor from the GNU coreutils)
  cp -a factor $pkgdir/usr/lib/factor/factor
  cd $pkgdir/usr/bin
  ln -s ../lib/factor/factor factor-vm
  cd -

  # copy over the license (as defined in Arch Packaging Standards)
  chmod -x LICENSE.txt
  cp LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING

  # add the desktop entry and icon
  install -D "$srcdir/factor.desktop" "$pkgdir/usr/share/applications/factor.desktop"
  install -D misc/icons/Factor_48x48.png "$pkgdir/usr/share/pixmaps/factor.png"
}

md5sums=('SKIP'
         '59242ddb19a9be927915e489e2bfca27')
