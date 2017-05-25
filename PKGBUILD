# Maintainer: Carl George < arch at cgtx dot us >

pkgname="sickgear"
pkgver=0.12.19
pkgrel=1
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
         "python2-configobj"
         "python2-feedparser"
         "python2-guessit"
         "python2-html5lib"
         "python2-js2py"
         "python2-oauth2"
         "python2-profilehooks"
         "python2-pyjsparser"
         "python2-pytz"
         "python2-requests"
         "python2-setuptools"
         "python2-singledispatch"
         "python2-six"
         "python2-sqlalchemy"
         "python2-unidecode"
         "python2-xmltodict")
install="$pkgname.install"
source=("$url/archive/release_$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "0001-adjust-imports.patch")
sha256sums=('071962dd278af21aa49b5a59849883d61b7f2a033c85d919fcbceaacd82b5ae8'
            '91cd5e6bb57f23321926757497ba6cc8d4ac82784c73795279d17eab1d26a1dc'
            '8421dae047549f0db56278e8e2a0a46762804ac4552a5438c9093840fef0f57d'
            '43ed9ebfcda9e254084cc1bd43d3bca988139267406654f96a5f78ab223a323c'
            '3188b34d5277eacf2bae51016c2d69ac51ef86dba619ce61dde29b1ec46ddb40')

prepare() {
    cd "SickGear-release_$pkgver"
    rm -v -r init-scripts tests .gitignore *.ini *.md *.txt .*.yml
    pushd lib
    rm -v -r \
        backports \
        backports_abc.py \
        bs4 \
        certifi \
        cfscrape.py \
        chardet \
        configobj \
        feedparser \
        guessit \
        html5lib \
        js2py \
        oauth2 \
        pkg_resources.py \
        profilehooks.py \
        pyjsparser \
        pytz \
        requests \
        simplejson \
        singledispatch.py \
        singledispatch_helpers.py \
        six.py \
        sqlalchemy \
        unidecode \
        xmltodict.py
    popd
    patch -p1 -i "$srcdir/0001-adjust-imports.patch"
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
