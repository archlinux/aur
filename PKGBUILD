# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: nucularjohn <nucularjohn@gmail.com>
_pkgbasename=open-stage-control
pkgname=$_pkgbasename-node
pkgver=1.6.0
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application (node-only package)'
arch=(i686 x86_64 armv7h aarch64)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('nodejs')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
optdepends=('python-rtmidi: send and receive midi messages')
makedepends=('npm' 'rsync')
source=("https://github.com/jean-emmanuel/$_pkgbasename/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('f5a2c2d4856017f43228509571fd2c87ec08a8b1ba1dc0fe48f03976423e3be0')
_platform=linux
case "$CARCH" in
  i686)
    _arch=ia32
    ;;
  x86_64)
    _arch=x64
    ;;
  armv7h)
    _arch=armv7l
    ;;
  aarch64)
    _arch=arm64
    ;;
esac

prepare() {
  cd "$srcdir/$_pkgbasename-${pkgver//_/-}"

  cat > "$_pkgbasename-node" << EOF
#!/bin/bash
node /usr/share/$_pkgbasename-node/index.js "\$@"
EOF
}

build() {
  cd "$srcdir/$_pkgbasename-${pkgver//_/-}"

  # Use PKBUILD conforming environment variables and allow redefining the build location.
  sed -i "s/PLATFORM/_platform/g" scripts/package.js
  sed -i "s/ARCH/_arch/g" scripts/package.js

  # Make sure to run this inside build() with non-fakeroot privileges
  npm install --arch=$_arch
  npm run build
}

package() {
  cd "$srcdir/$_pkgbasename-${pkgver//_/-}"

  npm run package-node

  install -d "$pkgdir/usr/share/"
  rsync -a dist/$_pkgbasename-node/ "$pkgdir/usr/share/$_pkgbasename-node"

  install -Dm755 "$_pkgbasename-node" "$pkgdir/usr/bin/$_pkgbasename-node"
}
