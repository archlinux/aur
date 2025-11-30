# Maintainer: ar4499 <ar4499@gmx.com>
_model=dcpj928n
_device_name=DCP-J928N
pkgname=brother-dcpj928n
pkgver=3.5.1
pkgrel=1
pkgdesc="LPR driver and CUPS wrapper for Brother ${_device_name}"
arch=("i686" "x86_64")
url="https://support.brother.co.jp/j/b/producttop.aspx?c=jp&lang=ja&prod=dcpj928n"
license=("LicenseRef-Brother")
source=("https://download.brother.com/welcome/dlf106110/dcpj928npdrv-3.5.1-1.i386.rpm")
sha256sums=('e9c60a35a345577dab160e69fc7a21d683fc30e81f93243e8abcf5d128c48b9b')
depends=('cups' 'perl')
depends_x86_64=('lib32-glibc')
optdepends=('brscan5' 'brscan-skey')

package() {
        # Unfortunately, /opt is hard-coded into driver binaries and cannot be replaced
        SRC_PREFIX=/opt
        PREFIX=/usr/share

        find "$srcdir$SRC_PREFIX/brother" -type d -exec chmod 755 '{}' +
        find "$srcdir$SRC_PREFIX/brother" -type f -exec chmod 644 '{}' +
        find "$srcdir$SRC_PREFIX/brother/Printers/$_model/lpd" -type f -exec chmod +x '{}' +

        mkdir -p "$pkgdir$SRC_PREFIX"
        cp -R "$srcdir$SRC_PREFIX/brother" "$pkgdir$SRC_PREFIX"

		# Install license files
		install -D -m644 "$pkgdir/opt/brother/Printers/dcpj928n/LICENSE_ENG.txt" \
			"$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
		install -D -m644 "$pkgdir/opt/brother/Printers/dcpj928n/LICENSE_JPN.txt" \
			"$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
		
        # /etc/printcap is managed by cups
        find "$pkgdir" -type f -name 'setupPrintcap*' -delete

        # symlink for the PPD
        ppd_file_name="$SRC_PREFIX/brother/Printers/$_model/cupswrapper/brother_${_model}_printer_en.ppd"
        install -d "$pkgdir$PREFIX/cups/model/Brother"
        ln -s "$ppd_file_name" "$pkgdir$PREFIX/cups/model/Brother/"

        ldpwrapper="$SRC_PREFIX/brother/Printers/$_model/cupswrapper/brother_lpdwrapper_${_model}"
        chmod +x "$pkgdir$ldpwrapper"
        mkdir -p "$pkgdir/usr/lib/cups/filter/"
        ln -s "$ldpwrapper" "${pkgdir}/usr/lib/cups/filter/"

        # a couple architecture-specific symlinks
        ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/$CARCH/br${_model}filter" "$pkgdir$SRC_PREFIX/brother/Printers/$_model/lpd/"
        ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/$CARCH/brprintconf_${_model}" "$pkgdir$SRC_PREFIX/brother/Printers/$_model/lpd/"

        install -d "$pkgdir/usr/bin"
        ln -s "$SRC_PREFIX/brother/Printers/$_model/lpd/brprintconf_${_model}" "$pkgdir/usr/bin/"
}
