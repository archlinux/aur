# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin-git
pkgver=r14640.57296866a
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
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
backup=('etc/conf.d/jellyfin')
sha256sums=('SKIP'
            '982682d72fea64f0dd0c123e3a597699b7f5de306be7bca7c06993d13b51f5e1'
            'effc1cf85c0c959da73bedbcd94e00cfd317dd876f710183b7baf04209055ea2'
            '981cbc8849be8934d95da3ae83619a02249a6790287716a8b7c9ca488ed51d13')

pkgver() {
  cd jellyfin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}

# vim: ts=2 sw=2 et:
