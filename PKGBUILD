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

pkgname=apache-mod_form
pkgver=1.0
pkgrel=1
pkgdesc="A utility to decode data submitted from Web forms. It deals with both GET and POST methods where the data are encoded using the default content type application/x-www-form-urlencoded."
arch=('i686' 'x86_64')
url="http://apache.webthing.com/mod_form/"
license=('GPL')
depends=('apache')
makedepends=('patch')
source=("http://apache.webthing.com/svn/apache/forms/mod_form.c"
        "http://apache.webthing.com/svn/apache/forms/mod_form.h"
        'preserve-args.patch')
md5sums=('8339effe63ec1ea8ade1e8b90aabb23c'
         'e524cf838ae990bf6e118d985b1b91ca'
         '24f531501e999ff46bdbb920edf7a4a4')

prepare() {
  # we need to copy the source files into a clean subdir
  # because makepkg now symlinks source files to the parent
  # directory. we could use --follow-symlinks but the
  # patch man page says that is discouraged.
  rm -Rf "$srcdir"/$pkgname-$pkgversion || true # cleanup if makepkg has been previously run
  mkdir "$srcdir"/$pkgname-$pkgversion
  cp --dereference "$srcdir"/mod_form.? preserve-args.patch $pkgname-$pkgversion/

  cd "$srcdir"/$pkgname-$pkgversion

  patch < preserve-args.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgversion

  apxs -c mod_form.c
}

package() {
  cd "$srcdir"/$pkgname-$pkgversion

  install -Dm0755 .libs/mod_form.so $pkgdir/usr/lib/httpd/modules/mod_form.so
  install -Dm0644 mod_form.h $pkgdir/usr/include/httpd/mod_form.h
}

# vim:set ts=2 sw=2 et:
