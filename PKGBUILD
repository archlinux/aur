# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.91.0.7725.251218.95855a3.r1.6934322f0
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash gcc-libs libglvnd libx11 glibc zlib gnustep-base
          espeak-ng glu nspr openal sdl12-compat libvorbis libpng)
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
            '07e3a9303ce2fd71ae89e1f0085ca070559a7d40271d5ea31ff965588f01b9259cc7337e734680077dd673343db7f8ad620698a2abd1d6178e15abba6d551ec8')

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


prepare() {
  pushd $pkgname
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
# png.h & pngconf.h in 2 places screw up the use of libpng 1.6.x , remove them
  rm oolite-linux-dependencies/include/png.h oolite-linux-dependencies/include/pngconf.h
  rm $pkgname/deps/Linux-deps/include/png.h $pkgname/deps/Linux-deps/include/pngconf.h
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
