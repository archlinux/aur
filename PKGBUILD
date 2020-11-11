# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=syrinscape-online-player
pkgver=1.4.10_p0
pkgrel=3
pkgdesc="Soundscape creator and sound design app for online games"
arch=('x86_64')
url="https://www.syrinscape.com"
license=('Proprietary')
groups=()
makedepends=('recode')
depends=()
options=(!strip)
source=("syrinscape-${pkgver//_/-}-linux-online.tar.gz::https://www.syrinscape.com/online/"
        "local://syrinscape-online-player.desktop"
        )
sha256sums=('2cb55b12b5916d87ba510d11e311f2badc0e2a4ce957e623c45569b93816fe84'  ## syrinscape-${pkgver//_/-}-linux-online.tar.gz
            'SKIP'  ## syrinscape-online-player.desktop
          ) 

# Look away, this is gross
download_func() {
  /usr/bin/curl "https://www.syrinscape.com/online/" 2>&1 | /usr/bin/grep "tar.gz" | /usr/bin/cut -d '"' -f 2 | /usr/bin/recode html..ascii | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-online.tar.gz
}
export -f download_func; export pkgver; DLAGENTS=('https::/bin/bash -c download_func %o %u')

prepare() {
  mkdir -p "${srcdir}/usr/share/applications"
  cp "syrinscape-online-player.desktop" "${srcdir}/usr/share/applications/syrinscape-online-player.desktop"
  sed -i "s/VERSIONNUM/${pkgver//_/-}/g" "${srcdir}/usr/share/applications/syrinscape-online-player.desktop"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "Syrinscape Online Player" "${pkgdir}/opt/Syrinscape Online Player"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv "usr/share/applications/syrinscape-online-player.desktop" "${pkgdir}/usr/share/applications/syrinscape-online-player.desktop"
}

