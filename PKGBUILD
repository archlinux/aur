# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=dwarfs
pkgver=0.9.0
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=(
  'fuse3' 'openssl' 'boost-libs' 'jemalloc' 'xxhash' 'fmt'
  'lz4' 'xz' 'zstd' 'brotli' 'libarchive' 'flac'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=(
  'cmake' 'ruby-ronn'
  'python' 'python-mistletoe'
  'boost' 'libevent' 'libdwarf' 'chrono-date'
  'utf8cpp' 'range-v3'
)
source=("$pkgname-$pkgver.tar.xz::https://github.com/mhx/dwarfs/releases/download/v$pkgver/dwarfs-$pkgver.tar.xz"
        0001-Revert-chore-catch-as-needed-see-gh-184.patch)
sha256sums=('02f5d8b445dd409d6b8e5c7aeae7516790deaf806cd4762d77a317c7644203b5'
            '3753d5a778cff8f2418c35b02e67f9fe6491fac4414f8e08044a72c492a6560e')
b2sums=('ac095b8b846d97661a1b3fa9b29dacb722751496d684188f37830c55d394ea1af906f09db7ae683074303d53b58e0f87ccb63dd7c8f75cb19051321d9b3949d5'
        'e41c0c741957c9f06bd87a7d73a816c34ae3535122f5f26e8ec846903361dcc35b5ab9cbbff96459681111ddcfc206652cf359ebf1f6bd3d474ea1b1f6bb6f20')

prepare() {
  cd "$pkgname-$pkgver"

  # Apparently --as-needed does not break anything on arch, so we're keeping it since it's default
  patch -Np1 -i "$srcdir/0001-Revert-chore-catch-as-needed-see-gh-184.patch"
}

build() {
  # Setting up release flags manually here so we get to use `CMAKE_BUILD_TYPE=None`
  # and keep makepkg-defined flags for build
  # cf. https://wiki.archlinux.org/title/CMake_package_guidelines#Fixing_the_automatic_optimization_flag_override
  export CFLAGS="$CFLAGS -DNDEBUG"
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"

  ## In case --as-needed actually break something, simply uncomment this
  # export LDFLAGS="$(echo ${LDFLAGS} | sed 's|,--as-needed||')"

  cmake -B build -S "$pkgname-$pkgver" \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON \
    -D PREFER_SYSTEM_LIBFMT=ON

  cmake --build build
}

package() {
  cmake --install build --prefix "$pkgdir/usr"

  mv "$pkgdir/usr/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/sbin"

  install -Dm0644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
