# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=apache-mod_bw
_pkgname=mod_bw
pkgver=0.7
pkgrel=3
pkgdesc="DSO module for Apache that throttles HTTP traffic"
url="http://bwmod.sourceforge.net"
arch=('i686' 'x86_64')
license=('apache')
depends=('apache')
makedepends=('apache')
install="$pkgname.install"
source=("http://bwmod.sourceforge.net/files/$_pkgname-$pkgver.tgz"
        'apr_atomic_fix.patch'
        'apache24.patch')
md5sums=('d792a892517ca89f21ac2a6c01e6ccb2'
         'f9cdca58c58678a2e334086ccf81f898'
         '23f29e631f65ba05e650a5b0cf57dba7')

_MODDIR='usr/lib/httpd/modules'
_DOCDIR="usr/share/doc/$pkgname"

prepare() {
  cd $srcdir/$_pkgname

  # fix for undefined symbol errors:
  # http://4j.blogspot.com/2008/09/fix-for-modbw-when-getting-error.html
  patch < "$srcdir"/apr_atomic_fix.patch

  # fix for apache 2.4
  patch < "$srcdir"/apache24.patch
}
  
build() {
  cd $srcdir/$_pkgname

  # make the module
  /usr/sbin/apxs -c -o $_pkgname.so $_pkgname.c
}

package() {
  cd $srcdir/$_pkgname

  install -Dm644 .libs/$_pkgname.so $pkgdir/$_MODDIR/$_pkgname.so

  # install docs
  install -Dm644 $_pkgname.txt $pkgdir/$_DOCDIR/$_pkgname.txt
}

# vim:set ts=2 sw=2 et:
