#Contributor: Hector Mtz-Seara <hseara.#at#.gmail*.*com>
pkgname=iep
pkgver=3.6
pkgrel=1
pkgdesc="Pronounced as 'eep'is a cross-platform Python IDE focused on interactivity and introspection, which makes it very suitable for scientific computing. Its practical design is aimed at simplicity and efficiency."
url="http://iep-project.org"
license=("BSD")
arch=('any')
depends=('python-pyzolib')
optdepends=(
   'python-pyqt4: At least one qt4 python bindings should be installed'
   'python-pyside: At lease one qt4 python bindings should be installed'
)
makedepends=('python-setuptools')


source=("http://bitbucket.org/iep-project/iep/downloads/iep-${pkgver}.source.zip")
sha1sums=('8d2ff6bc83fda981d223d5f84aef3d748eab0a67')

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
Version=3.4
Type=Application
Encoding=UTF-8
Name=iep
Comment=IEP is a cross-platform Python IDE
Exec=/usr/bin/iep
Icon=/usr/lib/python3.4/site-packages/iep/resources/appicons/ieplogo.ico
Categories=Python;Development;IDE;
EOF

  mkdir -p ${pkgdir}/usr/share/applications
  install -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

msg2 "Building iep shortcut"
mkdir -p ${pkgdir}/usr/bin
  cat > ${pkgdir}/usr/bin/${pkgname} <<EOF
#!/usr/bin/env python
import iep
iep.startIep()
EOF
chmod 755 ${pkgdir}/usr/bin/${pkgname}

#Install license


  # Install (New) BSD license
  install -D -m444 ${srcdir}/${pkgname}-${pkgver}/iep/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
