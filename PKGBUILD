# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=jadx-git
_gitname=jadx
pkgver=0.8.0.735.a8febb2
pkgrel=1
pkgdesc='Command line and GUI tools to produce Java source code from Android Dex and APK files'
url='https://github.com/skylot/jadx'
arch=('any')
license=('Apache')
depends=('java-runtime=8' 'bash' 'fontconfig' 'xorg-font-utils')
makedepends=('git' 'java-environment=8' 'gradle')
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
  gradle dist
}

check() {
  cd ${pkgname}
  gradle test
}

package() {
  cd ${pkgname}/build/jadx

  install -Dm 755 bin/{jadx,jadx-gui} -t "${pkgdir}/usr/share/java/${_gitname}/bin"
  install -Dm 644 lib/* -t "${pkgdir}/usr/share/java/${_gitname}/lib"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/java/${_gitname}/bin/jadx "${pkgdir}/usr/bin/jadx"
  ln -s /usr/share/java/${_gitname}/bin/jadx-gui "${pkgdir}/usr/bin/jadx-gui"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 NOTICE README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
