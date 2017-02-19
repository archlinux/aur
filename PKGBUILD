# Maintainer: Carl George < arch at cgtx dot us >

pkgname="sickgear"
pkgver="0.12.7"
pkgrel="2"
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
sha256sums=('eeb912c4b6c69089980fb7cc8c35623cee2410ba9200bb020fb6c8912e9f5220'
            '91cd5e6bb57f23321926757497ba6cc8d4ac82784c73795279d17eab1d26a1dc'
            '8421dae047549f0db56278e8e2a0a46762804ac4552a5438c9093840fef0f57d'
            '43ed9ebfcda9e254084cc1bd43d3bca988139267406654f96a5f78ab223a323c'
            '34460880a97505d58dfd83dad52cf5dd2f4eee7265417772117e38c93a9055b7')

prepare() {
    cd "SickGear-release_$pkgver"
    rm -v -r init-scripts tests .gitignore *.ini *.md *.txt .*.yml
    pushd lib
    rm -v -r \
        backports backports_abc.py bs4 certifi cfscrape.py chardet feedparser \
        guessit html5lib js2py pkg_resources.py pyjsparser pytz \
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
