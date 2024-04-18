# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=syrinscape-online-player
pkgver=1.5.0_p1
pkgrel=1
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
sha256sums=('77af8ad0b582063c2ee8da849e1c029c86953cce1f6e297ef38f551bb4774a6c'  ## syrinscape-${pkgver//_/-}-linux-online.tar.gz
            'SKIP'  ## syrinscape-online-player.desktop
          ) 

# Look away, this is gross
download_func() {
  #/usr/bin/curl "https://syrinscape.com/online/" 2>&1 | /usr/bin/grep "tar.gz" | /usr/bin/cut -d '"' -f 2 | /usr/bin/recode html..ascii | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-online.tar.gz
  /usr/bin/curl "https://syrinscape.com/get-download/syrinscape-${pkgver//_/-}-linux-online.tar.gz?type=linux&version=${pkgver//_/-}" 2>&1 | /usr/bin/grep -P "\tlocation.href" | /usr/bin/cut -d "'" -f 2 | /usr/bin/xargs -n1 /usr/bin/curl -o syrinscape-${pkgver//_/-}-linux-online.tar.gz
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

