# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

# There is no source code available for the app itself, so anything mentioning "git" below is about the website
# repository (github.com/ephtracy/ephtracy.github.io), of which the release section is used for distributing
# the binaries/archives.

pkgname=magicavoxel

# $_pkgver_upstream should ideally match the version in the archive name and the one specified on the website.
_pkgver_tag='0.99.7' # Git tag associated with the release where the latest archive is.
_pkgver_suffix='.1' # Anything after $_pkgver_tag that is present in the archive name.
_pkgver_upstream="$_pkgver_tag$_pkgver_suffix"

# Use the date of the corresponding release archive asset, which can be found e.g. by using the below one-liner
# (substitute $_pkgver_tag):
#
# $ curl -sSf "https://api.github.com/repos/ephtracy/ephtracy.github.io/releases/tags/$_pkgver_tag" | jq '.assets|map(select(.name|contains("win64.zip")))[0].updated_at|fromdate|strftime("%Y%m%d")'
#
# If multiple releases happen on the same day, set $_pkgver_uniqueness to '.2', then '.3' etc.
_pkgver_date='20230614'
_pkgver_uniqueness='' # Don't forget to reset to '' when date changes.

# Git tag associated with the release where the latest Intel Open Image Denoiser plugin archive is.
_plugin_tag='0.01'
_plugin_ver='1.2.0'

pkgver="$_pkgver_upstream.r$_pkgver_date$_pkgver_uniqueness"

pkgrel=2

pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="https://ephtracy.github.io/"
source=("$pkgname-$pkgver.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_pkgver_tag/MagicaVoxel-$_pkgver_upstream-win64.zip"
        "$pkgname-plugin-$_plugin_ver.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_plugin_tag/plugin-intel-denoiser-win64-$_plugin_ver.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(icoutils)
sha512sums=('a9364a9b002ed0b77088bb01ea36b8c8038602ed8f57bdbf11fa60f7279185c653109c24e022b1761a4585c2c315180eb1b61bb65c733e105f23b285b99ef4b7'
            '6509da8d8b04488b369644fd104cdc820037bc2bd2567d868541562d3096041d29d265cdeb2386ccb66f8f6670b94236d565046bfad92aff9cf7b1988b4af53f'
            'cc3ca199de02c1b83697faa3ef96ea2029c8bc99503a05e1e958f200addbf52f933fae8fea105b1107d61ef584ec79752e353596424e638d56fb1f64969fb1a3'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            'ee83336b2813ace8db5edec3ff185b638ee7a07fa7243970a0364ccf190699876a05a2ac15dfda08a0ef4e2169591a80e4c426c9fa20e06c6ca3dc01f59b133c')

build() {
  wrestool -x --output=magicavoxel.ico -t14 "MagicaVoxel-$_pkgver_upstream-win64/MagicaVoxel.exe"
  icotool -x magicavoxel.ico -o magicavoxel.png
}

package() {
  install -dm755 "$pkgdir/usr/share/magicavoxel"
  cp -ra "MagicaVoxel-$_pkgver_upstream-win64/." plugin OpenImageDenoise.dll tbb.dll tbbmalloc.dll "$pkgdir/usr/share/magicavoxel"

  install -Dm755 magicavoxel "$pkgdir/usr/bin/magicavoxel"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 magicavoxel.desktop "$pkgdir/usr/share/applications/magicavoxel.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 magicavoxel.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/magicavoxel.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
