# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

# There is no source code available for the app itself, so anything mentioning "git" below is about the website
# repository (github.com/ephtracy/ephtracy.github.io), of which the release section is used for distributing
# the binaries/archives.

pkgname=magicavoxel

# $_pkgver_upstream should ideally match the version in the archive name and the one specified on the website.
_pkgver_tag='0.99.5' # Git tag associated with the release where the latest archive is.
_pkgver_suffix='' # Anything after $_pkgver_tag that is present in the archive name.
_pkgver_upstream="$_pkgver_tag$_pkgver_suffix"

# 1. Use the latest date for the version that can be found on the website.
# 2. Otherwise, use the date of the website commit that added new release notes.
#
# If multiple releases happened on the same day, or there are no website changes, but the archive has changed,
# set $_pkgver_uniqueness to '.1', then '.2' etc.
_pkgver_date='20200503'
_pkgver_uniqueness='' # Don't forget to reset to '' when date changes.

# Git tag associated with the release where the latest Intel Open Image Denoiser plugin archive is.
_pluginver='0.01'

# TODO: `.rel` -> `.r` when $_pkgver_upstream changes
pkgver="$_pkgver_upstream.rel$_pkgver_date$_pkgver_uniqueness"

pkgrel=1

pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="https://ephtracy.github.io/"
source=("$pkgname-$pkgver.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_pkgver_tag/MagicaVoxel-$_pkgver_upstream-alpha-win64.zip"
        "$pkgname-plugin-$_pluginver.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_pluginver/plugin-intel-denoiser-win64.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(icoutils)
sha512sums=('6e3fd20643c60f4d70bf56ad0866a85ac06a7d663834ad621223e851904cc8844feb3e139ee0d0340a81261d175f964b0001411c1af934e4e49f566703ab7922'
            '23fe26a26dad536810a21fda5565c97d520961b63d06ed5e3aae170a5c636a3c202c9ab40ce80486ff6fca5d34e3ab1a48cabedc43ad678236b4e4abbc0ab67a'
            '7bd5cfc10ed31851e76de7080c08d350a88488b3d8e878f4656970e097d04b00c98bf235a57b154844cba1db04f8092b0c5604f4b11ca787323bbbbc47dc3f5c'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            'feabbff40cef5402aac75d8344acf434079250c25e05c6bc91af705f1254e0010caaf5e64450fee4ec7d4636ec930a5600412bbc3f588149e7ee0cbeefb0e5ae')

build() {
  wrestool -x --output=magicavoxel.ico -t14 "MagicaVoxel-$_pkgver_upstream-alpha-win64/MagicaVoxel.exe"
  icotool -x magicavoxel.ico -o magicavoxel.png
}

package() {
  install -dm755 "$pkgdir/usr/share/magicavoxel"
  cp -ra "MagicaVoxel-$_pkgver_upstream-alpha-win64/." plugin OpenImageDenoise.dll tbb.dll tbbmalloc.dll "$pkgdir/usr/share/magicavoxel"

  install -Dm755 magicavoxel "$pkgdir/usr/bin/magicavoxel"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 magicavoxel.desktop "$pkgdir/usr/share/applications/magicavoxel.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 magicavoxel.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/magicavoxel.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
