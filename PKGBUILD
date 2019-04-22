# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin
pkgver=10.3.1
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
depends=('dotnet-runtime' 'ffmpeg' 'imagemagick' 'sqlite')
makedepends=('dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin/archive/v$pkgver.tar.gz"
        "jellyfin-web-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin-web/archive/v$pkgver.tar.gz"
        'jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
backup=('etc/conf.d/jellyfin')
sha512sums=('e0ffb291d4c8bcb25110c1a963bf969237a3cdc0cc5b579d38b998b3696309d859691f1d081ebd93e60f2bcb60ac3cedf294fbf68a7df6e4f6af28b309793dba'
            'df99136846c290b9e9821d24df92150fbda402a81ffe967a183c3f0e246f5ac2c9646ddba8d51c016533640486734949de3f0a22b0cb02452d6deb19fafe3316'
            '2aa97a1a7a8a447171b59be3e93183e09cbbc32c816843cc47c6777b9aec48bd9c1d9d354f166e0b000ad8d2e94e6e4b0559aa52e5c159abbc103ed2c5afa3f0'
            '99d02080b1b92e731250f39ddd13ceca7129d69d0c05e0939620cbc3f499a9574668c63fa889704a4905560888131e980d7ab1fbcc5837b04d33ce26daa9d42b'
            '6fc2638e6ec4b1ee0240e17815c91107b694e5fde72c1bc7956c83067bbeacb632de899b86837e47a0ec04288131b15c20746373b45e0669c8976069a55d627a'
            '45a62b62d97b9a83289d4dfde684163b1bcf340c1921fb958e5a701812c61b392901841940c67e5fa5148783277d5b4dc65ba01d3a22e8f855ea62154ad9be33')

prepare() {
  cd $pkgname-$pkgver

  cp -r "$srcdir"/jellyfin-web-$pkgver/. MediaBrowser.WebDashboard/jellyfin-web
}

build(){
  cd $pkgname-$pkgver

  # Disable dotnet telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  dotnet build --configuration Release Jellyfin.Server
  # Ideally, this would be run in package() with the --output variable pointing
  # to "$pkgdir"/usr/lib/jellyfin, but this step fails in fakeroot.
  # The makepkg output looks like
  #   Restore completed in 56.84 ms for /aur/jellyfin-git/src/jellyfin/Jellyfin.Server/Jellyfin.Server.csproj.
  #   ==> ERROR: A failure occurred in package().
  # without indicating any sort of failure.
  dotnet publish --configuration Release Jellyfin.Server --output "$PWD"/publish
  # Clean up the runtimes folder (keep linux-*)
  rm -rfv publish/runtimes/{alpine-*,osx*,tizen-*,win*}
}

package() {
  mkdir -p "$pkgdir"/usr/lib
  cp -dr --no-preserve='ownership' $pkgname-$pkgver/publish "$pkgdir"/usr/lib/jellyfin

  install -Dm 644 jellyfin.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 jellyfin.sysusers "$pkgdir"/usr/lib/sysusers.d/jellyfin.conf
  install -Dm 644 jellyfin.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/jellyfin.conf
  install -Dm 644 jellyfin.conf "$pkgdir"/etc/conf.d/jellyfin
}

# vim: ts=2 sw=2 et:
