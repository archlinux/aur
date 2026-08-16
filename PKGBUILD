# Maintainer: alexytomi <alexytomi101@gmail.com>

pkgname=dell-powermanager-git
pkgver=0.13.0.r0.g2803dc0
pkgrel=1
pkgdesc='Cross-platform Dell Power Manager re-implementation'
arch=('x86_64')
url='https://github.com/alexVinarskis/dell-powermanager'
license=('GPL-3.0-only')
provides=('dell-powermanager')
conflicts=('dell-powermanager')

makedepends=(
  # Package deps
  'ninja'
  'gtk3'
  'sqlite'
  'libsecret'
  # Flutter SDK deps
  'curl'
  'git'
  'unzip'
  'xz'
  'zip'
  'glu'
)

depends=(
  'dell-command-configure' # AUR
)

# We manually clone the flutter SDK because there is literally no
# working flutter package as of writing, using fvm seems to be
# dependent on github clone speed which as of writing, is very
# spotty/slow and fvm adds unneeded complexity.

# Sadly this means that this PKGBUILD may need flutter sdk updates
# if the program starts needing newer ones, so check that first
# if this breaks.

source=(
  "git+https://github.com/alexVinarskis/dell-powermanager.git"
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.47.0-stable.tar.xz"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/dell-powermanager"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/dell-powermanager"
  # Following package.sh in the repo, which is for debian
  PACKAGE="dell-powermanager"
  NAME="Dell Power Manager by VA"
  VERSION=$(git describe --tags)
  sed -i "s|applicationName".*"|applicationName = '${NAME}';|g" ./lib/configs/constants.dart
  sed -i "s|applicationPackageName".*"|applicationPackageName = '${PACKAGE}';|g" ./lib/configs/constants.dart
  # Make sure this is semver. The version update checker doesn't
  # seem to be built for anything else.

  # Also the OTA checker can't be disabled without
  # a lot of changes.
  sed -i "s|applicationVersion".*"|applicationVersion = '${VERSION}';|g" ./lib/configs/constants.dart

  $srcdir/flutter/bin/flutter config --enable-linux-desktop
  $srcdir/flutter/bin/flutter build linux --release
}

package() {
  cd "$srcdir/dell-powermanager"
  local appdir="$pkgdir/opt/dell-powermanager"
  install -dm755 "$appdir"

  cp -a build/linux/x64/release/bundle/. "$appdir/"
  install -dm755 "$pkgdir/usr/bin"

  ln -s /opt/dell-powermanager/dell_powermanager \
    "$pkgdir/usr/bin/dell-powermanager"

  install -Dm644 \
    resources/dell-powermanager.desktop \
    "$pkgdir/usr/share/applications/dell-powermanager.desktop"

  # Following package.sh in the repo, which is for debian
  sed -i \
    -e 's|{VERSION}|'"$pkgver"'|g' \
    -e 's|{PACKAGE}|dell-powermanager|g' \
    -e 's|{PATH_ICON}|/opt/dell-powermanager/icon.png|g' \
    -e 's|{NAME}|Dell Power Manager by VA|g' \
    "$pkgdir/usr/share/applications/dell-powermanager.desktop"

  install -Dm644 \
    resources/icon.png \
    "$pkgdir/opt/dell-powermanager/icon.png"

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
