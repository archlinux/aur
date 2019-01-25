# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin-git
pkgver=10.1.0.r57.ge0315b5695
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
        'git+https://github.com/jellyfin/jellyfin-web.git'
        'jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles')
backup=('etc/conf.d/jellyfin')
sha256sums=('SKIP'
            'SKIP'
            'ff3c81ddfd716f179fec8149ea6c2db379e05cd20bd0ffa8ce3ff3a609ca9749'
            '61febaa0bbe71235d724f236223c7315da393b8b481e4bbed86489a343bca51f'
            '9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
            'aa87d52386dde4a2ea4663de2f08249415b2babfefd98d348a96df35dfc36bc0')

pkgver() {
  cd jellyfin
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd jellyfin
  git submodule init
  git config submodule.MediaBrowser.WebDashboard/jellyfin-web.url $srcdir/jellyfin-web
  git submodule update
}

build(){
  cd jellyfin

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
  cp -dr --no-preserve='ownership' jellyfin/publish "$pkgdir"/usr/lib/jellyfin

  install -Dm 644 jellyfin.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 jellyfin.sysusers "$pkgdir"/usr/lib/sysusers.d/jellyfin.conf
  install -Dm 644 jellyfin.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/jellyfin.conf
  install -Dm 644 jellyfin.conf "$pkgdir"/etc/conf.d/jellyfin
}

# vim: ts=2 sw=2 et:
