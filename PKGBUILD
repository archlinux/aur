# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.91.0.7698.250828.92588c7.r0.92588c7f8
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash gcc-libs libglvnd libx11 glibc zlib gnustep-base
          espeak-ng libpng14 glu nspr openal sdl12-compat libvorbis)
makedepends=(gnustep-make gcc-objc git)
source=(oolite-git::git+https://github.com/OoliteProject/oolite
        git+https://github.com/OoliteProject/oolite-binary-resources.git
        git+https://github.com/OoliteProject/oolite-mac-components
        git+https://github.com/OoliteProject/oolite-linux-dependencies.git
        git+https://github.com/OoliteProject/oolite-tests.git
        git+https://github.com/OoliteProject/oolite-sdl-dependencies.git
        git+https://github.com/OoliteProject/spidermonkey-ff4.git
        git+https://github.com/OoliteProject/libogg-1.3.0.git
        git+https://github.com/OoliteProject/libvorbis-1.3.3.git
        git+https://github.com/OoliteProject/oolite-windows-dependencies.git
        oolite-git.sh
        linux-force-use-of-libpng14.patch
        linux_force_espeak-ng.patch
)

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9eacfddce04dcc91df12038be04387abd508e2e16248561d15c92c173d5b94a363d6b8fa4df644c07732b2cb484aaa0c11b7a07e56295e2d30a87de59f760aef'
            'd0b77a8375bdaadef9a79d287abcb2941b6b50e9e7f8d400d89ec384eaacabaa12353d5d3432b8e8714bae687c3026748e781ab104cc6ad96b81590cf6eac743'
            'ab1062b9669b51b133824e6c0fdd0cd6d7f2c0ba88db41c1cfbb001626b1e0bcbf93d883f11a873d7d7e0d05311808d9b317fd7a0ce08a6ab7b72667cd3c71da')

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


prepare(){
  cd oolite-git
  cp .absolute_gitmodules .gitmodules
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
  
  patch -Np1 -i "$srcdir"/linux-force-use-of-libpng14.patch
  patch -Np1 -i "$srcdir"/linux_force_espeak-ng.patch
}


build() {
  cd oolite-git
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release
}

package() {
  cd oolite-git

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite-git,applications,pixmaps,doc/oolite-git}
  cp -r oolite.app/* "$pkgdir"/usr/share/oolite-git/
  install -D -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -D -m644 installers/FreeDesktop/oolite-icon.png "$pkgdir"/usr/share/pixmaps/oolite-icon-git.png
  
      sed -e 's:Name=Oolite:Name=oolite--git:' \
        -e 's:Exec=oolite:Exec=/usr/bin/oolite-git.sh:' \
        -e 's:Icon=oolite-icon:Icon=/usr/share/pixmaps/oolite-icon-git.png:' \
        -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
        <installers/FreeDesktop/oolite.desktop \
        >oolite-git.desktop

  install -D -m644 oolite-git.desktop "$pkgdir"/usr/share/applications/oolite-git.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf "$pkgdir"/usr/share/doc/oolite-git/
}
