# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=platformio-core
pkgname=(platformio-core platformio-core-udev)
pkgver=6.1.18
pkgrel=6
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
  modified-41c8e63cd5a1bf0800bb01559b1acd01e97bbc94.patch
  modified-d787648e71f7d910e367e12abc7382904e6fe7df.patch
  disable-telemetry.patch
  disable-self-upgrades.patch
)
sha512sums=('0b184c0a87ade643712c48fb54ee75f2bed0fb7005d7aa9ed6cf76c66925086b7901a78ef7cc173b8e12ad8f7dead5aab764b049823207c85a755456386eb804'
            '0772441bdb8df1ec001320d603bbc00085119db6a7b395dd224ac0cf6111c3083e195b21da99a25f31b6bb85bb397d116412ada9a881b4ce3227e05750511ba4'
            '34572d46e44b10801a72e621240fa5dd868c2b62e94fbc2f2f2045531c22db007147c65d87c3b95b4f540453aa50c02b305a928802115285d6ed914c5da9aa8b'
            'b9a7f6c6187550743eb2d018e4107fc943b8080ccf9ea8802fb2dfe042e4df5389c5aedab13044d76cef7ef40799504665b8dab9a7504279f0ddc0ff8fe09447'
            '8c9ab1380ba14ca91f0bf74ef0865cc73ba93b739a817888d329ee2f4f11b617d45ba42ffbb4d3d8ff90d6756c3667d2ef038d872ff60c31ee878080181640d5')
b2sums=('5672757bdfedbc55d238b06cace136d0d1afe7a9a70172f8d580f6875960be272dd9ea392c36e9f39bbc9bb596fd45864217396b38e8da09f1483fc21a4268f2'
        '0379494f3b6596e5c675907d87d7b0f0f0c0c74d23091369596822c3a9ba3053f8cf323a2825f93e376de7ae12e6ef6b517b69db2f7a3ce2ffdf9f2260c4704f'
        '83e2dc0e3112e6814a7207f4dad7ec20944f5bd790cab9502b6cdd58e38ab49ac2dd533f56c886f42cf8cd89d68c998b48fc8aee9b85bc542872b47a344cfc87'
        'f56c2ecd218d8c9ef45c5c434227ae9c73ed137437f67308f26be7212fc62ba1e9307154449854b0fcd8f0e2d42eaba6dc37ea8782092f4b845eaeaf0a344ced'
        'be0b47fa220a80c30b0e3d495bb9d001d9ccf9bc0703a1f7324cd20e61186aec7a0da905b11e192327a373a9175c54082c6d3ae156f5b699611195e74ea7e3ff')

prepare() {
  cd "$pkgname"

  # fix custom build flag regression
  # https://github.com/platformio/platformio-core/commit/d787648e71f7d910e367e12abc7382904e6fe7df
  patch -p1 -i "$srcdir/modified-d787648e71f7d910e367e12abc7382904e6fe7df.patch"

  # fix rfc2217 serial port urls
  # https://github.com/platformio/platformio-core/issues/5225
  git cherry-pick --no-commit 8df56dfbb26e8ccb4f201401df595c6bf67bd968


  # python 3.14 support
  # https://github.com/platformio/platformio-core/commit/41c8e63cd5a1bf0800bb01559b1acd01e97bbc94
  patch -p1 -i "$srcdir/modified-41c8e63cd5a1bf0800bb01559b1acd01e97bbc94.patch"

  # python 3.14 deprecation of codecs.open()
  # https://github.com/platformio/platformio-core/commit/5f8c97fbaf0d35e415a9d3f18d07d58266c31bbd
  git cherry-pick --no-commit 5f8c97fbaf0d35e415a9d3f18d07d58266c31bbd

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
