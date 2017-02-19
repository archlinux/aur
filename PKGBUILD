# Maintainer: Carl George < arch at cgtx dot us >

pkgname="sickgear"
pkgver="0.12.7"
pkgrel="1"
pkgdesc="Automate your TV enjoyment with innovation, proven stability and reliability."
arch=("any")
url="https://github.com/SickGear/SickGear"
license=("GPL3")
depends=("python2-cheetah"
         "python2-feedparser"
         "python2-js2py")
conflicts=("$pkgname-git")
install="$pkgname.install"
source=("$url/archive/release_$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('eeb912c4b6c69089980fb7cc8c35623cee2410ba9200bb020fb6c8912e9f5220'
            '91cd5e6bb57f23321926757497ba6cc8d4ac82784c73795279d17eab1d26a1dc'
            '8421dae047549f0db56278e8e2a0a46762804ac4552a5438c9093840fef0f57d'
            '43ed9ebfcda9e254084cc1bd43d3bca988139267406654f96a5f78ab223a323c')

prepare() {
    cd "SickGear-release_$pkgver"
    rm -v -r init-scripts tests
    rm -v .gitignore *.ini *.md *.txt .*.yml
    rm -v -r lib/{feedparser,js2py}
    find -type f -executable -print -exec chmod -x {} \;
}

build() {
    cd "SickGear-release_$pkgver"
    python2 -m compileall .
}

package() {
    install --verbose -D --mode 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install --verbose -D --mode 644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install --verbose -D --mode 644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install --verbose --directory --mode 755 "$pkgdir/usr/share/$pkgname"
    mv "SickGear-release_$pkgver"/* "$pkgdir/usr/share/$pkgname"
}
