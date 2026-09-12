# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla dot com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk
pkgver=r30
pkgrel=1
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
source=("$pkgname.sh"
		package.xml)
source_x86_64=("https://dl.google.com/android/repository/$pkgname-$pkgver-linux.zip")
# SHA1 sums are kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('38c46b7b1a1c54a0845d027a8eaf37ed0447d3b2'
          'dd75606f8d8e062813c10f72521d90ab5a261d1e')
sha1sums_x86_64=('5107f898313790e449e87eee2183d9a20602dee9')
sha256sums=('2050ff500443f6cfa4567c02248cb3ec6ccbc67ce81b32d8dda79383c5103db2'
            '966d15d98d85f46f4850faa0ff2a630c03ddc9e398683d3d6170564e4fc4f32b')
sha256sums_x86_64=('753611f410d002cfcd3f3dc2ef49aad532089d3180b436c060a90bf0fcb64df2')

package() {
  # Extract full version from source.properties for versioned symlink
  local _ndk_full_version=$(grep 'Pkg.Revision' "$srcdir/$pkgname-$pkgver/source.properties" | cut -d'=' -f2 | tr -d ' ')

  install -dm755 "$pkgdir/opt"
  mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  install -Dm644 "$pkgname.sh" -t "$pkgdir/etc/profile.d/"
  install -Dm644 package.xml "$pkgdir/opt/$pkgname"

  # Create versioned symlink for sdkmanager and gradle compatibility
  install -dm755 "$pkgdir/opt/android-sdk/ndk"
  ln -s "/opt/$pkgname" "$pkgdir/opt/android-sdk/ndk/$_ndk_full_version"
}
