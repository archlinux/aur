# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=opentxs-git
pkgver=20141204
pkgrel=1
pkgdesc="Open Transactions library and command line client"
arch=('i686' 'x86_64')
depends=('msgpack' 'openssl' 'pcre' 'protobuf' 'zeromq' 'zlib')
makedepends=('autoconf' 'automake' 'cmake' 'gcc' 'git' 'libtool' 'make' 'pkg-config' 'swig')
optdepends=('gdc: Enable configuration for SWIG Digital Mars D Programing Language support'
            'go: Enable configuration for SWIG Go support'
            'java-environment: Enable configuration for SWIG Java support'
            'mono: Enable configuration for SWIG C-Sharp support'
            'perl: Enable configuration for SWIG Perl support'
            'php: Enable configuration for SWIG PHP support'
            'python: Enable configuration for SWIG Python support'
            'ruby: Enable configuration for SWIG Ruby support'
            'tcl: Enable configuration for SWIG TCL support')
url="https://github.com/Open-Transactions/opentxs"
license=('custom')
source=(git+https://github.com/Open-Transactions/opentxs)
sha256sums=('SKIP')
provides=('open-transactions' 'opentxs')
conflicts=('open-transactions' 'opentxs')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKEYRING_FLATFILE=ON \
        -DAUTOCOMPLETION=OFF \
        -DSIGNAL_HANLDER=ON \
        --debug-output ../
        # -DCSHARP=ON \
        # -DD=ON \
        # -DGO=ON \
        # -DJAVA=ON \
        # -DPERL=ON \
        # -DPHP=ON \
        # -DPYTHON=ON \
        # -DPYTHON_EXECUTABLE=/usr/bin/python \
        # -DPYTHON_INCLUDE_DIR=/usr/include/python3.4m \
        # -DPYTHON_LIBRARY=/usr/lib/libpython3.4m.so \
        # -DRUBY=ON \
        # -DTCL=ON \
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 docs/LICENSE-AND-CREDITS.txt "$pkgdir/usr/share/licenses/opentxs/LICENSE"

  msg 'Installing docs...'
  install -dm 755 "$pkgdir/usr/share/doc/opentxs"
  for _doc in ChangeLog README.md docs scripts; do
    cp -dpr --no-preserve=ownership $_doc "$pkgdir/usr/share/doc/opentxs"
  done

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Installing bash completion...'
  install -Dm 644 scripts/bash_completion.d/opentxs-bash-completion.sh "$pkgdir/usr/share/bash-completion/completions/opentxs"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
