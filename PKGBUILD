# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="trojita"
pkgname="${_pkgname}-bin"
pkgver=0.7.0.1
pkgrel=1
pkgdesc="A Qt IMAP email client"
arch=('x86_64' 'aarch64' 'i686')
url="https://trojita.flaska.net"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'gpgme' 'hicolor-icon-theme' 'mimetic' 'sonnet5'
         'qgpgme-qt5' 'qt5-base' 'qt5-svg' 'qt5-webkit' 'qtkeychain-qt5' 'zlib')
makedepends=('patchelf')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,i686}".rpm")
source_x86_64=("${_pkgsrc}-x86_64.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.21.20230430gitd1e1b4a.fc41/x86_64/${_pkgsrc}-0.21.20230430gitd1e1b4a.fc41.x86_64.rpm")
source_aarch64=("${_pkgsrc}-aarch64.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.21.20230430gitd1e1b4a.fc41/aarch64/${_pkgsrc}-0.21.20230430gitd1e1b4a.fc41.aarch64.rpm")
source_i686=("${_pkgsrc}-i686.rpm::https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/0.21.20230430gitd1e1b4a.fc41/i686/${_pkgsrc}-0.21.20230430gitd1e1b4a.fc41.i686.rpm")
b2sums_x86_64=('d22211ed44427123912cb8f54954c218963cd59e0bb0a8e6ae260359299ae251a56bc9d5c0ef2e0eba86450028917da92b54d788d635852f640e7f5b8764497e')
b2sums_aarch64=('4f6b3304db2cebb65e2ad4435de4bfd77f681617b4aab4d4d0d1292e03ad00b19854f2ea804e65b8412b741bbe980095aada572728a2c479d9896f2068a444ac')
b2sums_i686=('fa0e4ef92e4daf9b0b97bc4254158f1d01dff9e6ee072aaefbc4012e5722d4e4858778c768881f6de316a3bac74624306ef7fe0980482a3af71c2dc99b75ab12')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.rpm" -C "${srcdir}/${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/usr"
  rm -rf "lib"
  mv -f "lib64/${_pkgname}" "lib"
  rm -rf "lib64"

  cd "share/doc/${_pkgname}"
  rm -f "Doxyfile"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr"
  find "lib" "bin" -type f -exec patchelf --remove-rpath {} +
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/lib"   -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
}
