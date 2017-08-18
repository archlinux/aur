# Maintainer: Salamandar <felix@piedallu.me>

pkgname=livewallpaper
pkgdesc="OpenGL powered animated wallpapers with configuration utility, autostart, and application indicator."
url="https://launchpad.net/livewallpaper"
license=('GPL3')

pkgver=0.5.0
pkgrel=1
arch=('x86_64' 'i686')

makedepends=('intltool' 'xcftools' 'cmake' 'vala')
depends=(
    'libpeas' 'upower' 'libappindicator-gtk3' 'gobject-introspection'
    'python' 'python-cairo' 'python-opengl' 'glew'
)

source=(
    'https://launchpad.net/livewallpaper/0.5/0.5.0/+download/livewallpaper-0.5.0.tar.gz'
)

sha256sums=(
    'f4ce97a721015b135eb675915eb306c1fb256e680d480fe13e4fe6ca81c7e04e'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Add inexisting folder
    sed -i '/add_subdirectory(debian)/d' CMakeLists.txt
    # Disable doc generation (needs gtk-doc)
    sed -i '/add_subdirectory(doc)/d' CMakeLists.txt
    # Please use python3
    sed -i '1i #!/usr/bin/python3'          plugins/circles/circles.py
    sed -i '1i #!/usr/bin/python3'          plugins/photoslide/photoslide.py
    # Fix old API
    sed -i -e 's/fromstring/frombytes/g'    plugins/photoslide/photoslide.py
    sed -i -e 's/tostring/tobytes/g'        plugins/photoslide/photoslide.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
    make DESTDIR="$pkgdir/"
}

package() {
	cd "$srcdir/$pkgname-$pkgver/cmake"
	make DESTDIR="$pkgdir/" install
}
