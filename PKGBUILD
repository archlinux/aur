# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Robert Cegliński <rob.ceglinski@gmail.com>

_name=ClearUrls
pkgname=firefox-clearurls
pkgver=1.22.0
pkgrel=1
pkgdesc='Removes tracking elements from URLs'
arch=('any')
url=https://clearurls.xyz
license=('LGPL3')
groups=('firefox-addons')
makedepends=('strip-nondeterminism' 'zip')
source=("https://gitlab.com/KevinRoebert/$_name/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('c1536b14cb4b8a584497273f38bd35b14ac3540e4ced7ef3f3fdb1d613113e19233402a03aa1f2344139ae2c86a7d626e79ae56d91acf74d1beb0c3b83325eb9')

prepare() {
  cd $_name-$pkgver
  sed -i 's/"default_locale": "en",/"default_locale": "en",\
    "browser_specific_settings": {\
      "gecko": {\
        "id": "{74145f27-f039-47ce-a470-a662b129930a}"\
      }\
    },/' manifest.json
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{74145f27-f039-47ce-a470-a662b129930a}.xpi \
    clearurls.js browser-polyfill.js manifest.json img/* external_js/* html/* \
    core_js/* css/* fonts/* _locales/*
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*
}

# vim:set ts=2 sw=2 et:
