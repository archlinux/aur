# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Adrian Carpenter <adriatic.c@gmail.com>
pkgname=structuresynth
pkgver=1.5.0
pkgrel=4
pkgdesc="Graphics tool to make 3D structures from sets of rules, similar to Context Free."
arch=('i686' 'x86_64')
url="http://structuresynth.sourceforge.net"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-script')
source=("http://downloads.sourceforge.net/structuresynth/StructureSynth-Source-v${pkgver}.zip")
md5sums=('862705c5bc9e778094046399f44d6c26')
install=${pkgname}.install

build() {
  cd "$srcdir/Structure Synth Source Code/"

  _patches=("s|loose|lose|"
            "s|\.\./\.\./Misc|/usr/share/$pkgname/Misc|"
            "s|\.\./\.\./Examples|/usr/share/$pkgname/Examples|")
  for _i in "${_patches[@]}"; do
    sed -ie "$_i" StructureSynth/GUI/MainWindow.cpp
  done
  _patches_2=("s|QtGui/||" "s|\, QApplication::UnicodeUTF8||" )
  for _i in "${_patches_2[@]}"; do
    sed -ie "$_i" StructureSynth/GUI/TemplateExportDialog.h
    sed -ie "$_i" StructureSynth/GUI/TemplateExportDialog.cpp
  done
  sed -i "2i #include <GL/glu.h>" SyntopiaCore/GLEngine/{Sphere.h,Raytracer/RayTracer.cpp}

  qmake -project -after "CONFIG+=opengl" -after "QT+=xml opengl script" -after "unix:LIBS+=-lGLU -L/usr/lib64"
  qmake
  make
}

package() {
  cd "$srcdir/Structure Synth Source Code/"
  mkdir -p "$pkgdir/usr/share/applications"
  cp structure-synth.desktop "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"
  cp images/fileicons/StructureSynth-256.png "$pkgdir/usr/share/icons/structure-synth.png"

  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -rv Examples Misc "$pkgdir/usr/share/$pkgname"
  #rm -r "${pkgdir}/usr/share/${pkgname}/Examples/DontDeploy"
  chmod -R 0644 "$pkgdir/usr/share/$pkgname" 
  chmod 0755 "$pkgdir/usr/share/$pkgname"
  chmod 0755 "$pkgdir/usr/share/$pkgname/Examples"
  chmod 0755 "$pkgdir/usr/share/$pkgname/Examples/Tutorials"
  chmod 0755 "$pkgdir/usr/share/$pkgname/Misc"
  install -Dm0755 "Structure Synth Source Code" "$pkgdir/usr/bin/structure-synth"
}

# vim:set ts=2 sw=2 et:
