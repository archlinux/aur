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

pkgname=editix-free
pkgver=020110
_pkgver=2010
pkgrel=1
pkgdesc="EditiX is a powerful and easy to use XML editor, Visual Schema Editor, XQuery Editor and XSLT debugger"
arch=('any')
license=('custom')
depends=('java-runtime')
url="http://free.editix.com/"
source=("http://free.editix.com/download/$pkgname-$_pkgver.tar.gz")
md5sums=('a7dd16c50e2448e121fa618a75658b46')

build() {
	msg "Nothing to compile for $pkgname"
}

package() {
  # Licenses first, before we move the whole directory to opt
  cd "$srcdir/${pkgname}-${_pkgver}"
  for F in LICENSE.TXT LICENSE.html ; do
    # Install to /usr and remove from distribution dir
    install -D -m644 $F "${pkgdir}/usr/share/licenses/${pkgname}/$F"
    rm -f $F
    # Symlink the original file from /opt to /usr
    ln -sf /usr/share/licenses/${pkgname}/$F $F
  done

  # Install the compiled app to /opt
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/"
  cp -r ${pkgname}-${_pkgver} $pkgdir/opt/

  # Create a symlink to /usr/bin
  install -dm755 "$pkgdir/usr/bin/"
  ln -sf /opt/${pkgname}-${_pkgver}/bin/run.sh "$pkgdir/usr/bin/$pkgname"
  chmod 755 "${pkgdir}/opt/${pkgname}-${_pkgver}/bin/run.sh"

  # Fix the run script
  sed -e "s|^TOPDIR=.*\$|TOPDIR='/opt/${pkgname}-${_pkgver}/bin/';|g" \
    -i "${pkgdir}/opt/${pkgname}-${_pkgver}/bin/run.sh"
}

# vim:set ts=2 sw=2 et:
