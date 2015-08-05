# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Jiyunatori <tori_LEAVETHISOUT_@0xc29.net>
# Contributor: mdev
# adopted by domanov <domanov_LEAVETHISOUT_@__gmail__com>

pkgname=emacs-org-mode
_srcname=org
pkgver=8.3.1
pkgrel=1
pkgdesc="Emacs Org Mode"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
license=('GPL')
install=emacs-org-mode.install
source=("http://orgmode.org/${_srcname}-${pkgver}.tar.gz")
sha256sums=('3d13b02fc42c76753aaa2f8873544af00218d2235fd19c13221736b10498c332')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make compile || return 1
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make prefix="${pkgdir}/usr/share" install || return 1

  ## by default now we install also the contrib directory
  install -d -m755 $pkgdir/usr/share/emacs/site-lisp/org_contrib || return 1
  cp -r contrib/* $pkgdir/usr/share/emacs/site-lisp/org_contrib || return 1

  ##! proper install of info files (thanks mdev)
  ##! replace "orgmode" with "org" in the following lines if you want
  ##! to replace emacs own org's info files. You also need to change the  .install.
  install -D -m644 doc/org $pkgdir/usr/share/info/orgmode || return 1
  gzip -9 $pkgdir/usr/share/info/orgmode || return 1
  rm $pkgdir/usr/share/info/org || return 1
}
