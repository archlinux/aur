# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-terminal
pkgver=3.0.0
_mintrel=betsy
pkgrel=1
pkgdesc="An embedded terminal for Nemo, the Cinnamon file manager."
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.0' 'nemo<3.1' 'nemo-python' 'vte3' 'gobject-introspection-runtime')
optdepends=("python2-xdg: Integration with freedesktop.org standards")
install="${pkgname}.install"

options=('!libtool' '!emptydirs')

source=("http://packages.linuxmint.com/pool/main/n/nemo-terminal/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('af6039abf8376c2170cd09ba516387bd132faf4c1ff3647b6a57744b30c52d70')


prepare() {
  # Python2 fix
  msg2 "Fixing to use python2..."
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  msg2 "Patching for API change from vte 2.90 to vte 2.91..."
  sed -i 's/2.90/2.91/' "${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py"
  sed -i 's/fork_command_full/spawn_sync/' "${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py"
  sed -i 's/self.vscrollbar =/#self.vscrollbar =/g' "${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py"
  sed -i 's/self.hbox.pack_end/#self.hbox.pack_end/g' "${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py"

}


package() {

  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install -d ${pkgdir}/usr/share/glib-2.0/schemas
  install -d ${pkgdir}/usr/share/nemo-terminal
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/org.nemo.extensions.nemo-terminal.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/pixmap/logo_120x120.png ${pkgdir}/usr/share/nemo-terminal
}
