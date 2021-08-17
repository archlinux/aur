# Maintainer: archcrack <johndoe.arch@outlook.com>

pkgname=clifm
pkgver=1.1
pkgrel=1
pkgdesc="The KISS, non-curses terminal file manager"
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
sha256sums=('e2be66e8000fc43f177e472045d9d30f44625e854d85b4cdf5aad8179d32d5af')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/src"
  gcc -O3 -s -fstack-protector-strong -Wall -o "$pkgname" *.c -lreadline -lacl -lcap
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 misc/manpage "$pkgdir/usr/share/man/man1/${pkgname}.1"
  gzip -9n "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 misc/"${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 misc/completions.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 misc/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "translations/spanish/${pkgname}.mo" "$pkgdir/usr/share/locale/es/LC_MESSAGES/${pkgname}.mo"
  install -Dm644 misc/mimelist.cfm "$pkgdir/usr/share/$pkgname/mimelist.cfm"
  install -Dm644 "images/logo/${pkgname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  cp -r plugins "$pkgdir/usr/share/$pkgname"
  cp -r functions "$pkgdir/usr/share/$pkgname"
}
