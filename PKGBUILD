# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
pkgname=ft2-clone
pkgver=b159
pkgrel=2
epoch=
pkgdesc="A portable Fasttracker II clone written in C."
arch=('x86_64')
url="https://16-bits.org/ft2.php"
license=('BSD')
makedepends=('gcc' 'libicns')
depends=('alsa-lib' 'sdl2')
source=("https://16-bits.org/ft2clone-$pkgver-code.zip"
        "ft2-clone.desktop")
sha512sums=('3a53ac32a15742eb1d4bacf0c1906cbf96c81e7f13d9bcdd5e6907fb1d393c46353afd7da651148f3e54da866737ad5b5e95cb3edd63579eee3d6a7aedece3af'
            'e095a21dd5165b130426b3df0735f00b34694ea3eb5b0b93699d89cb503b3fd0cff7b15f214d123643a0c323e988185fdfbf5452e971970957cebd4a5da1033e')

build() {
  cd "$srcdir/$pkgname-code"
  
  icns2png -x "release/macos/ft2-osx.app/Contents/Resources/ft2-osx.icns" 

  # If you're compiling for *SLOW* devices, try adding -DLERPMIX right after gcc
  # This will activate 2-tap linear interpolation mixing (blurrier sound) instead
  # of 3-tap quadratic interpolation mixing (sharper sound)
  gcc -D__LINUX_ALSA__ src/rtmidi/*.cpp src/gfxdata/*.c src/*.c -lSDL2 -lpthread -lasound -lstdc++ -lm -Wshadow -Winit-self -Wall -mno-ms-bitfields -Wno-stringop-truncation -Wno-missing-field-initializers -Wno-unused-result -Wno-strict-aliasing -Wextra -Wunused -Wunreachable-code -Wswitch-default -march=native -mtune=native -O3 -o release/other/ft2-clone
}

package() {
	install -D -m 755 "$srcdir/$pkgname-code/release/other/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-code/src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/ft2-clone.desktop" "$pkgdir/usr/share/applications/ft2-clone.desktop"
  install -Dm644 "$srcdir/$pkgname-code/ft2-osx_256x256x32.png" "$pkgdir/usr/share/pixmaps/ft2-clone.png"
}
