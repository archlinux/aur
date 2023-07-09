
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://whisparr.servarr.com/v1/update/nightly?version=0.0.0.0&os=linux&runtime=netcore&arch=x64

pkgname="whisparr-nightly"
pkgver=2.0.0.208
pkgrel=1
pkgdesc="Porn download automation for usenet and torrents."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Whisparr/Whisparr"
license=('GPL3')
options=('!strip' 'staticlibs')
depends=('sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'qbittorrent: torrent downloader'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'transmission: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('whisparr')
conflicts=('whisparr')

source_x86_64=("Whisparr.nightly.${pkgver}.linux-core-x64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=x64") 
source_aarch64=("Whisparr.nightly.${pkgver}.linux-core-arm64.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm64") 
source_armv7h=("Whisparr.nightly.${pkgver}.linux-core-arm.tar.gz::https://whisparr.servarr.com/v1/update/nightly/updatefile?version=${pkgver}&os=linux&runtime=netcore&arch=arm")

source=('whisparr.service'
        'whisparr.tmpfiles'
        'whisparr.sysusers'
        'package_info')

sha512sums=('9d339f083fac209ad19b00b072c4863e608b9d88074eeb572b9f8de5d46facfdaf5893835eb3169dbcff7adb2a8411780f5149830f68fe769119d9533b67add8'
            '86bf3eeed370680eae5ccad9be0caa1fa271461daca0d36c99b6b1a11a4e57a507e664e48ac27c454dea891db04a09766c76899169c335aa386ee90972cd6108'
            'f938315fb803eb25fdf68cc9fbf6cda91589d20e0f41cafb5d6bb319a7642385a183b030e529ca194bac0e7f0ebb6aa992bd5ae18ec802ae6246dfe6cfcfc99d'
            'd63e53264055e7281a0befaa9165f7651ecc2cf105787cc47b551ad4d412dfaa90c03a75d20108e87e0b4975655941a2823aaf22c50083e2250a2cb0a5db0491')
sha512sums_x86_64=('cfe86be6ddf0846a80800bf4c64955fd066a7843235ec7a823c1c36aedaff6bfbe99119efd19b042a3737cb0e4ef3e3398cce724f7d4d207f579b0d5a6ec5384')
sha512sums_aarch64=('7c1f7f82b8c590dca95a30596c3125695d8b73740e7d0c12fc96a4bed91e06831542bd985bcc67923afb9427e522457a8b4369054667f7c1872913ba817ba7c5')
sha512sums_armv7h=('4999b642fb1607bf745a23f01173d52f75c5bbfa3fdeafa8a7583bf2b15b70e4b1a0e8f369494e104421ee1a044d2c8ea3bc9ab1cbb7184721bbfd546571a7ef')


package() {
  rm -rf "${srcdir}/Whisparr/Whisparr.Update"
  install -d -m 755 "${pkgdir}/usr/lib/whisparr/bin"
  cp -dpr --no-preserve=ownership "${srcdir}/Whisparr/"* "${pkgdir}/usr/lib/whisparr/bin"
  chmod -R a=,a+rX,u+w "${pkgdir}/usr/lib/whisparr/bin"
  chmod +x "${pkgdir}/usr/lib/whisparr/bin/Whisparr" "${pkgdir}/usr/lib/whisparr/bin/ffprobe"

  # Disable built in updater.
  install -D -m 644 "${srcdir}/package_info" "${pkgdir}/usr/lib/whisparr"
  echo "PackageVersion=${pkgver}-${pkgrel}" >> "${pkgdir}/usr/lib/whisparr/package_info"

  install -D -m 644 "${srcdir}/whisparr.service" "${pkgdir}/usr/lib/systemd/system/whisparr.service"
  install -D -m 644 "${srcdir}/whisparr.sysusers" "${pkgdir}/usr/lib/sysusers.d/whisparr.conf"
  install -D -m 644 "${srcdir}/whisparr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/whisparr.conf"
}
