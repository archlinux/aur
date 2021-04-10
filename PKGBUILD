# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=1.0
pkgrel=1
pkgdesc="The KISS file manager: cli-based, ultra-lightweight, and lightning fast"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'aarch64' 'armv7h')
url="https://github.com/leo-arch/clifm"
license=(GPL2)
depends=('libcap' 'acl' 'readline' 'file')
optdepends=(
	'sshfs: SFTP support'
	'cifs-utils: Samba support'
	'curlftpfs: FTPFS support'
	'archivemount: Archives mount'
	'atool: Archives/compression support'
	'p7zip: ISO 9660 support'
	'cdrtools: ISO 9660 support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-arch/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('0fac66f50f34c1d7480fcc8f91b545fdddd069415d1ee9e80d7a1fbd12309f15')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  gcc -O3 -march=native -s -fstack-protector-strong -o "$pkgname" "${pkgname}.c" -lreadline -lacl -lcap
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -g 0 -o 0 -Dm644 manpage "$pkgdir/usr/share/man/man1/${pkgname}.1"
  gzip -9n "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -g 0 -o 0 -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -g 0 -o 0 -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  install -g 0 -o 0 -Dm644 "translations/spanish/${pkgname}.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/${pkgname}.mo"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r plugins "$pkgdir/usr/share/$pkgname"
  cp -r functions "$pkgdir/usr/share/$pkgname"
}
