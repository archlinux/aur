# Maintainer: crave <crave@infinity>

pkgname=dafny-git
pkgver=v2.2.0.r19.g45af975d
pkgrel=1
pkgdesc="Dafny is a verification-aware programming language"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/dafny.git"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'wget')
provides=('dafny')
source=("$pkgname"::"git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/z3-//;s/-/.r/;s/-/./'
}

build() {
  if [ ! -d "boogie" ]; then
    git clone https://github.com/boogie-org/boogie.git
  else
    (cd boogie && git pull)
  fi
  [ -f nuget.exe ] || wget https://nuget.org/nuget.exe

  mono ./nuget.exe restore boogie/Source/Boogie.sln
  msbuild boogie/Source/Boogie.sln

  mono ./nuget.exe restore dafny-git/Source/Dafny.sln
  msbuild dafny-git/Source/Dafny.sln

  #mono ./nuget.exe restore dafny-git/Source/DafnyExtension.sln
  #msbuild dafny-git/Source/DafnyExtension.sln
}

package() {
  cd ${pkgname}/Binaries

  # Creating directories
  install -dm755 $pkgdir/opt/dafny
  install -dm755 $pkgdir/usr/bin

  # Copy dependencies
  cp -r * "${pkgdir}"/opt/dafny/
  ln -s /opt/dafny/dafny "${pkgdir}"/usr/bin/dafny
  mkdir -p "${pkgdir}/opt/dafny/z3/bin"
  ln -s /usr/bin/z3 "${pkgdir}/opt/dafny/z3/bin/z3"
}

