# Maintainer: Carson Rueter <roachh@protonmail.com>
# Contributor: Carson Rueter <roachh@protonmail.com>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=twombit
_installdir=/usr/share/$pkgname
pkgrel=1
pkgver=1.0.5
pkgdesc="A cycle/bus accurate emulator for Sega's 8-bit game consoles (Master System, Gamegear, SG-1000)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('GPL')
depends=('freeglut'
         'glu'
         'openal'
         'qt4'
         'sdl')
source=("https://sourceforge.net/projects/$pkgname/files/v%20$pkgver/${pkgname}_src.zip"
        "nonerror_type_fix.patch"
        "settings_path_fix.patch"
	"build_fix.patch"
	"build_fix2.patch"
        "twombit.desktop"
        "twombit.png")
sha256sums=('c5fb1651176b75545445fbdec90739f0c4ef8550f628f814f240b4dda1eab624'
            'cbcdfb10f3ca9d6b12cccf479dbf67b48f0b441600f0fa77795e7842aebc43fd'
            '171aa5601fbdbb28340a72e2de520b6bb7c8d021df9bdc8ad1379916d961be3f'
            '572553a29312c3255a669540788f902c7d8d6e1cdd2d0c386ac018ff54c836f0'
            '74b489efb444ae667f0fd2902d5bb7e0ac1a43f8830f74f8952cbd055be713b6'
            '70202b3113b4b61ddd504a99493ca01f829a896ffac7ec686d344e0fbce535b8'
            '9988bbb328bc546ba21655e695049edc2112bb00f683a565aa237a0fbbf220de')

build() {
  cd src
  patch --binary -Np1 -i ../nonerror_type_fix.patch
  patch --binary -Np1 -i ../settings_path_fix.patch
  patch --binary -Np1 -i ../build_fix.patch
  patch --binary -Np1 -i ../build_fix2.patch
  qmake-qt4 TwoMbit.pro
  make  -j $(cat /proc/cpuinfo | grep processor | wc -l)
}

package()  {
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$pkgname.png" "$pkgdir$_installdir/$pkgname.png"
  install -D -m755 "src/TwoMbit" "$pkgdir$_installdir/TwoMbit"
  install -D -m644 "src/language/english.xml" "$pkgdir$_installdir/language/english.xml" 
  install -D -m644 "src/language/german.xml" "$pkgdir$_installdir/language/german.xml"    
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
