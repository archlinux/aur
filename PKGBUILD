# Maintainer: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

_pkgname=playonlinux5
pkgname=$_pkgname-git
pkgver=5.0.r1235.edcd1a7
pkgrel=1
epoch=1
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'gradle' 'maven' 'java-gnome' 'java-environment>=8' 'java-openjfx')
options=(!strip)
source=("$_pkgname::git://github.com/PlayOnLinux/POL-POM-5.git"
        'PlayOnLinux.desktop')
md5sums=('SKIP'
         '7fe925810fc7ec6d8745817b1c541e7b')

pkgver() {
  cd "$_pkgname"

  _ver=$(grep -m1 "<version>" pom.xml | cut -d ">" -f2 | cut -d "-" -f1)
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"

  echo "${_ver}.r${_rev}.${_hash}"
}

build() {
  cd "$_pkgname"

  # Set environment
  export JAVA_HOME="/usr/lib/jvm/default"

  # Clean up
  mvn clean

  # Build
  mvn package
}

package() {
  # Extract
  install -d "$pkgdir/opt/"
  bsdtar -xf "$_pkgname/phoenicis-dist/target/phoenicis-dist.zip"
  cp -r phoenicis-dist/ "$pkgdir/opt/$_pkgname/"

  # Launcher
  install -d "$pkgdir/usr/bin/"
  ln -s "/opt/$_pkgname/PlayOnLinux.sh" "$pkgdir/usr/bin/$_pkgname"
  sed -i 's|$(dirname $0)|/opt/playonlinux5|' "$pkgdir/opt/$_pkgname/PlayOnLinux.sh"

  # Icon + Desktop
  install -Dm644 "$srcdir/$_pkgname/phoenicis-javafx/target/classes/com/playonlinux/javafx/common/playonlinux.png" \
                 "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 PlayOnLinux.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
