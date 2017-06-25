# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.3.4.1678
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1' 'qt5.6' 'python')
depends=('teamspeak3>=3.1.0.1')
source=("https://github.com/MGraefe/${_pkgname}/archive/${pkgver}.tar.gz"
        '0001-Fixed-linux-compilation.patch::https://github.com/MGraefe/RP-Soundboard/commit/187aaf35b00debdd29a980765df3b64fd17354dd.patch'
        '0002-Fixed-refactoring-error.patch::https://github.com/MGraefe/RP-Soundboard/commit/0e503743b7db748ecd63d53fce80469b75ee2c54.patch'
        '0003-Fixed-potential-memory-leaks.patch::https://github.com/MGraefe/RP-Soundboard/commit/fc07edb336aae5a3f3c79572a186c7b65045aa56.patch'
        'build-fixes.patch')
sha256sums=('71a6484cf58a5bfea23258d71327256001ac942e55ab44ddea786580a864b7ed'
            '550ff571a032528bcd934258a3b051a740153c16d10151fde3fc8692e0c22600'
            'de2fafb177346d1f0f077f634e8e603730651c651a03947bd9bda5ae54386f8e'
            '5b276b78c55e489be85616e2a0a0c567bc667fe6f6b78b1c3bc093a9abe637e0'
            '0341a960209a2b64dddcbb417d3976d6415e41d4f4e61c43a7f372e175327a53')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/0001-Fixed-linux-compilation.patch"
  patch -p1 -i "${srcdir}/0002-Fixed-refactoring-error.patch"
  patch -p1 -i "${srcdir}/0003-Fixed-potential-memory-leaks.patch"
  patch -p0 -i "${srcdir}/build-fixes.patch"

  cd src/version
  python version.py
}

build() {
  cd "${_pkgname}-${pkgver}/qt-linux"

  export TS3DIR=/opt/teamspeak3
  /opt/qt5.6/bin/qmake ts3soundboard_linux.pro

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 bin/release_lin/librp_soundboard.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
