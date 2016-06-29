#Contributor: Hector Mtz-Seara <hseara.#at#.gmail*.*com>
pkgname=pyzo
pkgver=4.2.1
pkgrel=1
pkgdesc="Pyzo is a cross-platform Python IDE focused on interactivity and introspection, which makes it very suitable for scientific computing."
url="http://pyzo.org"
license=("BSD")
arch=('any')
depends=('python-pyzolib')
replaces=('iep')
conflicts=('iep')
optdepends=(
   'python-pyqt4: At least one qt4 python bindings should be installed'
   'python-pyside: At lease one qt4 python bindings should be installed'
)
makedepends=('python-setuptools')


source=("https://github.com/pyzo/pyzo/archive/v${pkgver}.tar.gz")

sha1sums=('8c99a53a63b1e5f0d4167cdc7e8d08f3e180e9cc')


build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.  
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune

  # Install application launcher
  cat > ${pkgname}.desktop <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Encoding=UTF-8
Name=pyzo
Comment=Pyzo is a cross-platform Python IDE
Exec=/usr/bin/pyzo
Icon=/usr/lib/python3.5/site-packages/pyzo/resources/appicons/pyzologo.ico
Categories=Python;Development;IDE;
EOF

  mkdir -p ${pkgdir}/usr/share/applications
  install -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

msg2 "Building iep shortcut"
mkdir -p ${pkgdir}/usr/bin
  cat > ${pkgdir}/usr/bin/${pkgname} <<EOF
#!/usr/bin/env python
import pyzo
pyzo.start()
EOF
chmod 755 ${pkgdir}/usr/bin/${pkgname}

#Install license


  # Install (New) BSD license
  install -D -m444 ${srcdir}/${pkgname}-${pkgver}/${pkgname}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
