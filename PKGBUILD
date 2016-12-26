# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

# Build notes:
# http://wiki.playonlinux.com/index.php/Building_PlayOnLinux_5

_pkgname=playonlinux5
pkgname=$_pkgname-git
pkgver=r1328.6376ad23
pkgrel=3
epoch=2
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
makedepends=('git' 'gradle' 'maven' 'java-openjfx' 'java-environment>=8')
depends=('wine')
options=(!strip)
source=(
	"$_pkgname::git://github.com/PlayOnLinux/POL-POM-5.git"
        'PlayOnLinux5.desktop'
	'PlayOnLinux.sh'
	)
sha256sums=(
	'SKIP'
	'4703fc813fb18d3e414cc1483f03cb3c0c306e5725b7681b3dbc43fb7f6630de'
	'9deabf8918a55e5726d9708e074a3420701f89f57748779f78a8ee681fbe97e4'
	)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  # Set environment
  # Use path to Java 8 for users nkt defaulted to Java 8 yet
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

  # Build
  mvn package

}

package() {

  # Extract
  install -d "$pkgdir/opt/"
  bsdtar -xf "$_pkgname/phoenicis-dist/target/phoenicis-dist.zip"
  cp -r phoenicis-dist/ "$pkgdir/opt/$_pkgname/"

  # Launcher
  install -Dm755 "PlayOnLinux.sh"  "$pkgdir/usr/bin/$_pkgname"

  # Icon + Desktop
  install -Dm644 "$srcdir/$_pkgname/phoenicis-javafx/target/classes/com/playonlinux/javafx/views/common/playonlinux.png" \
                 "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 PlayOnLinux5.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

}
