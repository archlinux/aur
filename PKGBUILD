# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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
_pkgname=editix
pkgver=2019
pkgrel=1
epoch=1
pkgdesc="EditiX is a powerful and easy to use XML editor, Visual Schema Editor, XQuery Editor and XSLT debugger"
arch=('any')
license=('custom')
depends=('java-runtime')
url="http://free.editix.com/"
source=("http://www.editix.com/download/editix$pkgver.zip")
sha256sums=('9d87180dbdbb7a3e76de505a3a9dc5eb6618d63e223b4479d1c0fdd4be285103')

package() {
  # Licenses first, before we move the whole directory to opt
  cd "${srcdir}/"
  for F in LICENSE.TXT ; do
    # Install to /usr and remove from distribution dir
    install -D -m644 $F "${pkgdir}/usr/share/licenses/${pkgname}/$F"
    rm -f $F
    # Symlink the original file from /opt to /usr
    ln -sf /usr/share/licenses/${pkgname}/$F $F
  done

  # Install the compiled app to /opt
  cd "$srcdir"
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r * ${pkgdir}/opt/${_pkgname}

  # Create a symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf /opt/${_pkgname}/bin/editix.sh "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/bin/editix.sh"

  # Fix the run script
  sed -e "s|^TOPDIR=.*\$|TOPDIR='/opt/${_pkgname}/bin/';|g" \
    -i "${pkgdir}/opt/${_pkgname}/bin/editix.sh"

  rm -f ${pkg}/opt/${_pkgname}/${_pkgname}${pkgver}
}
