# Maintainer: Will Elliott <will@gill>

pkgname=fvwm-patched
_pkgname=fvwm
pkgver=2.6.9
pkgrel=1
pkgdesc="A multiple large virtual desktop window manager originally derived from twm with patches"
arch=('x86_64')
url="https://github.com/willscreel/fvwm-patched"
license=('GPL' 'custom')
depends=('fribidi' 'perl' 'libstroke' 'libxpm' 'librsvg' 'libxinerama' 'libxcursor' 'python-xdg')
makedepends=('libxslt')
optdepends=('perl-tk: for ClickToFocus support'
            'perl-x11-protocol: for ClickToFocus support')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!emptydirs' '!makeflags')
source=(https://github.com/fvwmorg/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz
            fvwm.desktop
            01-MiniIconSize.patch
            02-FluxRoundedCorners.patch)
sha256sums=('1bc64cf3ccd0073008758168327a8265b8059def9b239b451d6b9fab2cc391ae'
            '51d345f995f57c6d881d48bf535f71d75041a9bf1f0fa41dd99e1b22fd66aaf3'
            'ceef06afc53282e4a0095994258a7a40708c54bd8decc395eff8bb72d64a6b49'
            '3c44bbf465a89bbb078ce6be2c6e6a02dca02983cec9252c2a628b5210c24c0a')

prepare() {
  cd ${_pkgname}-${pkgver}

  # Enables the use of IconSize for MiniIcons
  echo "Applying 01-MiniIconSize.patch"
  patch --forward --strip=1 --input="${srcdir}/01-MiniIconSize.patch"

  # Enables the use of FluxboxHandles and RoundedCorners
  echo "Applying 02-FluxRoundedCorners.patch"
  patch --forward --strip=1 --input="${srcdir}/02-FluxRoundedCorners.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-stroke-library --enable-mandoc
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/doc/fvwm"
  install -D -m644 ../fvwm.desktop "${pkgdir}/usr/share/xsessions/fvwm.desktop"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
