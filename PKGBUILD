# Maintainer: Andy Bao <contact at andybao dot me>
_pkgname=spacecadetpinball
pkgname=$_pkgname-git
pkgver=1.1.1.r25.ga281000
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
depends=('sdl2' 'sdl2_mixer')
makedepends=('unrar' 'cmake')
license=('MIT' 'proprietary')
noextract=('Space_Cadet.rar')
url="https://github.com/k4zmu2a/SpaceCadetPinball"
source=(
  'https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar'
  "$pkgname::git+$url"
  'spacecadetpinball.desktop'
)
sha256sums=('3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a'
            'SKIP'
            'SKIP')

prepare() {
  unrar e -y Space_Cadet.rar Space_Cadet/
}

pkgver() {
  cd "$pkgname"
  # cutting off 'Release_' prefix that presents in the git tag
  git describe --long | sed 's/^Release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B "$pkgname/build" -S "$pkgname" \
      -Wno-dev \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make -C "$pkgname/build"
}

package() {
  # Install binary
  install -Dm0755 "$pkgname/bin/SpaceCadetPinball" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
  # Install wrapper script
  install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
# Run program in correct directory so it can find it's resources
cd /usr/lib/$_pkgname
exec ./$_pkgname "\$@"
END
  # Install resources
  cd Space_Cadet
  install -m0644 *.DAT *.DOC *.MID *.BMP *.INF *.WAV -t "$pkgdir/usr/lib/$_pkgname"
  cd ..
  # Install icon
  install -Dm0644 "$pkgname/SpaceCadetPinball/Icon_1.ico" "$pkgdir/usr/lib/$_pkgname/icon.ico"
  # Install desktop launcher
  install -Dm644 spacecadetpinball.desktop -t "$pkgdir/usr/share/applications"
}
