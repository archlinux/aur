# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=libreoffice-slim-git
pkgver=latest
pkgrel=5
pkgdesc="A slimmed down Git version of LibreOffice"
arch=('x86_64')
url="https://www.libreoffice.org/community/developers/"
license=('GPL')
makedepends=('git' 'gperf' 'yasm' 'zip' 'unzip')

_gitroot=https://gerrit.libreoffice.org/core
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
    --disable-report-builder\
    --with-package-format=archive\
    --disable-cups\
    --disable-lpsolve\
    --disable-coinmp\
    --disable-pdfimport\
    --disable-crashdump\
    --enable-optimized=yes\
    --enable-lto\
    --disable-gio\
    --enable-release-build\
    --enable-python=fully-internal\
    --disable-mariadb-sdbc\
    --disable-postgresql-sdbc\
    --disable-firebird-sdbc\
    --disable-dconf\
    --disable-ldap\
    --disable-opencl\
    --disable-lotuswordpro\
    --disable-gstreamer-1-0\
    --with-galleries=no\
    --with-java=no\
    --without-fonts\
    --without-help\
    --with-vendor="sxw@chronowerks.de"\
    --with-extra-buildid="built by Chronowerks: ${build_hash}-${build_date}"
}

build() {
  cd "${srcdir}/${_gitname}"
  make
  cd workdir/installation/LibreOffice/archive/install/en-US
  msg "Extracting LibreOffice Installation Tarball..."
  tar xf *.tar.gz

  msg "Patching boostraprc..."
  cd LibreOffice*/program
  sed -i -e 's@^UserInstallation.*@UserInstallation=$SYSUSERCONFIG/libreoffice@g' bootstraprc
}

package() {
  cd "${pkgdir}"
  install -d -m755 ${pkgdir}/opt/lo
  cp -r ${srcdir}/${_gitname}/workdir/installation/LibreOffice/archive/install/en-US/LibreOffice*/* ${pkgdir}/opt/lo
}

# vim:set ts=2 sw=2 tw=0 et:
