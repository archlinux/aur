# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=rpi_ws281x
pkgname=rpi_ws281x-git
_name=${pkgname%-git}
pkgver=182.14aacad
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
        '0001-Allow-to-adjust-build-directory.patch'
        '0002-Update-help-text-for-default-DMA.patch'
        '0003-Adjust-LED-defs.patch')
sha256sums=('SKIP'
            '26119114589fc5aef067fd1de99b532c27416642aeab9ad1150dcc5badc95b59'
            '2ca78207da848ac22d7c791c564988c9a0a0c407c710fe9540ac57a580c5df1c'
            'daaa7f46c988b7b37f5528361648ff2d830d3b929f0be032a9fdc4a751b9829e')

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
