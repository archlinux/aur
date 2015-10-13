pkgname=ucloner
pkgver=10.10.2
rev=beta1
pkgrel=1
pkgdesc="Ucloner"
arch=('any')
url="https://code.google.com/p/ucloner"
license=('GPL')
depends=('python2' 'vte' 'squashfs-tools' 'zenity' 'gksu')
optdepends=('jfsutils' 'reiserfsprogs' 'xfsprogs')
source=(
    'https://ucloner.googlecode.com/files/UCloner-10.10.2-beta1.tar.gz'
    'ucloner.sh'
    'ucloner.desktop'
    'ucloner.png'
    'modify_path.patch'
    'fix_package_querying.patch'
)

md5sums=('b7bf49a5516cb9e00943e06e3e73adf2'
         '3dac4b28900e7be1068b502b7b848028'
         '5cdaafea263be59c57602cd06082c64e'
         '1f913fe9ca34481134bc36e1045e9a20'
         '3e6d3d3005380a888b7a97d2b79880cf'
         'c84c4aaba3bf5c7fbb6126190cb341ca')


prepare() {
    cd "${srcdir}/UCloner-$pkgver-$rev"
    patch -p1 < "${srcdir}/modify_path.patch"
    patch -p1 < "${srcdir}/fix_package_querying.patch"
    cd program
    rm *.pyc
    find -name '*.py' | xargs sed -i 's|#!/usr/bin/python$|#!/usr/bin/env python2|'
    python2 -m compileall .
}


package() {
  install -dm 755 "$pkgdir/opt"
  cp -r "${srcdir}/UCloner-$pkgver-$rev/program" "$pkgdir/opt/ucloner"
  install -Dm 755 "${srcdir}/ucloner.sh" "$pkgdir/usr/bin/ucloner"
  install -Dm 755 "${srcdir}/ucloner.desktop" "$pkgdir/usr/share/applications/ucloner.desktop"
  install -Dm 755 "${srcdir}/ucloner.png" "$pkgdir/usr/share/icons/ucloner.png"
}

