#Maintainer: fuzzbop <fuzzbop@gmail.com>

pkgname=mkxp-z-git
pkgver=v1.2.2.r22.g61dfe1c
pkgrel=1
pkgdesc="This is a fork of mkxp intended to be a little more than just a barebones recreation of RPG Maker."
arch=('i686' 'x86_64')
url="https://github.com/inori-z/mkxp-z"
license=('GPL2')
depends=('ruby' 'physfs' 'sdl2_image' 'sdl2_ttf' 'pixman' 'openal' 'libgl' 'libsigc++' 'fluidsynth' 'libmodplug' 'libvorbis' 'flac' 'objfw-git')
makedepends=('git' 'boost' 'mesa' 'vim' 'ninja' 'meson' 'clang')
conflicts=('mkxp')
provides=('mkxp')
install=mkxp-z.install
source=("git+$url.git"
        "git+https://github.com/Ancurio/SDL_sound.git")
md5sums=('SKIP' 'SKIP')


pkgver() {

  # Update version
  cd "${pkgname::-4}"
  git describe --tags --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {

  # Init submodule(s)
  cd "${pkgname::-4}"
  git submodule init
  git submodule update
}

build() {

  # Build custom SDL_sound
  cd SDL_sound
  ./bootstrap
  ./configure --enable-static --disable-shared --prefix="$srcdir" \
              --disable-speex --disable-mikmod
  make install

  # Build mkxp-z
  cd "../${pkgname::-4}"
  export CC=clang
  export CXX=clang
  export OBJC=clang
  export OBJCXX=clang
  export RUBY_VERSION=$(/usr/bin/ruby -e "puts RUBY_VERSION")

  # Setup mkxp-z for current Ruby, EasyPoke option, using custom SDL_SOUND,Static Fluidsynth and system install
  meson setup build -Dmri_version=${RUBY_VERSION::-2} -Dpkg_config_path="$srcdir"/lib/pkgconfig/ -Dworkdir_current=true -Deasypoke=true -Dshared_fluid=true
  cd build
  sed -e 's/--end-group/&,-logg,-lFLAC,-lmodplug'/ -i build.ninja
  ninja -v
}

package() {

  # Install application
  install -Dm755 "$srcdir"/"${pkgname::-4}"/build/mkxp-z."$CARCH" "$pkgdir"/usr/bin/mkxp-z
  
  # Install documentation
  install -Dm644 "$srcdir"/"${pkgname::-4}"/README.md "$pkgdir"/usr/share/doc/mkxp-z/README.md
  install -m644 "$srcdir"/"${pkgname::-4}"/mkxp.json.sample "$pkgdir"/usr/share/doc/mkxp-z
}
