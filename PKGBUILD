# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic-git
pkgver=v10.2.0.r334.g85716941
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
optdepends=('ffmpeg: transcode support')
makedepends=('java-environment' 'maven')
backup=('etc/airsonic/airsonic.conf')
provides=(airsonic)
conflicts=(airsonic)
source=(git+https://github.com/airsonic/airsonic.git
        airsonic.sysusers
        airsonic.tmpfiles)

sha256sums=('SKIP'
            '25af0b92b247df928db5ac8fec3fb4fa2cdc717e649729d5e0c059a5b81e058e'
            '952c15c8c6b53b9c63a96eb6b2402eae42bde56dc9c6c60484cf039a03a82963')

pkgver() {
  cd airsonic
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/airsonic"
  mvn package -Dmaven.test.skip=true
}

check() {
  cd "${srcdir}/airsonic"
  mvn test
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/var/lib/airsonic"
  mkdir -p "${pkgdir}/var/lib/airsonic/playlists"
  mkdir -p "${pkgdir}/var/lib/airsonic/transcode"
  ln -s /usr/bin/ffmpeg "${pkgdir}/var/lib/airsonic/transcode/ffmpeg"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/etc/airsonic"

  install -Dm644 airsonic/airsonic-main/target/airsonic.war "${pkgdir}/var/lib/airsonic"
  sed -e 's@/var/airsonic@/var/lib/airsonic@' \
      -e 's@/etc/sysconfig/airsonic@/etc/airsonic/airsonic.conf@' \
    airsonic/contrib/airsonic.service > "${pkgdir}/usr/lib/systemd/system/airsonic.service"
  sed -e 's@/var/airsonic@/var/lib/airsonic@' \
    airsonic/contrib/airsonic-systemd-env > "${pkgdir}/etc/airsonic/airsonic.conf"

  install -Dm644 "airsonic.sysusers" "${pkgdir}/usr/lib/sysusers.d/airsonic.conf"
  install -Dm644 "airsonic.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/airsonic.conf"
}
