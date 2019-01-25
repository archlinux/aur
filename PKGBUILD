# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=jellyfin
pkgver=10.1.0
# Check at https://github.com/jellyfin/jellyfin/tree/v**PKGVER**/MediaBrowser.WebDashboard
_jellyfin_web_commit=094c1deae91c51b8bbf8ebb16a55758af110f04d
pkgrel=2
pkgdesc='The Free Software Media System'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
depends=('dotnet-runtime' 'ffmpeg' 'imagemagick' 'sqlite')
makedepends=('dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jellyfin/jellyfin/archive/v$pkgver.tar.gz"
        "jellyfin-web-$_jellyfin_web_commit.tar.gz::https://github.com/jellyfin/jellyfin-web/archive/$_jellyfin_web_commit.tar.gz"
        'jellyfin.conf'
        'jellyfin.service'
        'jellyfin.sysusers'
        'jellyfin.tmpfiles'
        '0001-Use-TagLibSharp-Nuget-package.patch')
backup=('etc/conf.d/jellyfin')
sha512sums=('4203b5c4412b3f0684740a9707c13b1096ca329cc705a87c40b5718a6c034a422d8a69424bbf1d765dc01fd716bfdaf633ef8be4784e7a36bf8d3c5206a6e5e3'
            '2e054ea0df918df098fc03500a5a9b0eb2c2cad94bbf72dbc96464cd724b1c642c21b7cbfa775b160b799406cfc05da31e711116ab881b8ceb2a7ece04885130'
            '3a4178268be34d6735c0f86d1300158a17d05cdeaca14807db382aa03e91e8901997f273064a8a7e3f0ccfe7e7c83a32cfd4a95c431678477a79ab12b127ba2f'
            '3ff147dba3625d91d5f3f7e030c473b8d03171cd33693af2e8f3aad852d4914b93bdff678e2c4365a34db94622c3f3bb21c42388abe3c387750fca0dfc5cc372'
            '6fc2638e6ec4b1ee0240e17815c91107b694e5fde72c1bc7956c83067bbeacb632de899b86837e47a0ec04288131b15c20746373b45e0669c8976069a55d627a'
            '20ff19a4697a93fccdf0dfeae74ab49d74fbe5dbe242e4f169c4d4af0955750befc9abd276d9f07f685793dd5ef69d7908761ff934ae3b47b3c3108a7de56438'
            '04d6b59560aeb26c450635b3605a864f69a585e329d3120746f67aad129d76ac4000fd872303fd3f560170abf97f602e79ffd0bc416190032c5be28de5c7f87b')

prepare() {
  cd $pkgname-$pkgver

  cp -r "$srcdir"/jellyfin-web-$_jellyfin_web_commit/. MediaBrowser.WebDashboard/jellyfin-web

  patch -Np1 -i ../0001-Use-TagLibSharp-Nuget-package.patch
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
