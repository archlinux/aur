# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=(platformio-core platformio-core-udev)
pkgver=6.1.19
pkgrel=1
pkgdesc='An open source ecosystem for IoT development'
arch=(any)
url='https://platformio.org'
license=(Apache-2.0)
depends=(
  python
  python-bottle
  python-click
  python-colorama
  python-pyserial
  python-requests
  python-semantic-version
  python-tabulate
  python-pyelftools
  python-marshmallow
  python-zeroconf
  python-ajsonrpc
  python-starlette
  python-wsproto
  uvicorn
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'platformio-core-udev: Udev rules for PlatformIO supported boards/devices'
)
source=(
  "$pkgbase::git+https://github.com/platformio/platformio-core#tag=v$pkgver"
  disable-telemetry.patch
  disable-self-upgrades.patch
)
sha512sums=('2e20d1d560244289dd4371261b5299f235e15ffe793dcfd4fc8d055088d98400b9b115348d9e742edbba818226605b2de6017bb6a2ea6af4f31205498c8658cb'
            'b9a7f6c6187550743eb2d018e4107fc943b8080ccf9ea8802fb2dfe042e4df5389c5aedab13044d76cef7ef40799504665b8dab9a7504279f0ddc0ff8fe09447'
            '8c9ab1380ba14ca91f0bf74ef0865cc73ba93b739a817888d329ee2f4f11b617d45ba42ffbb4d3d8ff90d6756c3667d2ef038d872ff60c31ee878080181640d5')
b2sums=('70346168c5faadbcb80fc0fb8343ce5e1e8c559bdd9582648507b6abccb00628746eb8039afbd1a3cfc42dc32b5572eaae584ac46ee9a55c76993a71d83a5384'
        'f56c2ecd218d8c9ef45c5c434227ae9c73ed137437f67308f26be7212fc62ba1e9307154449854b0fcd8f0e2d42eaba6dc37ea8782092f4b845eaeaf0a344ced'
        'be0b47fa220a80c30b0e3d495bb9d001d9ccf9bc0703a1f7324cd20e61186aec7a0da905b11e192327a373a9175c54082c6d3ae156f5b699611195e74ea7e3ff')

prepare() {
  cd "$pkgname"

  # disable telemetry
  patch -p1 -i "$srcdir/disable-telemetry.patch"

  # disable self upgrades
  patch -p1 -i "$srcdir/disable-self-upgrades.patch"
}

build() {
  cd "$pkgbase"

  python -m build --wheel --no-isolation 
}

package_platformio-core() {
  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_platformio-core-udev() {
  depends=('udev')
  optdepends=()
  pkgdesc='Udev rules for PlatformIO supported boards/devices'

  install -vDm644 -t "$pkgdir/usr/lib/udev/rules.d" "$pkgbase/platformio/assets/system/99-platformio-udev.rules"
}
