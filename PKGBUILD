# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ian D. Scott <ian@perebruin.com>

# Use an alternative Qt backend to the SDL default. May not fully work, report issues upstream.
_use_qt_backend="0"

pkgname=warzone2100-git
_gitname=warzone2100
pkgver=r13798.0b4012f09
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://wz2100.net/"
license=('GPL')
depends=('qt5-script' 'sdl2' 'libtheora' 'openal' 'libvorbis' 'physfs' 'ttf-dejavu' 'glew' 'fribidi' 'xorg-xrandr')
if [[ ${_use_qt_backend} == "1" ]]; then
    depends+=('qt5-x11extras')
fi
makedepends=('zip' 'unzip' 'git' 'gawk' 'flex' 'asciidoc')
provides=('warzone' 'warzone2100' 'warzone-svn' 'warzone2100-beta')
conflicts=('warzone2100')
source=('git://github.com/Warzone2100/warzone2100.git'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_add_to_search_path.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_get_last_error.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_get_last_mod_time.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_get_user_dir.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/mods_regular_files.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_is_directory.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_read.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_remove_from_search_path.patch'
        'http://developer.wz2100.net/raw-attachment/ticket/4693/physfs_write.patch')
sha256sums=('SKIP'
            '9bdaf2a539c77952113b636aa16593e23e02d791269810eba42552f725681f19'
            '1bb6ade8105cb17de98e5efa5f296b5c118b98c6cf18215dee6a53c7970b96bd'
            'aa51dfd85ecb1910f727f48d6bd3d63e395963f7d71db6299577e7d399f311fe'
            '160ae877fb60947b8b961883047cb8b6a12fe274f77fb8a7a29abe92c5a42d4c'
            '80a19c2f249fa15f6b98fb71b88e721756ec8388e2279fe63a9fb6d97332418e'
            '2b2f9d08fc4e78ed43d02c8cabe711aabc1f6886923b87158798f258f5dcb148'
            '24f5ff7b839eea202ad0fc1db74b8f4e65c8bb0e1b6c7e42e15949e322450d54'
            '7635cf79d2603cad88164ba2c1bf4f4edce75f1f0f47f6d4f44cf43127c1ed1c'
            '31041f89bc2998a46acbe303b80afbebb6c8661aefe32d165b38a021c989823a')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"

  # Apply PhysFS patches
  patch -Np1 -i "${srcdir}/physfs_add_to_search_path.patch"
  patch -Np1 -i "${srcdir}/physfs_get_last_error.patch"
  patch -Np1 -i "${srcdir}/physfs_get_last_mod_time.patch"
  patch -Np1 -i "${srcdir}/physfs_get_user_dir.patch"
  patch -Np1 -i "${srcdir}/mods_regular_files.patch"
  patch -Np1 -i "${srcdir}/physfs_is_directory.patch"
  patch -Np1 -i "${srcdir}/physfs_read.patch"
  patch -Np1 -i "${srcdir}/physfs_remove_from_search_path.patch"
  patch -Np1 -i "${srcdir}/physfs_write.patch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh

  if [[ $_use_qt_backend == "1" ]]; then
    ./configure --prefix=/usr --with-backend=qt --disable-debug
  else
    ./configure --prefix=/usr --disable-debug
  fi

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
