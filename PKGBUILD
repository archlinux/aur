pkgname=nelson-git
pkgver=r4037.5d618a09f
pkgrel=1
pkgdesc='an array programming language'
arch=('x86_64')
url='https://github.com/nelson-lang/nelson/'
license=('LGPL3')
depends=(alsa-lib binutils brotli bzip2 curl db5.3 dbus double-conversion duktape \
	 e2fsprogs expat flac fontconfig freetype2 gcc-libs glib2 glibc graphite \
	 harfbuzz hwloc icu jack2 keyutils krb5 lame libb2 libcap libevent libfabric \
	 libffi libgcrypt libglvnd libgpg-error libidn2 libnghttp2 libnghttp3 libogg \
	 libpng libproxy libpsl libsndfile libssh2 libunistring libvorbis libx11 libxau \
	 libxcb libxdmcp libxkbcommon libxml2 llvm lz4 md4c mpg123 numactl openmpi openpmix \
	 openssl openucx opus pcre2 portaudio qt6-base qt6-declarative qt6-svg systemd-libs \
	 util-linux-libs xz zlib zstd eigen qt6-tools lapack lapacke blas hdf5 libgit2 libmatio)
makedepends=('cmake' 'git' 'boost')
source=("git+https://github.com/nelson-lang/nelson/")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/nelson"
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_C_FLAGS="-Wno-error=format-security" \
    -DCMAKE_CXX_FLAGS="-Wno-error=format-security" \
    -G "Unix Makefiles" \
    -S "$srcdir/nelson" \
    -B build
  cmake --build build

  export PATH=/usr/lib/qt6:$PATH
  cmake --build build -- buildhelp
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
