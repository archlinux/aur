# Maintainer: Jonathan Teran <jonathan.nerat@gmail.com>
# Contributor: Honghao Li <im@rasphino.cn>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=stow-dotfiles-git
pkgver=20190728
pkgrel=1
pkgdesc="stow package with AitorATuin's patches for --dotfiles, git version"
url='https://github.com/aspiers/stow/issues/33'
arch=('x86_64')
license=('GPL2')
depends=('perl')
makedepends=('git' 'texi2html' 'texinfo' 'texlive-core')
checkdepends=('perl-test-output' 'perl-io-stringy')
source=("git://git.savannah.gnu.org/stow.git"
        "aitoratuin-dotfiles.patch")
sha256sums=('SKIP'
            'effe1387783e6f0046ad02ffb1647a083d49a887bea5e09173ea45dd5a11548f')
provides=('stow')
conflicts=('stow' 'stow-git')
_gitname="stow"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -p1 < ${srcdir}/aitoratuin-dotfiles.patch
  autoreconf -iv
}

build() {
  cd "${srcdir}/${_gitname}"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --with-pmdir=/usr/share/perl5/vendor_perl
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
