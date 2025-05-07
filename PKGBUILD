# Maintainer: brionical27 <brionical@proton.me>
pkgname=hedgemodmanager-git
pkgver=8.0.0.beta4.r20
pkgrel=2
pkgdesc="(UNOFFICIAL PACKAGE) A mod manager for Hedgehog Engine games on PC."
arch=(x86_64)
url="https://github.com/hedge-dev/HedgeModManager"
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'git')
conflicts=('hedgemodmanager-bin')
source=("hedgemodmanager::git+https://github.com/hedge-dev/HedgeModManager.git")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd $srcdir/hedgemodmanager
  mkdir -p $srcdir/build
  git rev-parse HEAD > $srcdir/build/commit.txt
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

# prepare() {}

build() {
  cd $srcdir/hedgemodmanager
  dotnet publish -p:PublishProfile=linux-x64 -c Release -o $srcdir/build $srcdir/hedgemodmanager/Source/HedgeModManager.UI/HedgeModManager.UI.csproj
  sed -i "s|/app/bin/HedgeModManager\.UI|/opt/HedgeModManager/HedgeModManager\.UI|" $srcdir/hedgemodmanager/flatpak/hedgemodmanager.desktop
}

# check() {}

package() {
  mkdir -p $pkgdir/opt/HedgeModManager
  mkdir -p $pkgdir/usr/bin
  install -Dm644 $srcdir/hedgemodmanager/flatpak/hedgemodmanager.png $pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.hedge_dev.hedgemodmanager.png
  install -Dm644 $srcdir/hedgemodmanager/flatpak/hedgemodmanager.desktop $pkgdir/usr/share/applications/hedgemodmanager.desktop
  cp -a $srcdir/build/. $pkgdir/opt/HedgeModManager
  echo -e "#!/usr/bin/sh\nexec /opt/HedgeModManager/HedgeModManager.UI \"\$@\"" >> $pkgdir/usr/bin/hedgemodmanager
  chmod +x $pkgdir/usr/bin/hedgemodmanager
}
