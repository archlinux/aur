# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>
# aur/onos-git inherited from aur/onos
# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('onos')
conflicts=('onos')
pkgver=2.4.0.SNAPSHOT.r14753.f86cfc9b3cf
pkgname=onos-git
pkgrel=1
pkgdesc="Open Network Operating System"
arch=('any')
depends=('git' 'unzip' 'zip' 'curl' 'python2' 'python')
makedepends=('bazel' 'git')
url="https://www.opennetworking.org/onos/"
options=()
license=('Apache')
source=('onos::git+https://gerrit.onosproject.org/onos'
        'onos.service')
sha256sums=('SKIP'
            'e5f47ddcab03d7a885e4bbde1d3be7f05696e3a2f7677b0345a7909aec5a145e')

pkgver() {
  cd onos
  git show master:core/net/src/main/java/org/onosproject/core/impl/VersionManager.java | grep "Version.version(\"" | cut -d= -f2 | cut -d\" -f2 | sed -z "s/\n//g" | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  bazel > /dev/null
  msg2 "Unpatched bazel version: $(cat "$srcdir/onos/.bazelversion")"
  bazel version | head -1 | cut -d: -f2 | cut -d " " -f2 > "$srcdir/onos/.bazelversion"
  msg2 "Patched bazel version: $(cat "$srcdir/onos/.bazelversion")"
}

build() {
  cd "$srcdir/onos"
  bazel --output_user_root="$srcdir/bazel" build onos
}

package() {
  cd "${pkgdir}"
  mkdir -p opt/onos
  install -Dm 644 "$srcdir/onos.service" -t "$pkgdir/usr/lib/systemd/system"
  install -dm 755 "$pkgdir/usr/bin"
  bsdtar -C ./opt/onos -xkf "$srcdir/onos/bazel-bin/onos.tar.gz" --strip-components=1
  bsdtar -C ./opt/onos/bin -xkf "$srcdir/onos/bazel-bin/onos-admin.tar.gz" --strip-components=1
  bsdtar -C ./opt/onos -xkf "$srcdir/onos/bazel-bin/onos-test.tar.gz" --strip-components=1
  bsdtar -C ./opt/onos -xkf "$srcdir/onos/bazel-bin/karaf.zip" --strip-components=1
  for bin in "$pkgdir/opt/onos/bin"/*; do
    echo "#!/bin/bash" > "$pkgdir/usr/bin/$(basename $bin)"
    echo "/opt/onos/bin/$(basename $bin) \"\$@\"" >> "$pkgdir/usr/bin/$(basename $bin)"
    chmod 755 "$pkgdir/usr/bin/$(basename $bin)"
  done
  rm usr/bin/_*
  rm usr/bin/*.bk

}
