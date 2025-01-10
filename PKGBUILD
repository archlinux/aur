# Maintainer: zt64 <zt@zt64.dev>
pkgname=jadx-git
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files'
pkgver=r2368.29d1144
pkgrel=2

arch=('any')
url='https://github.com/skylot/jadx'
license=('Apache-2.0')

depends=('java-runtime>=11' 'sh')
makedepends=('git' 'java-environment>=11')
optdepends=()

provides=('jadx')
conflicts=('jadx')

source=("$pkgname::git+$url.git")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  ./gradlew dist --no-daemon
}

package() {
  cd "$srcdir/$pkgname/build/jadx"

  install -Dm 755 bin/{jadx,jadx-gui} -t "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${pkgname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/jadx" "${pkgdir}/usr/bin/jadx"
  ln -s "/usr/share/java/${pkgname}/bin/jadx-gui" "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 "$srcdir/$pkgname/contrib/jadx-gui.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "$srcdir/$pkgname/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}