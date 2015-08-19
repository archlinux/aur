# Submitter: Rolinh <robinDOThahlingATgw-computingDOTnet>
# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=vqmt-git
_pkgname=vqmt
pkgver=20130910
pkgrel=1
pkgdesc="Video Quality Measurement Tool which can compute PSNR, SSIM, MS-SSIM, VIFp, PSNR-HVS and PSNR-HVS-M metrics"
arch=('x86_64' 'i686')
url="http://mmspg.epfl.ch/vqmt"
license=('custom')
depends=('opencv')
makedepends=('git' 'cmake')
conflicts=('vqmt')
source=()

_gitroot="https://github.com/Rolinh/VQMT.git"
_gitname="$_pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake ./ '-DPREFIX=/usr' '-DCMAKE_BUILD_TYPE=RELEASE'
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/"${_pkgname}"/LICENSE"
}

# vim:set ts=2 sw=2 et:
