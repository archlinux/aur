# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Contributor: Alexander Konarev <AVKonarev@gmail.com>
# Contributor: Germain Bossu <germainbossu@yahoo.fr>

pkgname=brother-dcp7030
pkgver=2.0.2
pkgrel=4
pkgdesc="Brother cupd and lpd driver for DCP-7030"
arch=('x86_64')
url="http://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=dcp7030_all&os=128&flang=English"
license=('custom')
depends=('lib32-glibc' 'psutils' 'cups')
optdepends=('system-config-printer')
source=(http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP7030-$pkgver-1.i386.deb
        http://www.brother.com/pub/bsc/linux/dlf/brdcp7030lpr-$pkgver-1.i386.deb
        brlpdwrapperDCP7030
        DCP7030.ppd.gz
        cupswrapper-systemd.patch)
noextract=(DCP7030.ppd.gz)
sha256sums=('a9a4e0ec5f941cf17fcc7156febf8aff21673bc78a6313176527a0423847627d'
            'cd4e6c4b16c5e734721068134699c65b2eca0584bc86031ee7eef7af05b36d8c'
            '0320e1f19c3be746442b7c6324f0732b17928d2bb611ef143007f6ca0882765b'
            'ff55d56e1d4488768cbe3ca843a26a284bd2988bd9dddf4a0f1d39c637929997'
            '11bfa0871ec5fda4e49e8d768840ca0de8a5aa6e8aec740b0a42ef8bc9e53c8a')

build() {
  for i in $startdir/*.deb; do
    ar -x $i
    bsdtar xf data.tar.gz
  done

  cat <<END >>$srcdir/usr/local/Brother/inf/brDCP7030func
  [psconvert2]
  pstops=/usr/bin/pstops
END

  patch $srcdir/usr/local/Brother/cupswrapper/cupswrapperDCP7030-2.0.2 < $startdir/cupswrapper-systemd.patch
}

package() {
  cp -r "$srcdir/usr" "$pkgdir"
  cp -r "$srcdir/var" "$pkgdir"

  install -d -m755 "$pkgdir/usr/lib/cups/filter"
  install -d -m755 "$pkgdir/usr/share/cups/model"
  install -D -m755 "$startdir/brlpdwrapperDCP7030" "$pkgdir/usr/lib/cups/filter"
  install -D -m644 "$startdir/DCP7030.ppd.gz" "$pkgdir/usr/share/cups/model"

  # Clean up some stuff
  rm "$pkgdir/usr/share/doc/cupswrapperdcp7030/changelog.Debian.gz"
}

