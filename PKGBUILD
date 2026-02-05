# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite
pkgver=1.92
pkgrel=2
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash gcc-libs libglvnd glibc zlib gnustep-base
          espeak-ng glu nspr openal sdl12-compat libvorbis libpng)
makedepends=(gnustep-make gcc-objc git)
source=("oolite-$pkgver::git+https://github.com/OoliteProject/oolite#tag=$pkgver"
        git+https://github.com/OoliteProject/oolite-binary-resources.git
        git+https://github.com/OoliteProject/oolite-mac-components
        git+https://github.com/OoliteProject/oolite-linux-dependencies.git
        git+https://github.com/OoliteProject/oolite-tests.git
        git+https://github.com/OoliteProject/oolite-sdl-dependencies.git
        git+https://github.com/OoliteProject/spidermonkey-ff4.git
        git+https://github.com/OoliteProject/libogg-1.3.0.git
        git+https://github.com/OoliteProject/libvorbis-1.3.3.git
        git+https://github.com/OoliteProject/oolite-windows-dependencies.git
        oolite
)

sha512sums=('adb10045983f6d827ff2653cecd5288e61697a8dacdfe83bbb2508c231aa32cff5208579f081eae97b7584a449a124ceb854874f438f952e2eef505d505eee70'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a2ac7e4aef605c67bf311a0a915bea72af96e510e22fb212419fc37b7881990e270a30b96b63e1825d85249c3708b6324c31b105419d26b7804488640da54ffe')

prepare() {
  # png.h & pngconf.h in the oolite-linux-dependencies submodule screw up the use of libpng 1.6.x at runtime , remove them
  rm oolite-linux-dependencies/include/png.h oolite-linux-dependencies/include/pngconf.h
  pushd oolite-$pkgver
  git submodule init
  git config submodule.Resources/Binary.url "$srcdir"/oolite-binary-resources
  git config submodule.Mac-specific.url "$srcdir"/oolite-mac-components
  git config submodule.deps/Linux-deps.url "$srcdir"/oolite-linux-dependencies
  git config submodule.tests.url "$srcdir"/oolite-tests
  git config submodule.deps/Cross-platform-deps.url "$srcdir"/oolite-sdl-dependencies
  git config submodule.deps/mozilla.url "$srcdir"/spidermonkey-ff4
  git config submodule.deps/libogg.url "$srcdir"/libogg-1.3.0
  git config submodule.deps/libvorbis.url "$srcdir"/libvorbis-1.3.3
  git config submodule.deps/Windows-deps.url "$srcdir"/oolite-windows-dependencies
  git -c protocol.file.allow=always submodule update
  popd
}


build() {
  cd oolite-$pkgver
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release
}

package() {
  cd oolite-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite,applications,pixmaps,doc/oolite}
  cp -r oolite.app/* "$pkgdir"/usr/share/oolite/
  
  install -D -m755 "$srcdir"/oolite "$pkgdir"/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png "$pkgdir"/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop "$pkgdir"/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf "$pkgdir"/usr/share/doc/oolite/
}
