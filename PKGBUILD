# Maintainer :  Kr1ss  < $(tr +- .@ <<<kr1ss+x-yandex+com) >
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.19.13940
pkgrel=3

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('any')
license=('custom')

depends=('java-runtime<=15' 'sh')

install="$pkgname.install"
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb"
        "LICENSE.pdf::https://www.$pkgname.com/pdf/legal/${pkgname^}%20Technologies_TermsandConditions_2020-11.pdf")
sha256sums=('8cb8094366b9eaf4bb60d436ad48afd84cc54a73442de5f850ecc9d877643ba6'
            '5295b55e0da0a7aaa733032bf6d508dd149d66b379f71c4b15271729c3aa5500')

options=('!emptydirs')


package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  sed -i 's|\(Exec=\)x-www-browser|\1xdg-open|g;s|^\(Version=\).*|\11.0|' \
         "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i '1s|bash|sh|' "$pkgdir/usr/bin/$pkgname"
  # maltego_memory_config is defined as action in maltego.desktop, don't need that twice
  rm "$pkgdir/usr/share/applications/${pkgname}_config.desktop"
  # remove Windows assets
  find "$pkgdir" -type f -regex '.*\.\(exe\|dll\)$' -delete
  chmod -R go-w "$pkgdir"
  install -Dm644 LICENSE.pdf -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
