# Maintainer: Mike Lei <mikelei@duck.com>

_lang=zh
_cc=CN
_new_cc=CM
_locale="$_lang-$_cc"
_new_locale="$_lang-$_new_cc"
_locale_name="Chinese (Simplified)"

pkgname=firefox-developer-edition-i18n-${_new_locale,,}
pkgver=147.0b2
pkgrel=1
pkgdesc="$_locale_name language pack for Firefox Developer Edition (with classic context menu mnemonics, see bugzilla #1701324)"
url="https://www.mozilla.org/firefox/developer"
arch=(any)
license=(MPL-2.0)
depends=("firefox-developer-edition>=$pkgver")
makedepends=(perl-rename web-ext)
conflicts=("firefox-developer-edition-i18n-${_locale,,}")
provides=("firefox-developer-edition-i18n-${_locale,,}")

_url=https://releases.mozilla.org/pub/firefox/releases/$pkgver
_source=linux-x86_64/xpi/$_locale.xpi
source=("$pkgname.xpi::$_url/$_source")

if [[ ! -v FAKEROOTKEY ]]; then
    download_file "$_url/SHA512SUMS" > /dev/null 2>&1
    download_file "$_url/SHA512SUMS.asc" > /dev/null 2>&1
    # https://blog.mozilla.org/security/2025/04/01/updated-gpg-key-for-signing-firefox-releases-2/
    moz_gpg_key=14F26682D0916CDD81E37B6D61B7B526D98F0353
    gpg -q --no-default-keyring --keyring ./moz.gpg --recv-keys $moz_gpg_key || exit 1
    gpg --no-default-keyring --keyring ./moz.gpg --verify SHA512SUMS.asc || exit 1
    sha512sums=($(grep -Po "^.+(?=  $_source)" SHA512SUMS))
    rm SHA512SUMS SHA512SUMS.asc moz.gpg moz.gpg~
fi

build() {
    rm -rf META-INF
    sed -i "s/$_locale/$_new_locale/g" manifest.json
    sed -i '/"author"/{s/"$/, Mike Lei"/}' manifest.json
    sed -i '/"strict_min_version"/d' manifest.json
    sed -i '/"strict_max_version"/d' manifest.json
    sed -i -r 's/("id": ".+"),/\1/g' manifest.json
    # sed -i "s/=$_locale, $_lang/=$_new_locale, $_lang, $_locale/g" chrome/$_locale/locale/$_locale/global/intl.properties
    sed -i "/main-context-menu-copy-email =/{n;n;s/= \w\$/= A/}" browser/localization/$_locale/browser/browserContext.ftl
    sed -i "/main-context-menu-copy-link-simple =/{n;n;s/= \w\$/= A/}" browser/localization/$_locale/browser/browserContext.ftl
    sed -i "/main-context-menu-image-copy =/{n;n;s/= \w\$/= x/}" browser/localization/$_locale/browser/browserContext.ftl
    sed -i "/fxviewtabrow-copy-link =/{n;s/= \w\$/= A/}" browser/localization/$_locale/browser/fxviewTabList.ftl
    sed -i "/menu-share-copy-link =/{n;n;s/= \w\$/= A/}" browser/localization/$_locale/browser/browser.ftl
    sed -i "/contextMenuSearch\.accesskey =/{s/= \w\$/= G/}" browser/chrome/$_locale/locale/browser/browser.properties
    # sed -i "/browser\.startup\.homepage/d" browser/chrome/$_locale/locale/browser/browser.properties
    find . -depth -name "$_locale" -exec perl-rename -v "s/$_locale\$/$_new_locale/g" {} +
    web-ext build -n $pkgname-$pkgver.xpi
}

package() {
    install -Dm644 web-ext-artifacts/$pkgname-$pkgver.xpi "$pkgdir/usr/lib/firefox-developer-edition/browser/extensions/langpack-$_new_locale@firefox.mozilla.org.xpi"
}
