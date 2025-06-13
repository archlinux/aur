# Maintainer: Root-Core <aur at root-core dot net>
__pkgname=MiniLPA
_pkgname=minilpa
pkgname=minilpa-git
pkgver=r21.bb1ee40
pkgrel=2
pkgdesc="Professional LPA UI"
arch=('x86_64')
url="https://github.com/EsimMoe/MiniLPA"
license=('AGPL-3.0')
makedepends=('powershell-bin' 'jdk-openjdk' 'git')
depends=('java-runtime-common')
provides=("minilpa")
conflicts=("minilpa")
source=(
  git+https://github.com/EsimMoe/MiniLPA.git
  $_pkgname.desktop
  $_pkgname.sh
  eum-manifest.json
  ci-manifest.json
)
sha256sums=(
  SKIP
  c3f3c4f24581d89af194e6605eb3fdac59612752b94e6841d15aff927d812a13
  4aeb061946552e1974415e2954bc6057f118ca51a78b0545cb79b1dcd934f409
  88eb7c2d3a8c4903c761ca8265c5af56960fd5fe5834887d41acd74312f39ec6
  00296c332838d593f9066d8d53d20763aa9c77bc512f3d4e38b5357fd1f6bdad
)

pkgver() {
  cd $srcdir/$__pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$__pkgname
  cp $srcdir/{eum,ci}-manifest.json src/main/resources/
  mkdir -p build
  echo -n "1749825743526" > build/euicc_info_update_time
}

build() {
  cd $srcdir/$__pkgname
  pwsh scripts/Build.ps1 -NativeExecutable -NativeWayland -NativeExecutableType app-image
}

package() {
  install -Dm755 $_pkgname.sh $pkgdir/usr/bin/$_pkgname
  install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  cd $srcdir/$__pkgname
  cd build/dist
  bsdtar -xf MiniLPA-Linux-x86_64-Wayland.zip
  install -Dm755 lib/app/MiniLPA-all.jar $pkgdir/usr/lib/$_pkgname/MiniLPA.jar
  install -Dm644 lib/MiniLPA.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png
}
