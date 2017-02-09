# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=bcnc
pkgver=0.9.7
pkgrel=1
pkgdesc="GRBL CNC command sender, autoleveler and g-code editor"
arch=('any')
url="https://github.com/vlachoudis/bCNC"
license=('GPL-2.0')
depends=('python2-pyserial')
provides=("bcnc")
conflicts=("bcnc-git")
source=("https://github.com/vlachoudis/bCNC/archive/0.9.7.tar.gz"
        "bcnc.desktop")
md5sums=('eeb78f853abee215e79a139b466bfb2d'
         '96bb9218018772b0de84d257452295c0')


prepare() {
  cd "$srcdir/bCNC-${pkgver}"
  sed 's,\${PYTHON} \${DIR}\/bCNC.py \$\*,python2 \${DIR}\/bCNC.py \$\*,g' -i bCNC
  sed 's,DIR=`dirname \$0`,DIR="\$(dirname "\$(readlink -f "\$0")")",g' -i bCNC
}

build() {
  cd "$srcdir/bCNC-${pkgver}"
  python2 -O -m py_compile *.py
}


package() {
  install -D -m644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "$srcdir/bCNC-${pkgver}/bCNC.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

  mkdir -p "${pkgdir}/opt/"
  cp -a "$srcdir/bCNC-${pkgver}" "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/bcnc/bCNC" "${pkgdir}/usr/bin/."
}
