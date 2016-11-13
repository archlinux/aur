# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>, ptrxyz <ptrxyz@gmx.de>

pkgname=nemo-terminal
pkgver=3.2.0
pkgrel=1
pkgdesc="An embedded terminal for Nemo, the Cinnamon file manager."
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2' 'nemo-python' 'vte3' 'gobject-introspection-runtime')
optdepends=("python2-xdg: Integration with freedesktop.org standards")
install="${pkgname}.install"

options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('1536fd828b2ee0a8f194155a9e13b8cce937b403b5c87d8e579d7b1ced8d6d14')


prepare() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  msg2 "Fixing to use python2..."
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  msg2 "Patching for API change from vte 2.90 to vte 2.91..."
  sed -i 's/2\.90/2.91/' "src/nemo_terminal.py"
  sed -i 's/fork_command_full/spawn_sync/' "src/nemo_terminal.py"
  sed -i 's/self.vscrollbar =/pass #self.vscrollbar =/g' "src/nemo_terminal.py"
  sed -i 's/self.hbox.pack_end/pass #self.hbox.pack_end/g' "src/nemo_terminal.py"

}


package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install -d ${pkgdir}/usr/share/glib-2.0/schemas
  install -d ${pkgdir}/usr/share/nemo-terminal
  install src/nemo_terminal.py ${pkgdir}/usr/share/nemo-python/extensions
  install src/org.nemo.extensions.nemo-terminal.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas
  install pixmap/logo_120x120.png ${pkgdir}/usr/share/nemo-terminal
}
