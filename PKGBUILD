# Maintainer: dalz <aur @t alsd d0t eu>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-voxel
pkgver=3.2.3
pkgrel=1
pkgdesc="The Godot game engine, plus Zylann's voxel tools module"
url="http://www.godotengine.org"
license=('MIT')
arch=('x86_64')
makedepends=('scons' 'gcc' 'yasm')
depends=('libxcursor' 'libxinerama' 'freetype2' 'alsa-lib' 'libxrandr' 'libxi' 'libglvnd')
conflicts=("godot" "godot-git" "godot-pulse")
source=("https://github.com/godotengine/godot/archive/${pkgver}-stable.tar.gz"
        "https://github.com/Zylann/godot_voxel/archive/godot${pkgver}.zip")
sha256sums=('4c2a8e7da1ad05c6223b0ff6cf2be124dad6708b56a8ec9910dc2aaf82a553ae'
            'c8b212909961fd398b417b7562d6c483975ccc9cb2649660c4f95f438907acf5')

build() {
  ln -s "$srcdir/godot_voxel-godot$pkgver" "$srcdir/godot-$pkgver-stable/modules/voxel"

  cd "${srcdir}/godot-${pkgver}-stable"

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=no \
        colored=yes \
        pulseaudio=no bits=64 -j $((`nproc`+1))
}

package() {

  cd "${srcdir}"

  install -Dm644 "${srcdir}"/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -Dm644 "${srcdir}"/godot-${pkgver}-stable/icon.svg "${pkgdir}"/usr/share/pixmaps/godot.svg

  cd "${srcdir}"/godot-${pkgver}-stable

  install -D -m755 bin/godot.x11.opt.tools.64 "${pkgdir}"/usr/bin/godot
  install -D -m644 "${srcdir}"/godot-${pkgver}-stable/LICENSE.txt "${pkgdir}"/usr/share/licenses/godot/LICENSE
  install -D -m644 "${srcdir}"/godot-${pkgver}-stable/misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}
