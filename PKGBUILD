# Maintainer: robertfoster
pkgname=linux-fake-background-webcam-git
_pkgname="${pkgname%-git}"
pkgver=r247.80f04cf
pkgrel=1
pkgdesc="Virtual background-replacing camera"
depends=('v4l2loopback-dkms'
  'python'
  'python-opencv'
  'opencv'
  'python-numpy'
  'python-requests'
  'python-requests-unixsocket'
  'python-aiohttp'
  'python-inotify-simple'
  'python-pyfakewebcam'
  'python-mediapipe'
  'python-configargparse'
  'python-cmapy')
backup=("etc/$_pkgname/config.ini")
provides=('fake-background-webcam')
conflicts=('fake-background-webcam')
arch=('x86_64')
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=("GPL3")
makedepends=('git')
source=("${pkgname%-git}::git+${url}.git"
  "${pkgname%-git}@.service"
  "${pkgname%-git}.install"
  'config.ini')

sha256sums=('SKIP'
            'bdbea733daf3a655a50bb86d6d5b4499a0596a81d7da0a5394ea838c36cd3907'
            'f939f02c49ac042a5b66dc9a938ceb854598d30df447d4bab217e8321ed4423e'
            '35428ba429d598839c1b7d157c0619a6b99ef1fb52ac35d510ed292d17095c43')

install=${pkgname%-git}.install

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  # Config
  install -Dm644 ../config.ini \
    "$pkgdir/etc/${pkgname%-git}/config.ini"

  # App
  install -Dm755 "fake.py" "$pkgdir/usr/bin/${pkgname%-git}"

  # Default background files
  install -d "$pkgdir/var/lib/${pkgname%-git}/default"  
  install -Dm644 background.jpg foreground.jpg foreground-mask.png \
    "${pkgdir}/var/lib/${pkgname%-git}/default"

  # Systemd
  install -Dm644 "${srcdir}/${pkgname%-git}@.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}@.service"
}
