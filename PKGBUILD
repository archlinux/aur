# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=ilspymono-git
pkgver=r2.933d582
pkgrel=1
pkgdesc="CLI reflector for Mono based on ILSpy"
arch=('any')
url="http://github.com/andreif/ILSpyMono"
license=('MIT' 'LGPL2.1' 'custom:MSPL')
depends=('mono')
makedepends=('git')
provides=('ilspymono')
conflicts=('ilspymono')
options=('!strip')
source=("git://github.com/andreif/ILSpy.git"
		"git://github.com/icsharpcode/AvalonEdit.git"
		"git://github.com/icsharpcode/NRefactory.git"
		"git://github.com/jbevain/cecil.git"
		"git://github.com/andreif/ILSpyMono.git")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd ILSpyMono
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ILSpy
	git submodule init
	git config submodule.AvalonEdit.url "$srcdir/AvalonEdit"
	git config submodule.NRefactory.url "$srcdir/NRefactory"
	git config submodule.cecil.url "$srcdir/cecil"
	git config submodule.ILSpyMono.git "$srcdir/ILSpyMono"
	git submodule update
}

build() {
	cd ILSpy/ILSpyMono
	xbuild /p:Configuration=Release ILSpyMono.csproj
}

package() {
	mkdir -pv "${pkgdir}/usr/"{bin,lib/mono/ilspymono}
	cp ILSpy/ILSpyMono/bin/Release/* "${pkgdir}/usr/lib/mono/ilspymono"
	cat > "${pkgdir}/usr/bin/ilspymono" << EOF
#!/bin/sh
mono /usr/lib/mono/ilspymono/ILSpyMono.exe \$@
EOF
	chmod +x "${pkgdir}/usr/bin/ilspymono"
	# It's kinda tricky - ILSpyMono uses a very straightforward MIT license, but it contains
	# code from ILSpy, which uses a combination of MIT, LGPL, and MS-PL licenses for its
	# various components. On top of that, the MIT license file references the two secondary
	# licenses by filename, and since it doesn't seem like a good idea to invalidate or modify
	# the license, I decided to install both of them next to the main license by their original
	# filenames, even though the LGPL2.1 is an Arch standard license.
	install -D -m644 ILSpy/ILSpyMono/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 ILSpy/doc/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.ILSpy"
	install -D -m644 ILSpy/doc/LGPL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LGPL.txt"
	install -D -m644 ILSpy/doc/MS-PL.txt "${pkgdir}/usr/share/licenses/${pkgname}/MS-PL.txt"
}
