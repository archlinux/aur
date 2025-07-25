# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: SanskritFritz (gmail)
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>


pkgname=oolite
pkgver=1.90
pkgrel=5
pkgdesc="A space-sim based on the classic Elite"
arch=('x86_64')
url="http://oolite.space/"
license=('GPL-2.0-or-later')
depends=(bash gcc-libs libglvnd libx11 glibc zlib gnustep-base
          espeak-ng libpng14 glu nspr openal sdl12-compat libvorbis)
makedepends=(gnustep-make gcc-objc)
source=(https://github.com/OoliteProject/oolite/releases/download/$pkgver/oolite-source-$pkgver.tar.bz2
        oolite
        gcc15_error_unknown_type_name.patch
        fix-deps+include-dirs.patch
)
sha512sums=('d220885f1516a457b9fa661d0dca50a86edce578e11448271bfd618d508f2e67d18fe781c185f8cce6d6d806025eddeef7e30025ef26d7899e0242f0268dfc34'
            '5fdfc216b34c04a279a50f6547195748d165dea51694f4e3fb0d52a75139aa7e74cbf5e9f9580f0b1a106bb13637914a05834798204fcf9cd2e3d66c42c02d1f'
            '6b80efb2dacc0cf2c843a6275425bd6ce987adc8c2b35a2621924494bfb1e26bb2ff417895c39ec75a4c0c86ab11a0264ff9f09cc3c1bc1872283d0613428737'
            '769b397e89f9dd2770b96c027ba6235e711e71403d87319406ee6398644f98d29daf17685cdad9d380d74b69eb29c6a70d7c4afd3292b7033b2bc16fce29acc8')

prepare() {
  cd oolite-source-$pkgver/oolite-source-$pkgver

  patch -Np1 -i "$srcdir"/gcc15_error_unknown_type_name.patch
  patch -Np1 -i "$srcdir"/fix-deps+include-dirs.patch
  chmod +x tools/mkmanifest.sh
}

build() {
  cd oolite-source-$pkgver/oolite-source-$pkgver
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release \
    OBJCFLAGS+=" -Wno-error=incompatible-pointer-types -Wno-format-security"
}

package() {
  cd oolite-source-$pkgver/oolite-source-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite,applications,pixmaps,doc/oolite}

  cp -r oolite.app/* "$pkgdir"/usr/share/oolite/

  install -D -m755 "$srcdir"/oolite "$pkgdir"/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png "$pkgdir"/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop "$pkgdir"/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf "$pkgdir"/usr/share/doc/oolite/
}
# vim:set ts=2 sw=2 et:
