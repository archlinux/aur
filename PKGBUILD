# Maintainer: Carl George < arch at cgtx dot us >

pkgname="sickgear"
pkgver="0.12.8"
pkgrel="1"
pkgdesc="Automate your TV enjoyment with innovation, proven stability and reliability."
arch=("any")
url="https://github.com/SickGear/SickGear"
license=("GPL3")
depends=("python2-backports-abc"
         "python2-beautifulsoup4"
         "python2-certifi"
         "python2-cfscrape"
         "python2-chardet"
         "python2-cheetah"
         "python2-feedparser"
         "python2-guessit"
         "python2-html5lib"
         "python2-js2py"
         "python2-pyjsparser"
         "python2-pytz"
         "python2-requests"
         "python2-setuptools"
         "python2-singledispatch"
         "python2-sqlalchemy"
         "python2-xmltodict")
conflicts=("$pkgname-git")
install="$pkgname.install"
source=("$url/archive/release_$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "0001-fix-imports.patch")
sha256sums=('d93e7f86cc2c3d7014d6b1fa84eeb1bd69ba450f0d963496c7a2bcb33dacb8dd'
            '91cd5e6bb57f23321926757497ba6cc8d4ac82784c73795279d17eab1d26a1dc'
            '8421dae047549f0db56278e8e2a0a46762804ac4552a5438c9093840fef0f57d'
            '43ed9ebfcda9e254084cc1bd43d3bca988139267406654f96a5f78ab223a323c'
            'c2cf80f7666f031fc53393bded9d4e476ddadc7cb53ec32ddf9131e19a3e7d22')

prepare() {
    cd "SickGear-release_$pkgver"
    rm -v -r init-scripts tests .gitignore *.ini *.md *.txt .*.yml
    pushd lib
    rm -v -r \
        backports backports_abc.py bs4 certifi cfscrape.py chardet feedparser \
        guessit html5lib js2py pkg_resources.py pyjsparser pytz requests \
        singledispatch.py singledispatch_helpers.py sqlalchemy xmltodict.py
    popd
    patch -p1 -i "$srcdir/0001-fix-imports.patch"
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
