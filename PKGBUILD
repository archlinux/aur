# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: tobias <tobias@arhlinux.org>

pkgname=lib32-exiv2
_pkgbase=exiv2
pkgver=0.28.0
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools (32-bit)"
arch=('x86_64')
url="https://exiv2.org"
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-zlib' 'lib32-expat' 'exiv2'
         'lib32-libinih')
makedepends=('cmake')
source=("https://github.com/Exiv2/$_pkgbase/archive/refs/tags/v$pkgver.tar.gz"
        https://github.com/Exiv2/exiv2/commit/16c1cd7d.patch
        https://github.com/Exiv2/exiv2/commit/b4f435a4.patch
        https://github.com/Exiv2/exiv2/commit/f47e7bd6.patch)
sha512sums=('35e483c6123f099167ed8647fae7c6e5512434c24d0afe684180ba6a5114068d5678280a01c8e6cfee0d1e555e1dc2a1606989d46950ce3ef1a3859caeed4dad'
            'aa9a5e64d31579605ba3af4a076dc1df3bb4d07640716cbfeecd7a124059730445b5d468187e59e390fec58c03d9086b029ce0b2b563c8995d3df5af000ed37f'
            'b9b65766c02aa44ee26409c6e5d13bfd592ee94d7f757b60170e0e012efe4a75017cdccc190498084c8675018db07427158154ccaad1c882adbdfb2ea4d3cd25'
            '035e4a9ca11fbc8a858d5212c5663c2edc79168c50b614708bd7cfd50ca95751ff907001d3e43b08e33b070f36e27873734a19c03c6b63f104c7cb3b7cc84b14')
b2sums=('6ccdc4e6a7dbd4aa2a892e61306f0c63659d804075cae9e771096cfdc21ec0aff0df22232c036551f4e321f497184e7ad100fb9c2011c14cd0315e8118c3e85f'
        'fe049443451acd6667d791d621a7f809dd20e3886dcea3d8e1cc8c92bf01f3b2a6efeca152378aeaacba07e46d859bfba40420a9f3d7b4e8009e7c9263f0a32c'
        '22be1181d7a0ecc0f39f8d7e9b77f64475cfd380ab76bd308c51aa424f7fb5ed8e930c24e1e608e55758d477414be055d0f7bb4c3b2d1e84cf45319705fcc82a'
        'f253e41b9b2a745f4432e14f5e71bfd0d7077ec3bdc8c7ef71559898730c04ab4f960b4864362fedeeff343e920cb199fc1ba206ff96dc094babc685ac29a600')

prepare() {
  # Fix some 0.28 regressions
  patch -d $_pkgbase-$pkgver -p1 < 16c1cd7d.patch
  patch -d $_pkgbase-$pkgver -p1 < b4f435a4.patch
  patch -d $_pkgbase-$pkgver -p1 < f47e7bd6.patch
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

  cd "$_pkgbase-$pkgver"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DEXIV2_ENABLE_VIDEO=ON \
    -DEXIV2_BUILD_SAMPLES=OFF \
    -DEXIV2_ENABLE_NLS=ON
  make
}

package() {
  cd "$_pkgbase-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{bin,include,share}
}

