# Maintainer: tytan652 <t+noreply at tytanium dot xyz>
pkgname=proaudio-setup
pkgver=0.1.3
pkgrel=1
pkgdesc="Automatic system configuration for low-latency professional audio"
arch=('any')
url="https://github.com/hoshinolina/proaudio-setup"
license=('MIT')
groups=(
  pro-audio
  realtime
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
  python-wheel
)
depends=(
  irqbalance
  python
  python-click
  realtime-privileges
  sh
  udev
)
install=$pkgname.install
_tag=4dda8cd9870b76a804a27c8c343f5393b93687a1
source=("$pkgname::git+https://github.com/hoshinolina/proaudio-setup.git#tag=$_tag")
sha256sums=('SKIP')

prepare() {
  _files=(
    "80-proaudio-setup.rules"
    "proaudio-setup.service"
    "proaudio-setup.sleep"
  )

  cd $pkgname
  mkdir dist

  for file in ${_files[@]}; do
    sed 's|%PREFIX%|/usr|g' "support/${file}.in" > "dist/${file}"
  done
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}/dist"
  python -m installer --destdir="$pkgdir" *.whl
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
  install -Dm 644 -t "${pkgdir}/usr/lib/udev/rules.d" 80-proaudio-setup.rules
  install -Dm 644 -t "${pkgdir}/usr/lib/systemd/system" proaudio-setup.service
  install -Dm 644 -t "${pkgdir}/usr/lib/systemd/system-sleep" proaudio-setup.sleep
}
