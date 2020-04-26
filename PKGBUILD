# Maintainer: Scott Percival <code@moral.net.au>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jose Valecillos <valecillosjg@gmail.com>

pkgname=dosbox-sdl2
pkgver=0.74.4250
pkgrel=1
pkgdesc="Emulator with builtin DOS for running DOS Games (SDL2)"
arch=("x86_64" "i686")
depends=("sdl2" "sdl2_net" "sdl2_sound-hg" "zlib" "libgl" "glew" "libpng" "alsa-lib" "gcc-libs" "hicolor-icon-theme")
makedepends=("git")
provides=("dosbox")
conflicts=("dosbox")
license=("GPL")
source=("$pkgname::git+https://github.com/duganchen/dosbox.git#branch=master"
        "dosbox-128.png"
        "dosbox-48.png"
        "dosbox-16.png"
        "dosbox-sdl2.desktop"
)
sha256sums=("SKIP"
            "228593e97732eaa31e0202b7d46da9d7529672369c17312db3f97784601b5d81"
            "e71a3984170b3bf7af7d9cfbec0752187d70be76602721a1227b60980d7c380a"
            "e657254e56dd7d66cb1cefbf37f0f360e13a221bc60b1638c00dcda508f7fd56"
            "7c8db8a5a475f54283748b539b50fa49b59a87c5ff80e94e82520530b996f871"
)
install="dosbox-sdl2.install"

build() {
    cd $pkgname/

    sh autogen.sh
    ./configure --prefix=/usr --with-sdl=sdl2 --sysconfdir=/etc/dosbox
    make
}


package() {
    make -C $pkgname DESTDIR="$pkgdir" install

    # Fix invalid permissions FS#10732
    chmod 755 "$pkgdir"/usr/share/man/man1
    
    for i in 16 48 128; do
	install -Dm644 "$srcdir"/dosbox-$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/dosbox.png
    done
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}
