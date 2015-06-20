# Contributor: robb_force <robb_force@holybuffalo.net>
# Contributor: Anton Shestakov <engored*ya.ru>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=sdlmess
pkgver=0.161
pkgrel=1
#_basever=$(echo $pkgver | cut -f1,2 -d. | tr -d .)
#_patchlevel=$(echo $pkgver | cut -f3 -d.)
_basever=${pkgver/./}
_target=mess
pkgdesc='Multiple Emulator Super System, computer and game console emulator'
url='http://www.mess.org/'
license=('custom:MAME License')
arch=('i686' 'x86_64')
depends=('libxinerama' 'sdl2_ttf' 'qt4')
makedepends=('mesa' 'python2')
[ "$CARCH" = 'i686' ] && makedepends+=('nasm')
optdepends=('ttf-liberation: recommended UI font')
source=("${pkgname}.sh"
        "${_target}.ini"
        "mame${_basever}s.zip::http://mamedev.org/downloader.php?file=releases/mame${_basever}s.zip")
sha256sums=('28fe6bcf5e7f846866371f3e98c699b19ed7dd73459c41b165d1916b222dc400'
            '773e632b687387fbf27af72481af30d3fd18e0326495399f1791b83a5fecae3d'
            'c0ba4c8e6ea7a491cbf7b317221d03c916dee53ca3cde4ff26adbc478a395a0f')
install="${pkgname}.install"
noextract=("mame${_basever}s.zip")
PKGEXT='.pkg.tar.gz'

prepare() {
  mkdir "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"

  bsdtar -xOf "${srcdir}/mame${_basever}s.zip" | bsdtar -xf -

#  for (( i=1; i <= ${_patchlevel}; i++ )); do
#    msg "Applying patch ${i}"
#    patch -p0 -E --binary --quiet < "${srcdir}/${_basever}u${i}.diff"
#  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make NOWERROR=1 PYTHON_EXECUTABLE=python2 TARGET=$_target
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Installing the wrapper script
  install -Dm755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"

  # Installing binaries
  install -Dm755 ${_target} "$pkgdir/usr/share/$pkgname/$pkgname" || \
  install -Dm755 ${_target}64 "$pkgdir/usr/share/$pkgname/$pkgname"

  # Installing extra bits
  install -d "$pkgdir/usr/share/$pkgname/"{artwork,hash,keymaps,ini}

  install -m644 artwork/* "$pkgdir/usr/share/$pkgname/artwork/"
  install -m644 hash/* "$pkgdir/usr/share/$pkgname/hash/"
  install -m644 src/osd/sdl/keymaps/* "$pkgdir/usr/share/$pkgname/keymaps/"

  install -m644 "$srcdir/${_target}.ini" "$pkgdir/usr/share/$pkgname/ini/"

  install -Dm644 docs/config.txt "$pkgdir/usr/share/doc/$pkgname/config.txt"
  install -Dm644 docs/SDL.txt "$pkgdir/usr/share/doc/$pkgname/SDL.txt"

  # The license
  install -Dm644 docs/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
