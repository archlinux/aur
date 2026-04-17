# Maintainer : Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
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
pkgver=2026
pkgrel=1
epoch=1
pkgdesc="EditiX is a powerful and easy to use XML editor, Visual Schema Editor, XQuery Editor and XSLT debugger"
arch=('any')
license=('custom')
depends=('java-runtime')
url="http://free.editix.com/"
source=("http://www.editix.com/download/editix$pkgver.zip")
sha256sums=('4f27dce8c7e54703551009418072a4a355dde3601990ba1f7609acca84b63bb8')

package() {
  # Licenses first, before we move the whole directory to opt
  cd "${srcdir}/${_pkgname}${pkgver}"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/  
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install the compiled app to /opt
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r * ${pkgdir}/opt/${_pkgname}

  # Create a symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin/"
  ln -sf /opt/${_pkgname}/run.sh "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/run.sh"

  # Fix the run script
  sed -e "s|:|:/opt/${_pkgname}/|g" \
    -i "${pkgdir}/opt/${_pkgname}/run.sh"

  sed -e "s|CLASSPATH=|CLASSPATH=/opt/${_pkgname}/|g" \
    -i "${pkgdir}/opt/${_pkgname}/run.sh"

  rm -f ${pkg}/opt/${_pkgname}/${_pkgname}${pkgver}
}
