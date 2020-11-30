# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>

pkgname=qcad-git
pkgver=v3.25.2.4.r13.g07852efee
pkgrel=1
epoch=
pkgdesc="QCAD - The Open Source 2D CAD"
arch=('x86_64')
url="https://github.com/qcad/qcad"
license=('GPL3')
groups=()
depends=('qt5-script' 'qt5-svg' 'qt5-xmlpatterns' 'freetype2')
makedepends=('glu' 'git' 'qt5-tools')
provides=('qcad')
conflicts=('qcad')
source=('git+https://github.com/qcad/qcad.git')
sha256sums=('SKIP')

pkgver() {
	cd qcad
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/qcad

	# Don't require specific Qt version
	sed -e 's|$${QT_VERSION}|5.15.1|g' \
       -i src/3rdparty/3rdparty.pro

   qmake -r CONFIG+=ractivated
   make release
}

package() {
   cd "$srcdir"/qcad

   # Directory of installation
   install -d -m 755 "$pkgdir"/opt/qcad

   cp -r examples fonts libraries linetypes patterns scripts themes ts \
      "$pkgdir"/opt/qcad
   cp -r plugins platforminputcontexts platforms xcbglintegrations ts \
      "$pkgdir"/opt/qcad

   # Executable qcad-bin
   install -T release/qcad-bin "$pkgdir"/opt/qcad/qcad-bin
   # Shared libraries
   install -D release/*.so "$pkgdir"/opt/qcad

   # readme
   install -D -T -m 644 readme.txt "$pkgdir"/opt/qcad/readme.txt

   # man
   install -D -T -m 644 qcad.1 "$pkgdir"/usr/share/man/man1/qcad.1

   # icon and desktop entry
   install -D -T -m 644 scripts/qcad_icon.png "$pkgdir"/usr/share/pixmaps/qcad_icon.png
   install -D -T -m 644 qcad.desktop "$pkgdir"/usr/share/applications/qcad.desktop

   install -d -m 755 "$pkgdir"/usr/bin
   # create executable on /usr/bin

   touch "$pkgdir"/usr/bin/qcad
   echo '#!/bin/sh' >> "$pkgdir"/usr/bin/qcad
   echo 'LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}"/opt/qcad" \' >> "$pkgdir"/usr/bin/qcad
   echo '   exec /opt/qcad/qcad-bin "$@"' >> "$pkgdir"/usr/bin/qcad

   chmod 0755 "$pkgdir"/usr/bin/qcad

   echo $pkgdir
}
