# Maintainer: Fredrick Brennan <admin@8chan.co>
pkgname=waifu2x-git
pkgver=r264.0149e06
pkgrel=1
pkgdesc="Image rescaling and noise reduction using the power of convolutional neural networks"
arch=('x86_64')
url=""
license=('MIT')
groups=()
depends=('opencl-headers' 'ocl-icd' 'opencv')
makedepends=('git' 'cmake' 'make')
optdepends=('cuda: Significantly speeds up operations, but only works with NVIDIA GPU')
provides=('waifu2x' 'waifu2x-converter-cpp')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/tanakamura/waifu2x-converter-cpp.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'
gitreponame="waifu2x-converter-cpp"

prepare() {
  sed -i "s/waifu2x-converter-cpp/waifu2x/g" $gitreponame/CMakeLists.txt
}

build() {
  cd $gitreponame
  #
  # BUILD HERE
  #
  cmake -DINSTALL_MODELS=on .
  make
}

package() {
  ## Waifu2x's Makefile has no `install`
  ## Just copy its binary, and some files it require...
  make DESTDIR=$pkgdir install -C$gitreponame
  install -D ../waifu2x.1.gz $pkgdir/usr/share/man/man1/waifu2x.1.gz
}

# From https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
  cd $gitreponame
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  msg 'Running Waifu2x'\''s test suite. Depending on your processor and GPU, this may take a while.'
  make test ARGS="-V" -C$gitreponame
}

# vim:set ts=2 sw=2 et:
