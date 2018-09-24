#Contributor: Hector Mtz-Seara <hseara.#at#.gmail*.*com>
pkgname=pyzo
pkgver=4.6.0
pkgrel=2
pkgdesc="Pyzo is a cross-platform Python IDE focused on interactivity and introspection, which makes it very suitable for scientific computing."
url="http://pyzo.org"
license=("BSD")
arch=('any')
depends=('python-pyqt5') # At lease one qt5 python bindings should be installed
#depends=('pyside2') # At lease one qt5 python bindings should be installed
makedepends=('python-setuptools')
pyver=3.7 #To be adjusted to the default python version in the system


source=("https://github.com/pyzo/pyzo/archive/v${pkgver}.tar.gz")

sha1sums=('a1d600a54256ca983fed9a4214b42c250285e1ab')


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
Name=Pyzo
GenericName=Pyzo is a cross-platform Python IDE
Exec=/usr/bin/pyzo
Icon=/usr/lib/python${pyver}/site-packages/pyzo/resources/appicons/pyzologo.ico
Categories=Python;Development;IDE;
EOF

  mkdir -p ${pkgdir}/usr/share/applications
  install -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Building shortcut
  msg2 "Building pyzo shortcut"
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
