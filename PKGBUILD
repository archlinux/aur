# Maintainer: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jose Valecillos <valecillosjg@gmail.com>

pkgname=dosbox-svn
pkgver=0.74.3935
pkgrel=1
pkgdesc="An emulator with builtin DOS for running DOS Games"
arch=(i686 x86_64)
url=http://dosbox.sourceforge.net/
license=(GPL2)
depends=(alsa-lib hicolor-icon-theme libgl libpng mesa sdl_net sdl_sound)
makedepends=(subversion)
provides=(dosbox)
conflicts=(dosbox)
source=($pkgname::svn+https://dosbox.svn.sourceforge.net/svnroot/dosbox/dosbox/trunk
    $pkgname.desktop
    dosbox-16.png 
    dosbox-48.png 
    dosbox-128.png)
install=$pkgname.install
sha256sums=('SKIP'
    '7c8db8a5a475f54283748b539b50fa49b59a87c5ff80e94e82520530b996f871'
    'e657254e56dd7d66cb1cefbf37f0f360e13a221bc60b1638c00dcda508f7fd56'
    'e71a3984170b3bf7af7d9cfbec0752187d70be76602721a1227b60980d7c380a'
    '228593e97732eaa31e0202b7d46da9d7529672369c17312db3f97784601b5d81')
sha512sums=('SKIP'
    'd71f0fce8a2280c2a30566cb5367eaf153982c075bdccd7744ad5d5beb79e26bcfddcbc57c56fa433ebded4c465ad4939ae56e8de5ea36e30d0995623746e679'
    'a6296813cfe2161d3bea5e0f741d55a2f62fa6536ed530787d3992656cd90b790b37166a5ab044a500e269b8524b699d61538d17e3cc94e10c0369d4a45d6138'
    'c51d622af0250e30e44bc7401217a7489f5e50cd4d8ea76d6dc55a44ed4317e00ee96b63066b1883a6239fa5ab820936d427fa23d5263dde0d7464cf46fed9b4'
    'accb9500ad7c7d9fdff580ca59a3b3746f8a7e0ae27f02a2a74d57ab439bcf5ee04846e0e8d1544b5e656d08ec8a86c0f5c0e1b5856115d5c9be0baa3a577f5e')

pkgver(){
    echo $(cat $pkgname/VERSION).$(svnversion "$SRCDEST"/$pkgname/)
}

build() {
    cd $pkgname/
    sh autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc/dosbox
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install

    # Fix invalid permissions FS#10732
    chmod 755 "$pkgdir"/usr/share/man/man1
    
    for i in 16 48 128; do
	install -Dm644 dosbox-$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/dosbox.png
    done
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}
