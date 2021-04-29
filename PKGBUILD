# Maintainer: thelostpolaris <me [at] lostpolaris [dot] com>

pkgbase='navidrome-git'
pkgname=(navidrome-git)
pkgver=v0.42.0.r15.gbcda53f1
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
makedepends=('go' 'git' 'npm' 'taglib' 'nodejs-lts-fermium')
depends=('ffmpeg')
source=('navidrome-git::git+https://github.com/deluan/navidrome.git'
        'navidrome.service'
        'navidrome.toml'
       )
sha256sums=('SKIP'
            'f35e82317c2e5c87577337d64347c4e5baf12e24e0a7544bbc171c9b37cdfdd4'
            '6e2ef6b6b734abbbae0422bdb4e79f79169962fd9c595d19492612eecf75f579')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    make setup
    make buildall
}

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/usr/bin/navidrome"
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/${pkgname}/navidrome" "$pkgdir/usr/bin/navidrome"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
}

