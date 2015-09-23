# Maintainer: Fredrick Brennan <admin@8chan.co>
pkgname=waifu2x-git
pkgver=r250.ca65c93
pkgrel=4
pkgdesc="Image rescaling and noise reduction using the power of convolutional neural networks"
arch=('x86_64')
url=""
license=('MIT')
groups=()
depends=('opencl-headers' 'ocl-icd' 'opencv')
makedepends=('git' 'cmake')
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
  cd $gitreponame

  patch -Np1 -i ../../arch_use_usr_share_for_models.patch
}

build() {
  cd $gitreponame
  #
  # BUILD HERE
  #
  cmake .
  make -j5
}

package() {
  ## Waifu2x's Makefile has no `install`
  ## Just copy its binary, and some files it require...
  binpath='/usr/bin'
  sharepath='/usr/share/waifu2x'
  librarypath='/usr/lib'
  manualpath='/usr/share/man/man1'

  mkdir -p $pkgdir$binpath || true
  mkdir -p $pkgdir$sharepath || true
  mkdir -p $pkgdir$librarypath || true
  mkdir -p $pkgdir$manualpath || true
  cp $gitreponame/$gitreponame $pkgdir$binpath/waifu2x
  cp $gitreponame/libw2xc.so $pkgdir$libpath
  cp ../waifu2x.1.gz $pkgdir$manualpath
  cp -r $gitreponame/models_rgb $pkgdir$sharepath
}

# From https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
  cd $gitreponame
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd $gitreponame
  msg 'Running Waifu2x'\''s test suite. Depending on your processor and GPU, this may take a while.'
  ./runtest
}

# vim:set ts=2 sw=2 et:
