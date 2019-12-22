# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=libreoffice-slim-git
pkgver=latest
pkgrel=2
pkgdesc="A slimmed down Git version of LibreOffice"
arch=('x86_64' 'i386')
url="https://www.libreoffice.org/community/developers/"
license=('GPL')
makedepends=('git')

_gitroot=https://anongit.freedesktop.org/git/libreoffice/core.git
_gitname=core

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull -r
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "${srcdir}/${_gitname}"

  [[ -d workdir ]] && make clean

  build_hash=$(git log --pretty=%h | head -n1)
  build_date=$(date +%Y%m%d)
  ./autogen.sh\
    --disable-odk\
    --with-package-format=archive\
    --disable-cups\
    --enable-release-build\
    --enable-python=fully-internal\
    --disable-gstreamer-1-0\
    --with-galleries=no\
    --with-java=no\
    --without-fonts\
    --without-help\
    --with-vendor="sxw@chronowerks.de"\
    --with-extra-buildid="built by Chronowerks: ${build_hash}-${build_date}"\
    --with-build-version="${pkgver}-${pkgrel}"
}

build() {
  cd "${srcdir}/${_gitname}"
  make build-nocheck
  cd workdir/installation/LibreOffice/archive/install/en-US
  msg "Extracting LibreOffice Installation Tarball..."
  tar xf *.tar.gz
}

package() {
  cd "${pkgdir}"
  install -d -m755 ${pkgdir}/opt/lo
  cp -r ${srcdir}/${_gitname}/workdir/installation/LibreOffice/archive/install/en-US/LibreOffice*/* ${pkgdir}/opt/lo
}

# vim:set ts=2 sw=2 tw=0 et:
