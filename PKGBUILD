# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla dot com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk
pkgver=r29
pkgrel=2
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/$pkgname.sh")
install="$pkgname.install"
replaces=('android-ndk64')
depends=('bash' 'glibc' 'gcc-libs' 'zlib')
optdepends=(
  'ncurses5-compat-libs: for curses module in bundled Python'
  'bzip2: for bz2 module in bundled Python'
  'libxcrypt-compat: for crypt module in bundled Python'
  'python: various helper scripts'
  'perl: various helper scripts'
  'libc++: for some LLVM components'
  'android-sdk: for sdkmanager and gradle integration'
)
source=("$pkgname.sh")
source_x86_64=("https://dl.google.com/android/repository/$pkgname-$pkgver-linux.zip")
# SHA1 sums are kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('38c46b7b1a1c54a0845d027a8eaf37ed0447d3b2')
sha1sums_x86_64=('87e2bb7e9be5d6a1c6cdf5ec40dd4e0c6d07c30b')
sha256sums=('2050ff500443f6cfa4567c02248cb3ec6ccbc67ce81b32d8dda79383c5103db2')
sha256sums_x86_64=('4abbbcdc842f3d4879206e9695d52709603e52dd68d3c1fff04b3b5e7a308ecf')

package() {
  # Extract full version from source.properties for versioned symlink
  local _ndk_full_version=$(grep 'Pkg.Revision' "$srcdir/$pkgname-$pkgver/source.properties" | cut -d'=' -f2 | tr -d ' ')

  install -dm755 "$pkgdir/opt"
  mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  install -Dm644 "$pkgname.sh" -t "$pkgdir/etc/profile.d/"

  # Create versioned symlink for sdkmanager and gradle compatibility
  install -dm755 "$pkgdir/opt/android-sdk/ndk"
  ln -s "/opt/$pkgname" "$pkgdir/opt/android-sdk/ndk/$_ndk_full_version"
}
