# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

# There is no source code available for the app itself, so anything mentioning "git" below is about the website
# repository (github.com/ephtracy/ephtracy.github.io), of which the release section is used for distributing
# the binaries/archives.

pkgname=magicavoxel

# $_pkgver_upstream should ideally match the version in the archive name and the one specified on the website.
_pkgver_tag='0.99.6' # Git tag associated with the release where the latest archive is.
_pkgver_suffix='.4' # Anything after $_pkgver_tag that is present in the archive name.
_pkgver_upstream="$_pkgver_tag$_pkgver_suffix"

# Use the date of the corresponding release archive asset, which can be found e.g. by using the below one-liner
# (substitute $_pkgver_tag):
#
# $ curl -sSf "https://api.github.com/repos/ephtracy/ephtracy.github.io/releases/tags/$_pkgver_tag" | jq '.assets|map(select(.name|contains("win64.zip")))[0].updated_at|fromdate|strftime("%Y%m%d")'
#
# If multiple releases happen on the same day, set $_pkgver_uniqueness to '.2', then '.3' etc.
_pkgver_date='20210908'
_pkgver_uniqueness='' # Don't forget to reset to '' when date changes.

# Git tag associated with the release where the latest Intel Open Image Denoiser plugin archive is.
_plugin_tag='0.01'
_plugin_ver='1.2.0'

pkgver="$_pkgver_upstream.r$_pkgver_date$_pkgver_uniqueness"

pkgrel=1

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
sha512sums=('3108bd6bf8d6c0e1b4255de18e161a2012e656ae943cc2c8dd7dc98c56e32e30552fada293e8dca0a5e648484a984a85e5fbbfb3f03eedc339320b493e5b7a66'
            '6509da8d8b04488b369644fd104cdc820037bc2bd2567d868541562d3096041d29d265cdeb2386ccb66f8f6670b94236d565046bfad92aff9cf7b1988b4af53f'
            '25a7d9302c64e5efa6e57fc9427c43c18345de1680273e64fc9a75270d904a339e420401265265c3d1a09dc7abe4b5dcd76a5949a7baa3e6a0c519de233ec8f5'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            'feabbff40cef5402aac75d8344acf434079250c25e05c6bc91af705f1254e0010caaf5e64450fee4ec7d4636ec930a5600412bbc3f588149e7ee0cbeefb0e5ae')

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
