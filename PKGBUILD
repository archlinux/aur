# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-$_name"
pkgver=2.15.0
pkgrel=1
pkgdesc="Portable Hardware Locality is a portable abstraction of hierarchical architectures (32-bit)"
arch=('x86_64')
url="https://www.open-mpi.org/projects/hwloc/"
license=('BSD-3-Clause')
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
  'lib32-libpciaccess'
  # 'lib32-libtool>=2.2.6'
  'lib32-systemd'
)
makedepends=('lib32-gcc-libs' 'lib32-libxml2')
optdepends=('lib32-libxml2: full XML import/export support')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("https://www.open-mpi.org/software/${_name}/v${pkgver%.*}/downloads/${_pkgsrc}.tar.bz2")
sha512sums=('3eca90872686c5887c6430b9d0b1e7ad50942f2afe77d599a79677c55072183809ca3cef2a68f727e8fa12183b4d2da0a5dea06aee4a9ea416059d3df3e18126')
b2sums=('ca80bd11f99af70860adcb95cc3c69292736f4eb230d990b3b8a5ed71302a6e6e7906b3c22480e2d45ee4e7cd83820c561877a1ca4aa8ace757dfd93083e2999')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --sbindir='/usr/bin'
    --sysconfdir='/etc'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --enable-plugins
    --disable-nvml
    --disable-cuda
    --disable-rsmi
  )

  cd "$srcdir/$_pkgsrc"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

check() {
  make check -C "$srcdir/$_pkgsrc"
}

package() {
  cd "$srcdir/$_pkgsrc"
  make DESTDIR="$pkgdir" install

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"
  install -Dm 644 "$srcdir/$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
