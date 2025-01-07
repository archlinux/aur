# Maintainer: Root-Core <aur at root-core dot net>
__pkgname=MiniLPA
_pkgname=minilpa
pkgname=minilpa-git
pkgver=r21.bb1ee40
pkgrel=1
pkgdesc="Professional LPA UI"
arch=('x86_64')
url="https://github.com/EsimMoe/MiniLPA"
license=('AGPL-3.0')
makedepends=('powershell-bin' 'jdk-openjdk')
depends=('java-runtime-common')
provides=("minilpa")
conflicts=("minilpa")
source=(
  git+https://github.com/EsimMoe/MiniLPA.git
  $_pkgname.desktop
  $_pkgname.sh
)
sha256sums=(
  SKIP
  c3f3c4f24581d89af194e6605eb3fdac59612752b94e6841d15aff927d812a13
  4aeb061946552e1974415e2954bc6057f118ca51a78b0545cb79b1dcd934f409
)

pkgver() {
  cd $srcdir/$__pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
