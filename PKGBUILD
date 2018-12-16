# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin-git
pkgver=r14803.a069d3f79
pkgrel=1
pkgdesc='The Free Software Media Browser'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
depends=('ffmpeg' 'imagemagick' 'dotnet-sdk' 'sqlite')
makedepends=('git')
provides=('jellyfin')
conflicts=('jellyfin')
source=('git+https://github.com/jellyfin/jellyfin.git'
        'git+https://github.com/mono/taglib-sharp.git'
        'jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
backup=('etc/conf.d/jellyfin')
sha256sums=('SKIP'
            'SKIP'
            'ff3c81ddfd716f179fec8149ea6c2db379e05cd20bd0ffa8ce3ff3a609ca9749'
            '61febaa0bbe71235d724f236223c7315da393b8b481e4bbed86489a343bca51f'
            'effc1cf85c0c959da73bedbcd94e00cfd317dd876f710183b7baf04209055ea2'
            'aa87d52386dde4a2ea4663de2f08249415b2babfefd98d348a96df35dfc36bc0')

pkgver() {
  cd jellyfin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd jellyfin
  git submodule init
  git config submodule.ThirdParty/taglib-sharp.url $srcdir/taglib-sharp
  git submodule update
}

build(){
  cd jellyfin

  dotnet build --configuration Release MediaBrowser.sln
  # dotnet doesn't like fakeroot
  dotnet publish --configuration Release MediaBrowser.sln --output "$PWD"/build
  # TODO: Clean up the runtimes folder, Mono.Posix.NETStandard.dll is required from it though
  # rm -rf build/runtimes
}

package() {
  mkdir -p "$pkgdir"/usr/lib
  cp -dr --no-preserve='ownership' jellyfin/build "$pkgdir"/usr/lib/jellyfin

  install -Dm 644 jellyfin.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 jellyfin.sysusers "${pkgdir}"/usr/lib/sysusers.d/jellyfin.conf
  install -Dm 644 jellyfin.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/jellyfin.conf
  install -Dm 644 jellyfin.conf "${pkgdir}"/etc/conf.d/jellyfin
}

# vim: ts=2 sw=2 et:
