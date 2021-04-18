# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_plugname='ESeries'
_basename='vcvrack'
_branchname='v1'
pkgname='vcvrack-eseries'
pkgver=1.0
pkgrel=1
pkgdesc='E-Series VCV modules'
url='https://github.com/VCVRack/ESeries'
license=(BSD)
arch=(i686 x86_64)
depends=('vcvrack' 'libsamplerate')
conflicts=('vcvrack-eseries-git')
makedepends=(git zip)
install="$pkgname.install"

source=(
    "$_basename-$_plugname::git+https://github.com/$_basename/$_plugname.git#branch=${_branchname}"
    'vcvrack-eseries.install'
)
sha256sums=(
    SKIP
    'b93fd2a12cdf82d3844c4cfcafcc15a1c923715b1f7a174d4aaec6ddb9f74d4d'
)

build() {
  # define RACK_DIR, so Makefile snippets can be found
  export RACK_DIR="/usr/share/vcvrack"
  # define FLAGS, so headers can be included
  export FLAGS="-I/usr/include/vcvrack -I/usr/include/vcvrack/dep"
  # exporting LDFLAGS for libsamplerate, as the Delay module requires it
  export LDFLAGS="$(pkg-config --libs samplerate) ${LDFLAGS}"
  cd "${_basename}-${_plugname}"
  USE_SYSTEM_LIBS=true make
  USE_SYSTEM_LIBS=true make dist
}

package() {
    cd "${_basename}-${_plugname}"
    install -d "$pkgdir/opt/$_basename/plugins/$_plugname"
    cp -dr --preserve=mode -t "$pkgdir/opt/$_basename/plugins/$_plugname" \
        res plugin.so plugin.json
#    install -D -m644 "dist/$_plugname-$pkgver-lin.zip" \
#        "$pkgdir/opt/vcvrack/$_plugname.zip"
}
