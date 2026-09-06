# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=platformio-core-optional-udev-rules
pkgver=6.1.19
pkgrel=3
pkgdesc='platformio-core patched with optional udev rules check'
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
conflicts=(platformio-core)
source=(
  "$pkgname::git+https://github.com/platformio/platformio-core#tag=v$pkgver"
  disable-telemetry.patch
  disable-self-upgrades.patch
  remove-dependency-constraints.patch
  starlette-1-port.patch
  optional-udev-rules-check.patch::https://github.com/dimich-dmb/platformio-core/commit/7b771c2b98278fec412af9acb2a4934710854e43.diff
)
sha512sums=('2e20d1d560244289dd4371261b5299f235e15ffe793dcfd4fc8d055088d98400b9b115348d9e742edbba818226605b2de6017bb6a2ea6af4f31205498c8658cb'
            'b9a7f6c6187550743eb2d018e4107fc943b8080ccf9ea8802fb2dfe042e4df5389c5aedab13044d76cef7ef40799504665b8dab9a7504279f0ddc0ff8fe09447'
            '8c9ab1380ba14ca91f0bf74ef0865cc73ba93b739a817888d329ee2f4f11b617d45ba42ffbb4d3d8ff90d6756c3667d2ef038d872ff60c31ee878080181640d5'
            'f1b541e9f34008116278a1a9ec2a3f5cde0351f5445edffdd7c9b9c061a6994f0b0b81b5535fea1f997d0859bf5fa15f3eb6b2a24adce2f0488c3440d97b12eb'
            '27cbefb7b74cff43146040e9a58592c22264339188d0030c96984b40ee088adbfaa3b37465b767404e4cc3d155378283466896defb3805dd31ab6f16a01fa8d5'
            '6ec2d49a0ab652c5bbe52ddd004d8d3ec474683d38957d5d7808577a94204175d46c65244b791bc0fd2649e855faaab07abc7900de744b70286339299f854457')
b2sums=('70346168c5faadbcb80fc0fb8343ce5e1e8c559bdd9582648507b6abccb00628746eb8039afbd1a3cfc42dc32b5572eaae584ac46ee9a55c76993a71d83a5384'
        'f56c2ecd218d8c9ef45c5c434227ae9c73ed137437f67308f26be7212fc62ba1e9307154449854b0fcd8f0e2d42eaba6dc37ea8782092f4b845eaeaf0a344ced'
        'be0b47fa220a80c30b0e3d495bb9d001d9ccf9bc0703a1f7324cd20e61186aec7a0da905b11e192327a373a9175c54082c6d3ae156f5b699611195e74ea7e3ff'
        '31ed61294fa52e1c82da664b70ff10123b6e1cf2726df12c5750b9a4e46e1f56616af7f0954446caf8f9350ca408c3b289b33be73a4bf82bdad7627722d60313'
        '327967ea9f840be2b65802938a259e34ce8679c638b14c777cbc845bcfa7f21e1c18788e2153c503968b604695c9ecc6958eff1109081b466aed3756fa147012'
        'a7e40a938611f0b1e737541578e46bf6ab0fddf148b667db2d8d8aa53799a3205050b65cb7a0eee47a0b8c3e91180d07b5eeb4bf644f7ba084909f06a5b8c505')

prepare() {
  cd "$pkgname"

  # disable telemetry
  patch -p1 -i "$srcdir/disable-telemetry.patch"

  # disable self upgrades
  patch -p1 -i "$srcdir/disable-self-upgrades.patch"

  # remove dependency constraints
  patch -p1 -i "$srcdir/remove-dependency-constraints.patch"

  # fix usage on starlette >= 0.5.x
  patch -p1 -i "$srcdir/starlette-1-port.patch"
 
  # optional udev rules check
  patch -p1 -i "$srcdir/optional-udev-rules-check.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation 
}

package_platformio-core-optional-udev-rules() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
