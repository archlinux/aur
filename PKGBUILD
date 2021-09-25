# Maintainer: nytpu <alex at nytpu dot com>
#
# This tracks factor-git: <https://aur.archlinux.org/packages/factor-git/>
# Maintainer: Sergii Fesenko <megapoliss@ukr.net>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Contributor: jedahu <jedahu@gmail.com>
# Contributor: Leonidas <marek@xivilization.net>

pkgname=factor-hidpi-git
_pkgname=factor
pkgver=0.98.r1822.d07d256748
pkgrel=2
pkgdesc="A general purpose, dynamically typed, stack-based programming language. Patched to function on HiDPI displays."
arch=(i686 x86_64)
url="http://factorcode.org"
license=(BSD)
provides=(factor factor-vm)
conflicts=(factor factor-git)
depends=(pango cairo glib2 freetype2 mesa libgl gtkglext)
optdepends=(udis86)
makedepends=(gcc git)
options=(!strip)
source=(
  'git+https://github.com/factor/factor.git'
  'factor.desktop'
  'fix-dpi.patch'
  )

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/-/.r/; s/-g/./'
}

md5sums=('SKIP'
         '59242ddb19a9be927915e489e2bfca27'
         '78562de4b6fbdfac99368d0d1935e1f1')

prepare() {
  cd "$srcdir/$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/fix-dpi.patch"
  git ci -am "fix DPI issues on HiDPI displays" # build.sh doesn't work with unstaged changes
}

build() {
  cd "$srcdir/$_pkgname"

  if [[ ! -f checksums.txt ]]; then
    # update done by ./build.sh
    msg "Running factor update script...."
    git checkout master # factor dislikes the "makepkg" branch
    git branch -D makepkg || true
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
  install -D "$srcdir"/factor.desktop "$pkgdir"/usr/share/applications/factor.desktop
  install -D misc/icons/Factor.svg "$pkgdir"/usr/share/pixmaps/factor.svg
}
