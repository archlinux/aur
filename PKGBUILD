# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=rpi_ws281x
pkgname=rpi_ws281x-git
_name=${pkgname%-git}
pkgver=173.e4a05d6
pkgrel=1
arch=('armv6h' 'armv7h' 'aarch64')
pkgdesc='Userspace Raspberry Pi PWM library for WS281X LEDs'
license=('BSD')
depends=()
makedepends=('scons' 'git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/jgarff/${_reponame}"
source=("${_reponame}::git://github.com/jgarff/${_reponame}.git"
        0001-Allow-to-adjust-build-directory.patch
        0002-Cast-pointer-to-uintptr_t-instead-of-uint32_t.patch
        0003-Update-help-text-for-default-DMA.patch
        0004-Read-CPU-revision-from-proc-device-tree-on-arm64-clo.patch)
sha256sums=('SKIP'
            'd98ae1d48bc78e78da9488e1519b3751c1a91311fa4f054714f199aa82084436'
            '3013ee02539e3d6120ae8c66db6dfff88ddf79ef38bc7badd11ff87ec2015ef7'
            '4b14dceb422e48036367db0bbcb5fe8152e2b58b2fc213c31775c160512ee45b'
            'f1fac8430be31860324cb14b047182f88d4ab59b7bc186d16c0a782a68b54966')

prepare() {
  cd "$srcdir/$_reponame"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

pkgver() {
  cd "$srcdir/$_reponame"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
  scons
}

package() {
  cd "$srcdir/$_reponame"

  install -Dm0755 "test" "$pkgdir/usr/bin/$_name"
  install -Dm0644 "libws2811.a" "$pkgdir/usr/lib/libws2811.a"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
  for header_file in *.h; do
    install -Dm0644 "$header_file" "$pkgdir/usr/include/$_name/$header_file"
  done
}
