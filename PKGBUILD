# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=jadx-git
_gitname=jadx
pkgver=0.6.0.509.e4fef40
pkgrel=1
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files'
url='https://github.com/skylot/jadx'
arch=('any')
license=('Apache')
depends=('java-runtime' 'bash' 'fontconfig' 'xorg-font-utils')
makedepends=('git' 'java-environment' 'gradle')
provides=('jadx')
conflicts=('jadx')
source=(${pkgname}::git+https://github.com/skylot/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  gradle --gradle-user-home=. dist
}

check() {
  cd ${pkgname}
  gradle --gradle-user-home=. test
}

package() {
  cd ${pkgname}/build/jadx

  install -Dm 755 bin/jadx "${pkgdir}/usr/share/java/${_gitname}/bin/jadx"
  install -Dm 755 bin/jadx-gui "${pkgdir}/usr/share/java/${_gitname}/bin/jadx-gui"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${_gitname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/java/${_gitname}/bin/jadx "${pkgdir}/usr/bin/jadx"
  ln -s /usr/share/java/${_gitname}/bin/jadx-gui "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
