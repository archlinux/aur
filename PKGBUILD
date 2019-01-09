# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin
pkgver=10.0.1
# Check at https://github.com/jellyfin/jellyfin/tree/v**PKGVER**/ThirdParty
_taglib_sharp_commit=ee5ab21742b71fd1b87ee24895582327e9e04776
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
depends=('ffmpeg' 'imagemagick' 'dotnet-sdk' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin/archive/v10.0.1.tar.gz"
        "taglib-sharp-$_taglib_sharp_commit.tar.gz::https://github.com/mono/taglib-sharp/archive/$_taglib_sharp_commit.tar.gz"
        'jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
backup=('etc/conf.d/jellyfin')
sha256sums=('28943b990a0c73f3eb9f650107a09782907cee423b60bf3dcd8d7d52c12608e1'
            'a0d32a20ba31609bb16def46723fcf937b42aa65442e1b363f85343b95a491c6'
            'ff3c81ddfd716f179fec8149ea6c2db379e05cd20bd0ffa8ce3ff3a609ca9749'
            '61febaa0bbe71235d724f236223c7315da393b8b481e4bbed86489a343bca51f'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'aa87d52386dde4a2ea4663de2f08249415b2babfefd98d348a96df35dfc36bc0')

prepare() {
  cd $pkgname-$pkgver

  cp -r "$srcdir"/taglib-sharp-$_taglib_sharp_commit/. ThirdParty/taglib-sharp
}

build(){
  cd $pkgname-$pkgver

  dotnet build --configuration Release MediaBrowser.sln
  # dotnet doesn't like fakeroot
  dotnet publish --configuration Release MediaBrowser.sln --output "$PWD"/build
  # TODO: Clean up the runtimes folder, Mono.Posix.NETStandard.dll is required from it though
  # rm -rf build/runtimes
}

package() {
  mkdir -p "$pkgdir"/usr/lib
  cp -dr --no-preserve='ownership' $pkgname-$pkgver/build "$pkgdir"/usr/lib/jellyfin

  install -Dm 644 jellyfin.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 jellyfin.sysusers "${pkgdir}"/usr/lib/sysusers.d/jellyfin.conf
  install -Dm 644 jellyfin.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/jellyfin.conf
  install -Dm 644 jellyfin.conf "${pkgdir}"/etc/conf.d/jellyfin
}

# vim: ts=2 sw=2 et:
