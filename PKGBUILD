# Maintainer: BrLi <brli@chakralinux.org>

pkgbase=ttf-twcns-fonts
pkgname=("$pkgbase" "$pkgbase"-doc)
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20170307
pkgrel=1
arch=('any')
url='http://data.gov.tw/node/5961'
license=('custom')
makedepends=(dos2unix convmv)
source=('http://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        'LICENSE-zh_TW'
        'LICENSE')
sha1sums=('f7bfcdef78bb539c42e9419f7b38f4afac5c3152'
          '08c5ee06a2248340613d9bd7314a824883851bd1'
          '6be77081aa46e90e417ec73027e0477c3297a1c9')

prepare() {
    cd $srcdir/Open_Data/
    msg 'Converting every text file into UTF-8/Unix EOL'
    convmv -f big5 -t utf8 -r --notest --nfc .
    dos2unix -k */*.txt
    dos2unix -k */*/*.txt
    iconv --verbose -f BIG5 -t UTF8 'Properties/全字庫屬性資料說明文件.txt' -o 'Properties/全字庫屬性資料說明文件.txt'
    iconv --verbose -f BIG5 -t UTF8 'Fonts/全字庫字型說明文件.txt' -o 'Fonts/全字庫字型說明文件.txt'
}

package_ttf-twcns-fonts() {
    depends=(freetype2 fontconfig)
    cd $srcdir/Open_Data/
    msg 'Installing the fonts'
    install -dm755 $pkgdir/usr/share/fonts/TTF
    mv -v Fonts/TW-Kai* $pkgdir/usr/share/fonts/TTF/
    mv -v Fonts/TW-Sung* $pkgdir/usr/share/fonts/TTF/
    msg 'Installing the license'
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/LICENSE-zh_TW ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-zh_TW
}

package_ttf-twcns-fonts-doc() {
    options=('docs')
    cd $srcdir/Open_Data/
    msg 'Installing the documents'
    install -dm755 $pkgdir/usr/share/doc/$pkgname/
    for dir in Fonts MapingTables Properties; do
        cp -rv $dir $pkgdir/usr/share/doc/$pkgname/
    done
    install -dm755 $pkgdir/usr/share/licenses/
    ln -sf /usr/share/licenses/$pkgbase $pkgdir/usr/share/licenses/$pkgname
}
