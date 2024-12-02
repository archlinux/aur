# Maintainer: gchamon
# Maintainer: yochananmarqos
# https://aur.archlinux.org/packages/fake-background-webcam-git
groups=('modified')

## WIP

pkgname=fake-background-webcam-git
pkgver=r269.eccc742
pkgrel=1
pkgdesc="Faking your webcam background"
arch=('any')
url="https://github.com/fangfufu/Linux-Fake-Background-Webcam"
license=('GPL-3.0-or-later')
depends=(
  'python-cmapy'
  'python-configargparse'
  'python-inotify-simple'
  'python-mediapipe-bin'
  'python-numpy'
  'python-opencv'
  'python-protobuf'
  'python-pyfakewebcam-git'
  'v4l2loopback-dkms'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/lfbw/config.ini')
install='lfbw.install'
source=('git+https://github.com/fangfufu/Linux-Fake-Background-Webcam.git'
        'lfbw@.service'
        'readme.md'
        'config.ini')
sha256sums=('SKIP'
            'ea95498dc51501c4e14008695e9890bd8aa2044a4c45b6fe72a0b9ad17b247a9'
            '65bc57d62f4ac554835c4c7eb0f9bbfc922222337c196861c60d751ab68a54dd'
            '5b8a5cd8d556bd44ee2d42c58e851fea5dbffb12855816c395be7a388c391b98')

pkgver() {
  cd Linux-Fake-Background-Webcam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Linux-Fake-Background-Webcam
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd Linux-Fake-Background-Webcam
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Config
  install -Dm644 "$srcdir/config.ini" -t "$pkgdir/etc/lfbw/"

  # Default background files
  install -Dm644 *.jpg *.png -t "$pkgdir/var/lib/lfbw/default/"

  # Systemd
  install -Dm644 "$srcdir/lfbw@.service" -t "$pkgdir/usr/lib/systemd/system/"

  # Misc
  install -Dm644 config-example.ini "$srcdir/readme.md" -t \
    "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
